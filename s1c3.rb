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
  m = 0x1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736
  h = Hex.new(m)
  for i in 0..224
    secret = h.rot(i).decode
    if secret.ascii_only?
      puts "#{i} : #{secret}"
    end
  end
end
