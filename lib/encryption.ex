defmodule Encryption do
  @moduledoc """
  https://www.hackerrank.com/challenges/encryption/problem

  Some text needs to be encrypted using the following rules:

  - Spaces are removed from the text.
  - Let L equal the length of the text with spaces removed.
  - The text is put into rows and columns where the number of rows
  are greater than or equal to floor(sqrt(L)). The number of columns
  are less than or equal to ceil(sqrt(L)).
  - Ensure that rows * columns >= L
  - If multiple grids satisfy the above conditions, choose the one with the
  minimum area (rows * columns.)

  The final encoded message is obtained from the characters in a column.
  Insert a space between the characters when moving to the next column.
  """

  @doc """

      iex> Encryption.encrypt("have a nice day")
      "hae and via ecy"

      iex> Encryption.encrypt("feed the dog")
      "fto ehg ee dd"

      iex> Encryption.encrypt("chill out")
      "clu hlt io"

      iex> Encryption.encrypt("denver paul smith")
      "deui erlt npsh vam"
  """
  def encrypt(message) do
    txt = prepare(message)
    col_size = column_size(txt)

    Enum.chunk_every(txt, col_size, col_size, List.duplicate("", col_size))
    |> List.zip()
    |> Enum.map(&(Tuple.to_list(&1)))
    |> Enum.join(" ")
  end

  defp prepare(message) do
    message
    |> String.replace(" ", "")
    |> String.graphemes()
  end

  defp column_size(text) do
    length(text)
    |> :math.sqrt()
    |> Float.ceil()
    |> round()
  end
end
