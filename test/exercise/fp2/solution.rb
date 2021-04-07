module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for item in self do
          yield item
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new
        for item in self do
          result << yield(item)
        end
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        my_each { |item| result << item unless item.nil? }
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(init = nil)
        head = init.nil? ? self[0] : init
        tail = init.nil? ? self[1..(size - 1)] : self
        tail.my_each { |item| head = yield(head, item) }
        head
      end
    end
  end
end
