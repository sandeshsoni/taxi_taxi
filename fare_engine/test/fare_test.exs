defmodule FareEngine.FareTest do
  use ExUnit.Case

  alias FareEngine.FareWithSurcharge
  alias FareEngine.SurchargeCalculator

  test "foo bar" do
    # create s_pid
    # send to, from or demand and supply
    fws_pid = spawn(FareWithSurcharge, :fare, [])
    send(fws_pid, {12, 15})
    # Fare after surcharge of 10% will be 1000 only
    # {12, 15}
    # printed in iex shell

    # assert_receive {:success}
    # use self() pid to get message back to self as assert
  end

  test "fare using Tasks" do
    FareEngine.FareWithSurcharge.calculate_fare
  end

end
