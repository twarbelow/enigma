require './lib/enigma'

msg_file = ARGV[0]
open = open msg_file
message = (open.read).chomp
open.close
enigma = Enigma.new

encrypted_hash = enigma.encrypt(message)

encrypted_msg = File.new(ARGV[1])
encrypted_msg{|f| f.write(encrypted_hash[:encryption]) }


p encrypted_hash
p encrypted_msg






# Add a command line interface for encryption and decryption.
# You should create a Runner file called encrypt.rb that takes two command line arguments.
# The first is an existing file that contains a message to encrypt.
# The second is a file where your program should write the encrypted message.
# In addition to writing the encrypted message to the file,
# your program should output to the screen the file it wrote to, the key and the date.

# You should be able to use your CLI like this:
# $ ruby ./lib/encrypt.rb message.txt encrypted.txt
# Created 'encrypted.txt' with the key 82648 and date 240818
