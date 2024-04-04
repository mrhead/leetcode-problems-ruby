# https://leetcode.com/problems/longest-common-prefix/description/
#
# Runtime 51ms
# Beats 94.10% of users with Ruby

def longest_common_prefix(strs)
  return strs.first if strs.length == 1

  prefix = strs.first

  strs.each do |str|
    n = [prefix.size, str.size].min

    while n > 0
      if prefix[0...n] == str[0...n]
        break
      end

      n -= 1
    end

    prefix = prefix[0...n]

    return prefix if prefix.empty?
  end

  prefix
end

require "minitest/autorun"

class LongestCommonPrefixTest < Minitest::Test
  def test_prefix
    assert_equal "fl", longest_common_prefix(%w(flower flow flight))
    assert_equal "c", longest_common_prefix(%w(cir car))
    assert_equal "car", longest_common_prefix(%w(car))
  end

  def test_no_prefix
    assert_equal "", longest_common_prefix(%w(dog racecar car))
  end
end
