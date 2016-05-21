require "bassy/version"

module Bassy
  def self.convert(number, from, *too)
    from = from.to_s
    number = number.to_s

    if too.empty?
      to = 10.to_s
    else
      to = too.first.to_s
    end

    fail ArgumentError if [from, to].any? { |a| !(2..36).include? a.to_i }

    if from == to
      return number
    else
      convert_base(number, from, to)

    end
  end

  private

  def self.convert_base(number, from, to)
    mapping = create_mapping
    dec = number.chars.reduce(0) do |conv, c|
      conv = conv * from.to_i + mapping[c]
    end

    reverse_mapping = mapping.invert
    conv = ""

    while dec > 0
      conv << reverse_mapping[dec % to.to_i]
      dec /= to.to_i
    end

    conv.reverse
  end

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
