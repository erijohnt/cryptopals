#!usr/bin/env ruby
require 'base64'

# hex obj for holding strings encoded in hex
class Hex
  def initialize(hex = 0x49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d)
    if hex.is_a? Numeric
      @hex = hex
    elsif hex.is_a? String
      @hex = hex.hex
    else
      # TODO: raise error
      puts "ERROR: not given a hex!"
      @hex = 0
    end
  end

  # change hex to base64
  def to_base64()
    table64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    mask = 0b111111
    s = ''
    n = @hex
    until n == 0 || n == -1
      c = table64[mask & n]
      s += c
      n = n >> 6
    end
    s.reverse
  end

  # decode hex to string
  def decode()
    res = @hex.to_s(16)
    res = [res].pack("H*")
  end

  # return Numeric
  def hex
    @hex
  end
end

# plaintext obj for translating strings into hex and base64
class Plaintext
  def initialize(msg)
    @msg = msg
  end

  # encode plaintext in base64
  def to_base64
    [@msg].pack("m*")
  end

  # encode plaintext in hex and place in a new Hex obj
  def hexc
    Hex.new(@msg.unpack("H*").first.hex)
  end

  # encode plaintext in hex
  def hex
    @msg.unpack("H*").first.hex
  end
end

if __FILE__ == $0
  if ARGV[0].nil?
    r = Hex.new()
  else
    r = Hex.new(ARGV[0])
  end
  puts r.to_base64
end
