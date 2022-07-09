require 'byebug'
require_relative 'my_queue.rb'
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



# p second_anagram?("gizmo", "sally") 
# p second_anagram?("elvis", "lives")



#nested loop way
def long_two_sum?(arr, target_sum)
    arr.length.times do |i|
        arr.length.times do |j|
            return true if j > i && arr[i] + arr[j] == target_sum
        end
    end
    false
end 

# arr = [0, 1, 5, 7]
# p long_two_sum?(arr, 10) # => should be false
# p long_two_sum?(arr, 6) # => should be true``

# arr = [0, 1,4,5, 7] Target_sum: 6

def sort_two_sum?(arr, target_sum)
    arr.sort!
    i, l = 0, arr.length - 1
   while i < l
    if arr[i] + arr[l] == target_sum
        return true 
    elsif arr[i] + arr[l] < target_sum
        i += 1
    else #arr[i] + arr[l] > target_sum
        l -= 1
    end
   end
   false
end

# arr = [0, 1, 3, 5, 7]
# p long_two_sum?(arr, 10) # => should be false
# p long_two_sum?(arr, 6) # => should be true``



def hash_two_sum?(arr, target_sum)
  hash = {}
  arr.each do |el|
    return true  if hash[target_sum - el]
        hash[el] = true 
  end  
  return false  
end 

# arr = [0, 1, 5, 7]
# p hash_two_sum?(arr, 10) # => should be false
# p hash_two_sum?(arr, 6) # => should be true``

def windowed_max_range(arr, w_size)
    max = 0 
    temp = arr[0...w_size]
    max = temp.max - temp.min

    while temp.length == w_size 
        # debugger 
        arr.shift 
        temp = arr[0...w_size]
        break if temp.length < w_size
        max = temp.max - temp.min if temp.max - temp.min > max
    end
    max 
end 

def queue_max_range(arr, w_size)
    queue = MyQueue.new
    w_size.times do 
        queue.enqueue(arr.shift)
    end 
    max = queue.maximum
    min = queue.minimum
    range = max - min

    arr.each do |ele|
        queue.dequeue 
        queue.enqueue(ele)
        break if queue.size < w_size
        if queue.maximum - queue.minimum > range 
            range = queue.maximum - queue.minimum
        end 
    end
    range 
end 

puts "--------------------------------------"
p queue_max_range([1, 0, 2, 5, 4, 8], 2) 
p queue_max_range([1, 0, 2, 5, 4, 8], 3)  # 0, 2, 5
p queue_max_range([1, 0, 2, 5, 4, 8], 4) 
p queue_max_range([1, 3, 2, 5, 4, 8], 5)