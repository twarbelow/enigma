require './lib/enigma'

if ARGV[0] && ARGV[1]
  msg_file = ARGV[0]
  file = open msg_file
  message = (file.read).chomp
  file.close

  enigma = Enigma.new
  encrypted_hash = enigma.encrypt(message)
  encrypted_msg = File.open(ARGV[1], 'w')
  encrypted_msg.write(encrypted_hash[:encryption])

  p "Created #{ARGV[1]} with the key #{encrypted_hash[:key]} and date #{encrypted_hash[:date]}"
else
  p "wrong number of argument files"
end
