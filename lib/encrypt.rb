require './lib/key'
require './lib/offset'
require './lib/rotation'
require './lib/enigma'

@enigma = Enigma.new
@files = ARGV

def optional_arg_input
  original_message = File.open("text/#{@files[0]}", "r").read.chomp
  arg = File.read("text/#{@files[0]}").split("\n")
  if arg[1].nil? || arg[2].nil?
    @enigma.encrypt(original_message)
  else
    @enigma.encrypt(original_message, arg[1], arg[2])
  end
end

encryption = optional_arg_input

File.open("text/#{@files[1]}", "w").write(encryption[:encryption].split("\n").first)

puts "Created #{@files[1]} with the key #{encryption[:key]} and date #{encryption[:date]}"
