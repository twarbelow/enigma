class Enigma
  def encrypt(message, key, date)
  end

  def make_offset(date)
    num_array = ((date.to_i ** 2) % 10000).to_s.split(//)
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

  def make_shift(offset, key)
    k = make_key(key)
    o = make_offset(offset)
    shift_keys = [:A, :B, :C, :D]
    k_o= o.zip(k).map do |o, k|
      o+k
    end
    

  end
end
