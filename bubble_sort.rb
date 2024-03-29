# frozen_string_literal: true

# bubble sort function
def bubble_sort(array)
  n = array.length
  while n > 1
    newn = 0
    (1..n - 1).each do |i|
      next unless array[i - 1] > array[i]

      array[i - 1], array[i] = array[i], array[i - 1]

      newn = i
    end
    n = newn
  end
  array
end

# bubble sort by
def bubble_sort_by(array)
  n = array.length
  while n > 1
    newn = 0
    (1..n - 1).each do |i|
      next unless yield(array[i - 1], array[i]).positive?

      array[i - 1], array[i] = array[i], array[i - 1]

      newn = i
    end
    n = newn
  end
  array
end

# test casses
tests = [
  [[2, 3, 4, 1, 26, 9, 10, 4, 10, 15, 70, 23, 57, 29, 0, 12, 33, 100, 33, 77],
   [0, 1, 2, 3, 4, 4, 9, 10, 10, 12, 15, 23, 26, 29, 33, 33, 57, 70, 77, 100]]
]
puts 'test Bubble_sort'
tests.each do |test|
  puts bubble_sort(test[0]) == test[1] ? 'success' : 'Failed',
       'expected:', test[1].to_s, 'Got:', bubble_sort(test[0]).to_s
  puts '  '
end
puts 'test Bubble_sort_BY'
puts bubble_sort_by(%w[hi hello hey]) { |left, right| left.length - right.length }.to_s
puts bubble_sort_by(%w[hi hello hey]) { |left, right| left.length - right.length } == %w[hi hey hello]
