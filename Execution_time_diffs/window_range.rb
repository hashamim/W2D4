require "byebug"
def windowed_max_range(arr,w)
    cur_max = 0
    (0..arr.length - w).each do |i|
        min_max = arr[i...i + w].minmax 
        cur_max = min_max[1] - min_max[0] if min_max[1] - min_max[0] > cur_max
    end
    cur_max
end

class MyQueue
    attr_accessor :store
    def initialize
        @store = []
    end
    def peek
        @store.last
    end
    def dequeue
        @store.pop
    end
    def enqueue(a)
        @store.unshift(a)
    end
    def size
        @store.length
    end
    def empty?
        @store.empty?
    end
end

class MyStack
    attr_accessor :store
    def initialize
        @store = []
    end
     def peek
        @store.last
    end
    def pop
        @store.pop
    end
    def push(a)
        @store.push(a)
    end
    def size
        @store.length
    end
    def empty?
        @store.empty?
    end
end

class MyQueueStack
    def initialize(enqueue_stack = MyStack.new,dequeue_stack = MyStack.new)
      
        @enqueue_stack = enqueue_stack
        @dequeue_stack = dequeue_stack
    end
    def dequeue
        debugger
        raise "Dequeue: Stack Empty" if self.empty?
        return dequeue_stack.pop unless dequeue_stack.empty?
        until enqueue_stack.empty?
            dequeue_stack.push(enqueue_stack.pop)
        end
        dequeue_stack.pop
        # debugger
    end
    def enqueue(a)
        # debugger
        enqueue_stack.push(a)
    end
    def size
        enqueue_stack.length + dequeue_stack.length
    end
    def empty?
        enqueue_stack.empty? && dequeue_stack.empty?
    end
    private
    attr_accessor :enqueue_stack, :dequeue_stack
end

class MinMaxStack < MyStack
    attr_accessor :max_ind, :min_ind
    def initialize
        super
    end
    def peek
        store.last
    end
    def pop
        store.pop
    end
    def push_val(value)
        if peek
            max = value > peek[:max] ? value : peek[:max]
            min = value < peek[:min] ? value : peek[:min]
        else
            max = value
            min = value
        end
        # debugger
        push({
            val: value,
            max: max,
            min: min
        })
    end
    def push(hash)
        return push_val(hash) unless hash.is_a?(Hash)
        store.push(hash)
    end
    def size
        store.length
    end
    def empty?
        store.empty?
    end
    def max
        peek[:max]
    end
    def min
        peek[:min]
    end
    def find_new_max
        cur_max = store[0]
        store.each_with_index do |num,i|
            max_ind = i if num >= cur_max           
        end
    end
    def find_new_min
        cur_min = store[0]
        store.each_with_index do |num,i|
            min_ind = i if num <= cur_min
        end
    end
end

# teststack = MinMaxStack.new
# teststack.push(0)
# p teststack.pop
# gets
# teststack.push(0)
# teststack.push(1)
# teststack.push(2)
# teststack.push(5)
# teststack.push(4)
# p teststack.pop until teststack.empty?

# questack = MyQueueStack.new(MinMaxStack.new,MinMaxStack.new)
# questack.enqueue(0)
# p questack.dequeue
# # gets 
# questack.enqueue(1)
# questack.enqueue(3)
# questack.enqueue(2)
# questack.enqueue(5)
# questack.enqueue(4)
# questack.enqueue(7)
# p questack.dequeue
# gets
# p questack.dequeue until questack.empty?
