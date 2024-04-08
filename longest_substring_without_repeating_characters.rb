# https://leetcode.com/problems/longest-substring-without-repeating-characters/

def length_of_longest_substring(s)
  seen = Hash.new
  unique_since = 0
  max_size = 0

  s.chars.each_with_index do |char, index|
    if seen.include?(char)
      unique_since = [unique_since, seen[char] + 1].max
    end

    size = index - unique_since + 1
    max_size = [size, max_size].max

    seen[char] = index
  end

  max_size
end

require "minitest/autorun"

class LengthOfLongestSubstringTest < Minitest::Test
  def test_length_of_longest_subsctring
    assert_equal 0, length_of_longest_substring("")
    assert_equal 3, length_of_longest_substring("abc")

    assert_equal 2, length_of_longest_substring("aab")
    assert_equal 3, length_of_longest_substring("abac")
    assert_equal 4, length_of_longest_substring("abcadc")
    assert_equal 4, length_of_longest_substring("abcadcb")

    assert_equal 3, length_of_longest_substring("abcabcbb")
    assert_equal 1, length_of_longest_substring("bbbbb")
    assert_equal 3, length_of_longest_substring("pwwkew")
  end
end
