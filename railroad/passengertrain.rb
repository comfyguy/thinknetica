class PassengerTrain < Train
  def add_car
    cars << PassengerCar.new if speed.zero?
  end

  def initialize(reg_number, cars)
    super
    @type = 1
  end
end
