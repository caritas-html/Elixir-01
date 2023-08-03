defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  def handle_file_read({:ok, result}) do
    result
    |> String.split(",")
    |> Enum.map(fn x -> String.to_integer(x) end)
  end
  def handle_file_read({:error, reason}) do "erro: #{reason}" end
end
