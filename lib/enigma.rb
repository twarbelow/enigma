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
    offset.zip(key).map do |offset, key|
      offset+key
    end
  end
end
