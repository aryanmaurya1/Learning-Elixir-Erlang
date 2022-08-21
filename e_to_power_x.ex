defmodule Solution do
  def factorial(1) do
    1
  end

  def factorial(n) do
    n * factorial(n - 1)
  end

  def getn() do
    IO.gets("") |> String.trim |> String.to_integer
  end
  def getf() do
    IO.gets("") |> String.trim |> String.to_float
  end

  def term(n, i) do
    if i == 1 do
      1
    else
      :math.pow(n, i-1) / factorial(i-1)
    end
  end

  def process() do
    x = getf()
    1..10
      |> Enum.map(fn t -> term(x, t) end)
      |> List.foldl(0, fn x, acc -> x + acc end)
  end
  
  defp print([real, decimal], i) do
    decimal = String.slice(decimal, 0..i-1)
    IO.puts("#{real}.#{decimal}")
  end

  def format_and_print(n, i) do
    n |> Float.to_string |> String.split(".") |> print(i)  
  end

  def run() do
    1..getn()
      |> Enum.map(fn _x -> process() end)
      |> Enum.map(fn v -> format_and_print(v, 4) end)
  end
end
Solution.run()