require 'text'

def day_two
  input_file_path = File.expand_path("../input.txt", __FILE__)
  puts "#{checksum(input_file_path)}"
  puts "#{single_distance(input_file_path)}"
end

def checksum(input)
  double = 0
  triple = 0

  # read input which contains ids
  ids = File.readlines(input)
  ids.each do |i|
    id_hash = Hash.new(0)
    i.split('').each do |j|
      id_hash[j]+=1
    end
    if id_hash.has_value?(2)
      double+=1
    end
    if id_hash.has_value?(3)
      triple+=1
    end
  end
  return "checksum is #{double*triple}"
end

def single_distance(input)
  ids = File.readlines(input)
  char_one = []
  char_two = []
  copy_char = []
  ids.each do |i|
    ids.each do |j|
      d = Text::Levenshtein.distance(i, j)
      if (d == 1)
        char_one = i.chars
        char_two = j.chars
      end
    end
  end
  len = 0
  while len < char_one.length do
    if char_one[len] == char_two[len]
      copy_char.append(char_one[len])
    end
    len+=1
  end
  return copy_char.join
end

puts day_two
