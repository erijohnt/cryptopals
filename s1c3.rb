#!usr/bin/env ruby
require_relative 's1c1.rb'
require_relative 's1c2.rb'

class Hex
  def len
    @hex.to_s(16).length
  end

  def rot(n = 1)
    mask = n.chr * (self.len / 2)
    mask = Plaintext.new(mask).hexc
    res = fixedXOR(self.hex, mask.hex)
    Hex.new(res)
  end
end

if __FILE__ == $0
  puts legible
end
