require 'bassy'

describe Bassy do
  describe ".convert" do

    context "supplied with only two arguments" do
      it "converts from given base to base 10" do
        number = 12
        base = 8
        expected = '10'
        expect(Bassy.convert(number, base)).to eql expected
      end
    end

    context "converting between same bases" do
      it "returns the given number" do
        number = 5
        from = 10
        to = 10
        expect(Bassy.convert(number, from, to)).to eql number.to_s
      end
    end

    it "should only convert between bases 2 and 36" do
      expect{Bassy.convert(56,49)}.to raise_error ArgumentError
      expect{Bassy.convert(19,19)}.to_not raise_error
    end

    it "converts from base to decimal" do
      number = 'C'
      from = 16
      to = 10
      expected = '12'
      expect(Bassy.convert(number, from, to)).to eql expected
    end

    it "converts from base 10 to base 36" do
      number = 521
      from = 10
      to = 36
      expected = 'EH'
      expect(Bassy.convert(number, from, to)).to eql expected
    end

    it "converts from binary to octal" do
      number = 1010
      from = 2
      to = 8
      expected = '12'
      expect(Bassy.convert(number, from, to)).to eql expected
    end
  end
end
