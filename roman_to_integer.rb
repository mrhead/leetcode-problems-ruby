# https://leetcode.com/problems/roman-to-integer/description/

def roman_to_int(s)
  values = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000,
  }

  s.reverse.each_char.inject([0, nil]) do |(value, prev_symbol), symbol|
    if prev_symbol && values[symbol] < values[prev_symbol]
      value -= values[symbol]
    else
      value += values[symbol]
    end

    [value, symbol]
  end.first
end

require "minitest/autorun"

class RomanToIntegerTest < Minitest::Test
  def test_roman_to_integer
    assert_equal 0, roman_to_int("")
    assert_equal 3, roman_to_int("III")
    assert_equal 4, roman_to_int("IV")
    assert_equal 7, roman_to_int("VII")
    assert_equal 9, roman_to_int("IX")
    assert_equal 30, roman_to_int("XXX")
    assert_equal 40, roman_to_int("XL")
    assert_equal 90, roman_to_int("XC")
    assert_equal 400, roman_to_int("CD")
    assert_equal 900, roman_to_int("CM")

    assert_equal 58, roman_to_int("LVIII")
    assert_equal 1994, roman_to_int("MCMXCIV")
  end
end
