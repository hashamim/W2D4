#O(n^2)
def my_min_bad(ints)
    min = int[0]
    ints.each do |int|
        # return int if ints.all?{|other_int| int <= other_int}
        ints.each do |other_int|
            if int <= other_int
                min = int if int < min
            end
        end
    end
    min
end

def my_min_good(ints)
    curr_min = ints[0]
    ints.each do |int|
        if int < curr_min
            curr_min = int
        end
    end
    curr_min
end

# arr = (0..100000).to_a.reverse
# p "arr created"
# p my_min_good(arr)
# p "good done"
# # p my_min_bad(arr)
# # p "bad done"

def largest_contig_sum(arr)
    contig_sums = []
    (0...arr.length).each do |i|
        (0...arr.length).each do |j|
            contig_sums << arr[i..j]
        end
    end
    contig_sums.map!{|sub_sum| sub_sum.sum}
    contig_sums.max
end

def largest_contig_sum_fast(arr)
    cur_val = 0
    max_val = 0
    arr.each do |ele|
        if ele > 0
            cur_val += ele
            max_val = max_val > cur_val ? max_val : cur_val
        elsif ele < 0
            cur_val += ele
            max_val = max_val > cur_val ? max_val : cur_val
            if cur_val < 0
                cur_val = 0
            end
        end
    end
    max_val
end
arr = (-10..10).to_a.shuffle
p arr
p largest_contig_sum(arr)
p largest_contig_sum_fast(arr)

