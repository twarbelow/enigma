require 'date'

class Enigma
  attr_reader :shift_array, :alphabet, :msg_array, :encrypted_msg
  def initialize
    @shift_array = []
    @alphabet = {}
    @msg_array = []
    @encrypted_msg = ""
  end

  def encrypt(message, key, date = Date.today)
    create_shift_array(key, date)
    make_msg_array(message)
    make_alphabet

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
    @alphabet[" "] = 27
  end

  def shift_msg
    encrypted_msg_array = []
    msg_array.each_with_index do |char, index|
      new_value = (alphabet[char]) + shift_array[index % 4]
      until new_value <= 27
        if new_value > 27
          new_value = new_value - 27
        end
      end
      encrypted_msg_array << alphabet.key(new_value)
    end
    @encrypted_msg = encrypted_msg_array.join
  end
end


# notes:

## sum =  key_value_for_letter + (shift_value_for_shift_type % 27)
## if sum > 27
##   p sum - 27
## end
