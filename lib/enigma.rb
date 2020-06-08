require 'date'

class Enigma
  attr_reader :shift_array, :alphabet, :msg_array, :shifted_msg
  def initialize
    @shift_array = []
    @alphabet = {}
    @msg_array = []
    @shifted_msg = ""
  end

  def encrypt(message, key, date = Time.now.strftime("%d%m%y"))
    create_shift_array(key, date)
    make_msg_array(message)
    make_alphabet
    shift_msg("forward")
    {encryption: shifted_msg, key: key, date: date}
  end

  def decrypt(message, key, date = Time.now.strftime("%d%m%y"))
    create_shift_array(key, date)
    make_msg_array(message)
    make_alphabet
    shift_msg("backward")
    {decryption: shifted_msg, key: key, date: date}
  end

  def make_msg_array(message)
    @msg_array = message.split("")
  end

  def make_offset(date)
    num_array = ((date.to_i ** 2) % 10000).to_s.split("")
    num_array.map {|num| num.to_i}
  end

  def make_key(key)
    result = []
    key.length.times do |num|
      if num + 1 < key.length
        element = key.slice(num..num + 1)
        result << element.to_i
      end
    end
    result
  end

  def create_shift_array(key, date)
    k = make_key(key)
    o = make_offset(date)
    o.zip(k) do |o, k|
      shift_array << o+k
    end
  end

  def make_alphabet
    @alphabet = Hash[("a".."z").to_a.map.with_index { |letter, number| [letter, (number+1)] } ]
    @alphabet[" "] = 0
  end

  def shift_msg(direction)
    shifted_msg_array = []
    msg_array.each_with_index do |char, index|
        if direction == "forward"
          new_value = ((alphabet[char]) + shift_array[index % 4]) % 27
        else
          new_value = ((alphabet[char]) - shift_array[index % 4]) % 27
        end
      shifted_msg_array << alphabet.key(new_value)
    end
    @shifted_msg = shifted_msg_array.join
  end
end
