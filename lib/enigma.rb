require 'date'

class Enigma
  attr_reader :shift_array, :alphabet
  def initialize
    @shift_array = []
    @alphabet = Hash[("a".."z").to_a.map.with_index { |letter, number| [letter, (number+1)] } ]
alphabet[" "] = 27
  end

  def encrypt(message, key, date = Date.today)
    add_k_o(key, date)
    make_message_array(message)

    # take message, iterate over elements
  end

  def make_message_array(message)
    message.split("")
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

  def add_k_o(key, date)
    k = make_key(key)
    o = make_offset(date)
    o.zip(k) do |o, k|
      shift_array << o+k
    end
    shift_array
  end
end

# notes:

## sum =  key_value_for_letter + (shift_value_for_shift_type % 27)
## if sum > 27
##   p sum - 27
## end
