class PassengerTrain < Train
  def add_car
    cars << PassengerCar.new if speed.zero?
  end

  def initialize(reg_number, cars)
    super(reg_number)
    @type = 1
    @cars = []
    cars.times { add_car }
  end
end
