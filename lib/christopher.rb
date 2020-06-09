require './lib/enigma'

class Christopher < Enigma
  def crack(message, date)
    make_msg_array(message.downcase)
    make_alphabet
    find_shift
    shift_msg("backward")
    @shifted_msg.reverse!
    {decryption: shifted_msg, date: date}
  end

  def find_shift
    predictable_end = ["d", "n", "e", " "]
    msg_array.reverse!.slice(0..3).map.with_index do |letter, index|
      @shift_array << (alphabet[predictable_end[index]] - alphabet[letter]).abs
    end
    shift_array
  end
end
