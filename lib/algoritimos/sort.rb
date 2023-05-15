class Sort

    def initialize(array)
        @array = array
    end

    def self.buble(array)
        n = array.size
        loop do
            swapped = false
            (n-1).times do |i|
                if array[i] > array[i+1]
                    array[i], array[i+1] = array[i+1], array[i]
                    swapped = true                    
                end
            end
            break unless swapped
        end
        array
    end

    def self.selection(array)
        n = array.size
        (n-1).times do |i|
            min_index = i
            (i+1...n).each do |j|
                min_index = j if array[j] < array[min_index]
            end
            array[i], array[min_index] = array[min_index], array[i] if min_index != i
        end
        array
    end

    def self.insertion(array)
        n = array.size
        (1...n).each do |i|
            key = array[i]
            j = i -1
            while j >= 0 && array[j] > key
                array[j+1] = array[j]
                j -= 1
            end
            array[j+1] = key            
        end
        array
    end

    def self.quick(array)
        unsorted(array, 0, array.size - 1)
    end

    private
    def self.unsorted(array, left, right)
        if left < right
            pivot = partition(array, left, right)
            unsorted(array, left, pivot - 1)
            unsorted(array, pivot + 1, right)
        end
    end

    def self.partition(array, left, right)
        pivot = array[right]
        i = left - 1
        for j in left...right
            if array[j] <= pivot
                i += 1
                array[i], array[j] = array[j], array[i]                
            end
        end
        array[i+1], array[right] = array[right], array[i+1]
        return i + 1        
    end
end