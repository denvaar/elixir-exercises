defmodule FindTheMedian do
  @moduledoc """
  Find the median given a list of numbers.

  https://www.hackerrank.com/challenges/find-the-median/problem
  """

  @doc """
  ## Examples
      iex> FindTheMedian.find_median([1, 5, 3, 7, 10, 16, 1], 7)
      5

      iex> FindTheMedian.find_median([10, 2, 9], 3)
      9

      iex> FindTheMedian.find_median([2, -2, 5, -10, -9], 5)
      -2
  """
  def find_median(numbers, n) do
    numbers
    |> Enum.sort()
    |> Enum.at(div(n - 1, 2))
  end
end
