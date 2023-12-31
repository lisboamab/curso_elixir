defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "when a valid file is provided, returns the converted list" do
      expected_response =
        {:ok,
         [
           1,
           2,
           :fizz,
           4,
           :buzz,
           :fizz,
           7,
           8,
           :fizz,
           :buzz,
           :fizzbuzz,
           :fizzbuzz,
           :buzz,
           :buzz,
           47,
           :fizzbuzz
         ]}

      assert FizzBuzz.build("numbers.txt") == expected_response
    end

    test "when a invalid file is provided, returns an error" do
      expected_response = {:error, "Error reading the file: enoent"}
      assert FizzBuzz.build("invalid.txt") == expected_response
    end

    test "when there is no number eligible for fizz, buzz or fizzbuzz, return list without changes" do
      expected_response = {:ok, [1,1,1,1,1,1,1,1,1]}
      assert FizzBuzz.build("non_fizz_buzz_numbers.txt") == expected_response
    end
  end
end
