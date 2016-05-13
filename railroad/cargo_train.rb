class CargoTrain < Train
  def self.type_of_car
    CargoCar
  end

  def self.type_of_train
    'cargo'
  end
end
