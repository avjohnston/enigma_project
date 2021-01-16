require './lib/key'
require './lib/offset'
require './lib/rotation'
require './lib/enigma'

enigma = Enigma.new
files = ARGV

original_message = File.open("text/#{files[0]}", "r").read.chomp

encryption = enigma.encrypt(original_message)

encrypted = File.open("text/#{files[1]}", "w").write(encryption[:encryption])

puts "Created #{files[1]} with the key #{encryption[:key]} and date #{encryption[:data]}"
