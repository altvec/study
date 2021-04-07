module Exercise
  module Arrays
    class << self
      def max(array)
        array.reduce { |a, b| a > b ? a : b }
      end

      def replace(array)
        max_num = max(array)
        array.map { |num| num.positive? ? max_num : num }
      end

      def search(array, query, min = 0, max = array.length - 1)
        return -1 if min > max

        mid = (min + max) / 2
        if array[mid] == query
          mid
        elsif array[mid] > query
          search(array, query, min, mid - 1)
        else
          search(array, query, mid + 1, max)
        end
      end
    end
  end
end
