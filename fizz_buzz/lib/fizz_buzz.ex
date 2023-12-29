defmodule FizzBuzz do

  #def build(file_name) do
    #case File.read(file_name) do
      #{:ok, result} -> result
      #{:error, reason} -> reason
    #end
  #end


  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, result}) do
    response =
      result
      |> String.split(",")
      |> Enum.map(&convert_and_evaluate_numbers/1) #fn number -> String.to_integer(number) end O & e o /1 substitui o codigo ao lado

    {:ok, response}
  end
  defp  handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  defp convert_and_evaluate_numbers(number) do
    number
    |> String.to_integer()
    |> evaluate_numbers()
  end

  defp evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluate_numbers(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_numbers(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_numbers(number), do: number

end
