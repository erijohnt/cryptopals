#!usr/bin/env ruby

# XOR two same-size hex buffers
def fixedXOR(a = 0x1c0111001f010100061a024b53535009181c, b = 0x686974207468652062756c6c277320657965)
  if a.to_s(16).length == b.to_s(16).length
    res = a ^ b
  else
    # TODO: raise error
    res = 0
    puts "error: diff size arguments"
  end
  res
end


if __FILE__ == $0
  if ARGV.length == 2
    a = ARGV[0]
    b = ARGV[1]
    c = fixedXOR(a.hex, b.hex)
  else
    c = fixedXOR
  end
  printf "%x", c
end
