# Implement a method each
# 'each' method takes in an array and a block and should run the block on each element of array.

def each(arr)
  # set index value, beginning with the first element at 0
  i = 0
  # while the current index value still exists in the array, run the block of code, stored in yield, on each index, then increase the index value by 1 until the end of the array
  while i < arr.length
    yield(arr[i])
    i += 1
  end
end

# code to run with 'each' method:
each [1,2,3] do |x|
  puts x
end


# Implement a method map
# 'map' method takes in an array and a block and returns a new array with the results of calling a provided block on every element in the array. Try to use above 'each' function.

def map(arr)
  # create empty array to populate with results of called block
  arr2 = []
  # for each element in the array, run the block of code, held in yield, on it then add that element to the new array
  arr.each { |x| arr2 << yield(x) }
  # return the new array, setting the original array to these new values
  arr2
end

# class solution, working off of original each function:
def map2(arr)
  result = []
  each arr do |x|
    results << yield(x)
  end
  results
end

# other class solution:
def map3(arr)
  results = []
  i = 0
  while i < arr.length
    results << yield(arr[i])
    i += 1
  end
  results
end

# code to run with 'map' method:
arr = map([1,2,3]) do |x|
  x * x
end

p arr # => [1,4,9]


# Implement a method reduce
# 'reduce' method takes in an array, an accumulator, and a block. It applies a block against an accumulator and each value of the array reducing it to a single value.

def reduce(arr,acc)
  # for each element in the array, run the block, called by yield, with the accumulator and the current element, then set the new value of accelerator (acc) to the result of that round of the block being run.
  arr.each { |x| acc = yield(acc,x) }
  # return the final value of the accumulator
  acc
end

# solution using above each method
def reduce(arr,acc)
  each arr do |x|
    acc = yield(acc,x)
  end
  acc 
end

# code to run with 'reduce' method
sum = reduce([1,2,3,4,5], 0) do |memo,val|
  memo + val
end

puts sum # => 15


# Implement a method filter
# 'filter' method takes an array and a block. It creates a new array with all elements that pass the test implemented by the provided function
def filter(arr)
  # create new empty array to populate with filtered elements
  arr2 = []
  # for each element in array, check if it passes the test in the block, called by yield, and if it does add it to the new array
  arr.each { |x| arr2 << x if yield(x) }
  # return the new array, setting the original array to these new values
  arr2
end

# solution using initial each funtion
def filter(arr)
  results = []
  each arr do |x|
    if yield(x)
      results << x
    end
  end
  results
end

# code to run with 'filter' method
filt = filter([1,2,3,4,5,6,7,8]) do |x|
  x.even?
end



