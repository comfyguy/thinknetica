class CargoTrain < Train
  def initialize(reg_number, cars)
    @type = 0
    super
  end
  def car_class
    Object.const_get(Train::TYPES[type][:car_class])
  end
end
