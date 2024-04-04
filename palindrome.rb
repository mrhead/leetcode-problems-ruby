# https://leetcode.com/problems/palindrome-number/description/

def is_palindrome(x)
  return false if x < 0

  x.to_s == x.to_s.reverse
end

require "minitest/autorun"

class PalindromeTest < Minitest::Test
  def test_is_palindrome
    assert is_palindrome(121)
    assert is_palindrome(1221)

    refute is_palindrome(-121)
    refute is_palindrome(123)
  end
end
