def my_min(list)
    min = list.first
    (0...list.length).each do |i|
        (i+1...list.length).each do |j|
            if list[i] > list[j] 
                temp = list[j]
                if temp < min 
                    min = temp
                end 
            else 
                temp = list[i]
                if temp < min 
                    min = temp
                end 
            end 
        end 
    end 
    min 
end 

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list) 


def my_min(list)
    min = list.first 
    list.length.times do |i|
        if min >= list[i]
            min = list[i]
        end 
    end
    min 
end 

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list) 


def largest_contiguous_subsum(list)
    arr = []
    list.each.with_index do |num1,i1|
        list.each.with_index do |num2,i2|
            if i2 >= i1 
                arr << list[i1..i2]
            end 
        end 
    end
    max = arr.first.sum 
    arr.each do |sub|
        max = sub.sum if sub.sum > max 
    end 
    max 
end 

# list = [5, 3, -7]
# p largest_contiguous_subsum(list)

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list)

# list = [-5, -1, -3]
# p largest_contiguous_subsum(list)
# [-5, -1, -3]
def largest_contiguous_subsum_super(list)
    #the current cont some
    current = list.first # -5
    #largest - largest cont some so far
    largest = list.first #-5
    (1...list.length).each do |i|
        current = 0 if current < 0 # 0
        current += list[i] #-1
        largest = current if current > largest #-1
    end
largest
end

list = [5, 3, -7]
list = [-5, -1, -3]
# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum_super(list)

#######################################################################
#Anagrams

def first_anagram?(str1,str2)
    str1.split("").sort == str2.split("").sort
end 

def second_anagram?(str1,str2)
    str1.each_char do |char|
        if str2.include?(char)
            i = str2.index(char)
            str2= str2[0...i] + str2[i+1..-1]
        end 
    end
    str2.empty?
end 


def four_anagram?(str1,str2)
    return false if str1.length != str2.length 

    hash1 = Hash.new(0)
    hash2 = Hash.new(0)

    # str1.each_char do |char1|
    #     hash1[char1] += 1 
    # end 
    # str2.each_char do |char2|
    #     hash2[char2] += 1 
    # end 

    (0...str1.length).each do |i|
        key1, key2 = str1[i], str2[i]
        hash1[key1] += 1 
        hash1[key2] += 1 
    end

    hash1.each_value do |val|
        return false if val % 2 != 0 
    end 
    return true 
end 



p second_anagram?("gizmo", "sally") 
p second_anagram?("elvis", "lives")




def two_sum?

end 