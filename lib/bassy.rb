require "bassy/version"

# Encapsulates the functionality of the gem
module Bassy

  # Public facing API to handle the conversion
  # +number+ - the number to convert
  # +from+   - the base to convert from
  # +to+     - the base to convert to
  # Returns a string representation of the the number in the new base
  def self.convert(number, from, *too)
    from = from.to_s
    number = number.to_s

    # Handle case where something is to be converted to decimal
    if too.empty?
      to = 10.to_s
    else
      to = too.first.to_s
    end

    # Can only handle bases upto 36
    fail ArgumentError if [from, to].any? { |a| !(2..36).include? a.to_i }

    # No conversion required if both bases are same
    if from == to
      return number
    else
      convert_base(number, from, to)
    end
  end

  private

  # Handle the actual conversion
  def self.convert_base(number, from, to)
    # A mapping of ordinality
    mapping = create_mapping

    # Convert to decimal first
    dec = number.chars.reduce(0) do |conv, c|
      conv = conv * from.to_i + mapping[c]
    end

    reverse_mapping = mapping.invert

    conv = ""

    # Then convert decimal to the new base
    while dec > 0
      conv << reverse_mapping[dec % to.to_i]
      dec /= to.to_i
    end

    conv.reverse
  end

  # Creates a mapping of ordinality for each character possible till base 36
  def self.create_mapping
    h = {}
    keys = ('0'..'9').to_a
    values = (0..9).to_a
    keys.zip(values) { |k,v| h[k] = v }

    keys = ('A'..'Z').to_a
    values = (10..35).to_a
    keys.zip(values) { |k,v| h[k] = v }
    h
  end
end
