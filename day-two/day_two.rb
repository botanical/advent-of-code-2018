def day_two
  input_file_path = File.expand_path("../input.txt", __FILE__)
  checksum(input_file_path)
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

puts day_two
