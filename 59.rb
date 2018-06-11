#!/usr/bin/env ruby

FREQUENCY = {
    " ": 14.0,
    "a": 8.167,
    "b": 1.492,
    "c": 2.782,
    "d": 4.253,
    "e": 12.702,
    "f": 2.228,
    "g": 2.015,
    "h": 6.094,
    "i": 6.966,
    "j": 0.153,
    "k": 0.772,
    "l": 4.025,
    "m": 2.406,
    "n": 6.749,
    "o": 7.507,
    "p": 1.929,
    "q": 0.095,
    "r": 5.987,
    "s": 6.327,
    "t": 9.056,
    "u": 2.758,
    "v": 0.978,
    "w": 2.360,
    "x": 0.150,
    "y": 1.974,
    "z": 0.074
}.freeze

KEY_LENGTH = 3

def keys_for_vector(vector)
  (0..255).reduce(Hash.new) do |acc,byte|
    # 0x20..0x7E is the ascii printable character range
    only_printable = vector.all? { |target| (0x20..0x7E).include?(byte ^ target.to_i) }
    next acc unless only_printable

    score = vector.sum do |target|
      candidate = (byte ^ target.to_i)
      value = FREQUENCY[candidate.chr.downcase.to_sym].to_f
      value
    end

    acc[byte] = score if score > 0
    acc
  end
end

def probably_key_for_block(block_vectors)
  possible_keys = block_vectors.map { |vector| keys_for_vector(vector) }
  possible_keys.map { |table| table.max_by { |k,v| v.to_i }&.first }
end

bytes = File.read("59.txt").split(",").map { |byte| byte.to_i }

columns = bytes.group_by.each_with_index { |datum, i| i % KEY_LENGTH }
key = probably_key_for_block(columns.values)

decrypted = bytes.map.with_index do |byte,index|
    ( byte.to_i ^ key[index % KEY_LENGTH].to_i ).chr
end.join

puts decrypted

puts decrypted.each_byte.sum
