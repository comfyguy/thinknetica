class CargoTrain < Train
  def add_car
    cars << CargoCar.new if speed.zero?
  end

  def initialize(reg_number, cars)
    super(reg_number)
    @type = 1
    @cars = []
    cars.times { add_car }
  end
end
