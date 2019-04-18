require "byebug"
def gen_anagrams(str)
    return [str] if str.length == 1
    anagrams = []

    chars = str.chars
    chars.each_with_index do |ch,i|
        substr = chars.dup
        substr.delete_at(i)
        sub_grams = gen_anagrams(substr.join(""))
        sub_grams.each do |sub_gram| 
            sub_gram << ch
        end
        anagrams += sub_grams
    end
    anagrams
end

def anagram?(str1,str2)
    gen_anagrams(str1).include?(str2)
end

def second_anagram?(str1,str2)
    str1.each_char.with_index do |ch,i|
        return false unless i2 = str2.index(ch)
        str2.slice!(i2)
    end
    str2.empty?
end

def third_anagram?(str1,str2)
    str1.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1,str2)
    char_hash = Hash.new(0)
    str1.each_char do |ch|
        char_hash[ch] += 1
    end
    str2.each_char do |ch|
        char_hash[ch] -= 1
    end
    char_hash.values.all?{|i| i == 0}
end


p anagram?("abbc","cba")
p second_anagram?("abcc","acc")

p third_anagram?("abc","cbba")
p fourth_anagram?("abcc","acc")