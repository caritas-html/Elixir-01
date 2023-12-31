defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, result}) do
    result =
      result
      |> String.split(",")
      # converte para inteiro cada elemento da lista de aridade 1
      |> Enum.map(&convert_and_evaluate/1)

    {:ok, result}
  end

  defp handle_file_read({:error, reason}) do
    {:error, "erro reading the file: #{reason}"}
  end

  defp convert_and_evaluate(elem) do
    elem
    |> String.to_integer()
    |> evaluate_numbers()
  end

  defp evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: "FizzBuzz"
  defp evaluate_numbers(number) when rem(number, 3) == 0, do: "Fizz"
  defp evaluate_numbers(number) when rem(number, 5) == 0, do: "Buzz"
  defp evaluate_numbers(number), do: number
end
