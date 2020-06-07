require "simplecov"
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require './lib/enigma'

class EnigmaTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_can_do_offset
    assert_equal ([1, 0, 2, 5]), @enigma.offset("040895")
  end

  def test_it_can_do_key
    skip
    assert_equal ([2, 27, 71, 15]), @enigma.key("02715")
  end

  def test_it_can_encrypt
    skip
    assert_equal ({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }),
    @enigma.encrypt("hello world", "02715", "040895")
  end
end


# decrypt a message with a key and date
# pry(main) > enigma.decrypt("keder ohulw", "02715", "040895")
#=>
#   {
#     decryption: "hello world",
#     key: "02715",
#     date: "040895"
#   }

# encrypt a message with a key (uses today's date)
# pry(main)> encrypted = enigma.encrypt("hello world", "02715")
#=> # encryption hash here

#decrypt a message with a key (uses today's date)
# pry(main) > enigma.decrypt(encrypted[:encryption], "02715")
#=> # decryption hash here

# encrypt a message (generates random key and uses today's date)
# pry(main)> enigma.encrypt("hello world")
# => # encryption hash here
