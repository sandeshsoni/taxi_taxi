defmodule FareEngine.SurchargeCalculator do
  alias __MODULE__

  # get surcharge
  def get_surcharge() do
    receive do
      {from, demand, vehicles} ->
        send(from, {demand, vehicles, surcharge(demand, vehicles)})
        # get_surcharge()
        # {:get_availability, drop_location, pickup_location} ->
        # send()
      # {:demand_and_supply, demand, supply} ->
        # send(from, {pickup_location, drop_location, surcharge(demand, supply)})
    end
  end

  # vehicles around
  # % of surcharge to add
  defp surcharge(demand, vehicles) when (demand - vehicles) > 10 do
    20
  end
  defp surcharge(demand, vehicles) when (demand - vehicles) > 4 do
    15
  end
  defp surcharge(demand, vehicles) when (demand - vehicles) < 5 do
    10
  end

end
