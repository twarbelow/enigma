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

  def test_it_can_make_offset
    assert_equal ([1, 0, 2, 5]), @enigma.make_offset("040895")
  end

  def test_it_can_make_key
    assert_equal ([2, 27, 71, 15]), @enigma.make_key("02715")
  end

  def test_it_can_create_shift_array
    @enigma.create_shift_array("02715", "040895")
    assert_equal ([3, 27, 73, 20]), @enigma.shift_array
  end

  def test_it_can_make_msg_array
    @enigma.make_msg_array("hello world")
    assert_equal (["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]), @enigma.msg_array
  end

  def test_it_can_make_alphabet
    @enigma.make_alphabet
    assert_equal ({"a"=>1, "b"=>2, "c"=>3, "d"=>4, "e"=>5, "f"=>6, "g"=>7, "h"=>8, "i"=>9, "j"=>10, "k"=>11, "l"=>12, "m"=>13, "n"=>14, "o"=>15, "p"=>16, "q"=>17, "r"=>18, "s"=>19, "t"=>20, "u"=>21, "v"=>22, "w"=>23, "x"=>24, "y"=>25, "z"=>26, " "=>0}), @enigma.alphabet
  end

  def test_it_can_shift_msg
    @enigma.create_shift_array("02715", "040895")
    @enigma.make_msg_array("hello world")
    @enigma.make_alphabet
    @enigma.shift_msg("forward")
    assert_equal "keder ohulw", @enigma.shifted_msg
  end

  def test_it_can_encrypt
    assert_equal ({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }),
    @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt
    assert_equal ({
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }),
      @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_with_only_key
    assert_equal ({:encryption=>"nib udmcxpu",
      :key=>"02715",
      :date=>Time.now.strftime("%d%m%y")}),
      @enigma.encrypt("hello world", "02715")
  end

  def test_it_can_decrypt_with_only_key
    assert_equal ({:decryption=>"hello world",
      :key=>"02715",
      :date=>Time.now.strftime("%d%m%y")}), @enigma.decrypt("nib udmcxpu", "02715")
  end

  def test_it_can_encrypt_without_key_and_date
    encrypt_hash = @enigma.encrypt("hello world")
    key = encrypt_hash[:key]
    date = encrypt_hash[:date]
    encrypted = encrypt_hash[:encryption]
    assert_equal ({:decryption=> "hello world", :key=> key, :date=> date}), @enigma.decrypt(encrypted, key)
  end
end
