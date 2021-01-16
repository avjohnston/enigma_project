require './lib/key'
require './lib/offset'
require './lib/rotation'
require './lib/enigma'

enigma = Enigma.new
files = ARGV

original_message = File.open("text/#{files[0]}", "r").read.chomp

decryption = enigma.decrypt(original_message, files[2], files[3])

decrypted = File.open("text/#{files[1]}", "w").write(decryption[:decryption])

puts "Created #{files[1]} with the key #{decryption[:key]} and date #{decryption[:date]}"
