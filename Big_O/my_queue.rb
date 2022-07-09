class MyQueue
    attr_reader :minimum, :maximum ,:store 
    def initialize 
        @store = Array.new(0)
        @minimum = nil 
        @maximum = nil 
    end 

    def peek
        @store[0]
    end 

    def size 
        @store.size 
    end 

    def empty?
        @store.empty?
    end 

    def enqueue(el)
        @store << el
        self.min(el)
        self.max(el)
    end 

    def dequeue
        temp = @store.shift
        if temp < @minimum 
            @minimum = @store.min 
        elsif temp > maximum
            @maximum = @store.max 
        end 
        temp 
    end 

    def min(el)
        if @minimum == nil 
            @minimum = el 
        elsif @minimum > el 
            @minimum = el 
        end 
        @minimum
    end 

    def max(el)
        if @maximum == nil 
            @maximum = el 
        elsif @maximum < el 
            @maximum = el 
        end 
        @maximum
    end 
end 

p que = MyQueue.new
p que.empty?
p que.enqueue(3)
p que.empty?
p que.maximum
p que.minimum
p que.enqueue(5)
p que.enqueue(-1)
p que.enqueue(0)
p que.minimum
p que.dequeue