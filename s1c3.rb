#!usr/bin/env ruby
require_relative 's1c1.rb'
require_relative 's1c2.rb'

class Hex
  # get length of hex
  def len
    @hex.to_s(16).length
  end

  # XOR by a single character
  def rot(n = 1)
    mask = n.chr * (self.len / 2)
    mask = Plaintext.new(mask).hexc
    res = fixedXOR(self.hex, mask.hex)
    Hex.new(res)
  end
end

if __FILE__ == $0
end
