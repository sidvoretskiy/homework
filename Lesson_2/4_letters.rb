all_letters = ('a'..'z').to_a
vowels = ['a','e','i','o','u','y']
vowels_hash = Hash.new
all_letters.each_with_index do |l,i|
  if vowels.any?(l)
    vowels_hash[l.to_sym] = i+1
  end
end
