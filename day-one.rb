def structure_input(input)
  # put frequencies into an array
  freq = File.readlines(input).map(&:to_i)
  return freq
end

def sum_freq(freq_array)
  sum = 0
  freq_array.each { |i| sum+= i }
  #res = freq_array.inject(0) { |sum, i| sum+i }
  return sum
end

def day_one_part_one(input)
  sum_freq(structure_input(input))
end
  
# Idea: put each new frequency into dictionary and increment instances of value
def day_one_part_two(input)
  sum = 0
  repeat = 1
  freq_res = Hash.new(0)
  while repeat != 0 do
    freq_array = structure_input(input).each do |i|
      sum+=i
      x = freq_res[sum]+=1
      if (x == 2)
        repeat = 0
        puts "returning now"
        break
      end
    end
  end
  return sum
end

def day_one
  # read captcha file
  input_file_path = File.expand_path("../input.txt", __FILE__)
  puts "Day one part one result is #{day_one_part_one(input_file_path)}"
  puts "Day one part two result is #{day_one_part_two(input_file_path)}"
end

puts day_one


