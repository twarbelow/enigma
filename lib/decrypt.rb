require './lib/enigma'

if ARGV[0] && ARGV[1] && ARGV[2] && ARGV[3]
  msg_file = ARGV[0]
  file = open msg_file
  message = (file.read).chomp
  file.close

  enigma = Enigma.new
  decrypted_hash = enigma.decrypt(message, ARGV[2], ARGV[3])
  decrypted_msg = File.open(ARGV[1], 'w')
  decrypted_msg.write(decrypted_hash[:decryption])

  puts "Created #{ARGV[1]} with the key #{ARGV[2]} and date #{ARGV[3]}"
else
  puts "wrong number of arguments, please check you have the following:"
  puts "- encrypted message file name"
  puts "- file name to write the decrypted message in"
  puts "- the key to use for decryption"
  puts "- the date to use for decryption"
end
