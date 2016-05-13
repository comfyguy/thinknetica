class PassengerTrain < Train
  def self.type_of_car
    PassengerCar
  end

  def self.type_of_train
    'passenger'
  end
end
