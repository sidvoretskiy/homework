all_letters = ('a'..'z').to_a
vowels = ['a','e','i','o','u','y']
vowels_hash = {}
all_letters.each.with_index(1) do |l,i|
  vowels_hash[l.to_sym] = i if vowels.any?(l)
end
