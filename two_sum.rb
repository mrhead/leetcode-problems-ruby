# https://leetcode.com/problems/two-sum/

def two_sum_v1(nums, target)
  nums.each_with_index do |a, index_a|
    nums.each_with_index do |b, index_b|
      next if index_b <= index_a

      if a + b == target
        return [index_a, index_b]
      end
    end
  end
end

def two_sum_v2(nums, target)
  nums.each_with_index do |a, index_a|
    # Skip elements with index <= index_a
    nums[index_a + 1, nums.size].each_with_index do |b, index_b|
      if a + b == target
        return [index_a, index_a + 1 + index_b]
      end
    end
  end
end

def two_sum_v3(nums, target)
  h = {}

  nums.each_with_index do |a, index|
    b = target - a

    if h.has_key?(b)
      return [h[b], index]
    end

    h[a] = index
  end
end

# This is the same algorithm as v3, but this version is faster
def two_sum_v4(nums, target)
  h = {}
  index = 0

  loop do
    a = nums[index]
    b = target - a

    if h.has_key?(b)
      return [h[b], index]
    end

    h[a] = index
    index += 1
  end
end

def two_sum(nums, target)
  two_sum_v4(nums, target)
end

require "minitest/autorun"

class TestTwoSum < Minitest::Test
  def test_two_sum
    assert_equal [0, 1], two_sum([2, 7, 11, 15], 9)
    assert_equal [1, 2], two_sum([3, 2, 4], 6)
    assert_equal [0, 1], two_sum([3, 3], 6)
    assert_equal [9998, 9999], two_sum((1..10_000).to_a, 19999)
  end
end
