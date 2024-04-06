# https://leetcode.com/problems/add-two-numbers/description/
#
# Runtime 70ms
# Beats 94.92% of users with Ruby
#
# This version was inspired by ChatGPT, but I implemented the method from
# scrach once I got an idea how to speed up my previous version that used
# recursion to convert lists to numbers and numbers to lists.

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

def add_two_numbers(l1, l2)
  dummy = ListNode.new(0)
  node = dummy

  carry = 0

  while l1 || l2 || carry > 0
    sum = 0
    sum += l1.val if l1
    sum += l2.val if l2
    sum += carry

    digit = sum % 10
    carry = sum >= 10 ? sum / 10 : 0

    node.next = ListNode.new(digit)
    node = node.next

    l1 = l1.next if l1
    l2 = l2.next if l2
  end

  dummy.next
end


require "minitest/autorun"

class TestAddTwoNumbers < Minitest::Test

  def test_basic_examples
    # 12 + 13 = 25
    test_addition(l1: [2, 1], l2: [3, 1], result: [5, 2])

    # 1 + 12 = 13
    test_addition(l1: [1], l2: [2, 1], result: [3, 1])
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
