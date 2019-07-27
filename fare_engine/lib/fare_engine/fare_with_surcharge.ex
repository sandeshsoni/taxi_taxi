defmodule FareEngine.FareWithSurcharge do
  alias FareEngine.SurchargeCalculator

  # create a README of problem statement

  def fare do
    # fare_calc_pid = spawn(FareEngine.TicketFareCalculator, :get_fare, [])
    surcharge_calc_pid = spawn(SurchargeCalculator, :get_surcharge, [])
    get_fare(surcharge_calc_pid)
  end

  def get_fare(surcharge_calc_pid) do
    receive do
      {pickup_location, drop_location} ->
        send(surcharge_calc_pid, {self(), pickup_location, drop_location})
        get_fare(surcharge_calc_pid)
      # {:distance_is, pickup_location, drop_location} ->
      #   send()
      {pickup_location, drop_location, surcharge} ->
        fare = surcharge * 100
        IO.puts "Fare after surcharge of #{surcharge}% will be #{fare} only"
    end
  end
end
