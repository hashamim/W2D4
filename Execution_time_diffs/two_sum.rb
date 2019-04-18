require "byebug"
def bad_two_sum?(arr,target)
    (0...arr.length).each do |i1|
        (0...arr.length).each do |i2|
            next if i1 == i2
            return true if arr[i1] + arr[i1] == target
        end
    end
end

def okay_two_sum?(arr,target)
    sorted_arr = arr.sort 
    sorted_arr.each_with_index do |num,i|
        # debugger
        return true if bsearch(arr.take(i) + arr.drop(i+1), target - num)
    end
    false
end

def bsearch(arr,target)
    return false if arr.empty?
    middle = arr.length/2
    return true if arr[middle] == target
    bsearch(arr.take(middle),target) || bsearch(arr.drop(middle+1),target)
end

def two_sum?(arr,target)
    target_hash = Hash.new(false)
    arr.each do |num|
        return true if target_hash[target - num]
        target_hash[num] = true
    end
    false
end

arr = [0,1,2,3,4,5]
target = 10
# p bsearch(arr,-1)
p two_sum?(arr,target)
