require_relative '../app/models/word'

seed_file = File.join(File.dirname(File.expand_path(__FILE__)), "words.txt")

File.open(seed_file, 'r') do |file|
  file.readlines.each do |row|
    Word.create!(:word => row.chomp)
  end
end
