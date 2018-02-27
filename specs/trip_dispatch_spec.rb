require_relative 'spec_helper'

describe "TripDispatcher class" do
  it "is an instance of TripDispatcher" do
    dispatcher = RideShare::TripDispatcher.new
    dispatcher.must_be_kind_of RideShare::TripDispatcher
  end

  it "establishes the base values when instantiated" do
    dispatcher = RideShare::TripDispatcher.new
    
  end
end
