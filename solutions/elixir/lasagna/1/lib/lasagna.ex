defmodule Lasagna do
  def expected_minutes_in_oven() do
    40
  end

  def remaining_minutes_in_oven(time_cooking) do
    expected_minutes_in_oven() - time_cooking
  end

  def preparation_time_in_minutes(layers_count) do
    2 * layers_count
  end

  def total_time_in_minutes(layers_count, time_cooking) do
    preparation_time_in_minutes(layers_count) + time_cooking
  end

  def alarm() do
    "Ding!"
  end
end
