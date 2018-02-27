defmodule UtopianTree do
  @moduledoc """
  The Utopian tree goes though 2 cycles of growth every year.

  - In the spring, it doubles in height.
  - In the summer, the height increases by 1.
  """

  @doc """
  Print the height of the Utopian Tree after n cycles.

  The first argument is a list that contains the number of cycles for each test case.

  ## Examples

      iex> UtopianTree.height([0, 1, 4])
      [1, 2, 7]

      iex> UtopianTree.height([1, 3, 2, 4])
      [2, 6, 3, 7]

      iex> UtopianTree.height([])
      []

      iex> UtopianTree.height(10..1)
      [63, 62, 31, 30, 15, 14, 7, 6, 3, 2]
  """
  def height(cases) do
    cases
    |> Enum.map(fn(n_cycles) ->
      height_from_cycles(1, n_cycles)
    end)
  end

  defp height_from_cycles(initial_height, n) do
    [fn(x) -> x * 2 end,
     fn(x) -> x + 1 end]
    |> Stream.cycle()
    |> Enum.take(n)
    |> Enum.reduce(initial_height, fn(func, height) -> func.(height) end)
  end
end
