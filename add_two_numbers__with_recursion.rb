# https://leetcode.com/problems/add-two-numbers/description/

class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end

  def ==(other)
    val == other.val && @next == other.next
  end

end

def build_list(numbers)
  return if numbers.empty?

  ListNode.new(numbers.shift, build_list(numbers))
end

def list_to_digits(list)
  digits = [list.val]

  if list.next
    digits.concat(list_to_digits(list.next))
  end

  digits
end

def get_number_from_list(list)
  list_to_digits(list).reverse.join.to_i
end

def add_two_numbers(l1, l2)
  a = get_number_from_list(l1)
  b = get_number_from_list(l2)

  result = a + b

  build_list(result.to_s.chars.reverse.map(&:to_i))
end


require "minitest/autorun"

class TestAddTwoNumbers < Minitest::Test
  def test_get_number_from_list
    assert_equal 123, get_number_from_list(build_list([3, 2, 1]))
  end

  def test_basic_example
    # 12 + 13 = 25
    test_addition(l1: [2, 1], l2: [3, 1], result: [5, 2])
  end

  def test_leetcode_tests
    test_addition(l1: [2, 4, 3], l2: [5, 6, 4], result: [7, 0, 8])
    test_addition(l1: [0], l2: [0], result: [0])
    test_addition(l1: [9,9,9,9,9,9,9], l2: [9,9,9,9], result: [8,9,9,9,0,0,0,1])
  end

  private

  def test_addition(l1:, l2:, result:)
    assert_equal build_list(result), add_two_numbers(build_list(l1), build_list(l2))
  end
end
