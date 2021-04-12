module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&func)
        return self if empty?

        head, *tail = self
        func.call(head)
        [head, *MyArray.new(tail).my_each(&func)]
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(MyArray.new) { |acc, item| acc << yield(item) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) do |acc, item|
          item.nil? ? acc : acc << item
        end
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
