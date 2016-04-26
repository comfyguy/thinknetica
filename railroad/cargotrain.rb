class CargoTrain < Train
  def add_car
    cars << CargoCar.new if speed.zero?
  end

  def initialize(reg_number, cars)
    super
    @type = 0
  end
end
