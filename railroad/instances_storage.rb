module InstancesStorage
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    @@all = {}

    def all
      @@all
    end
  end

  module InstanceMethods
    private

    def store_instance
      self.class.superclass.all[id] = self
    rescue NoMethodError
      self.class.all[id] = self
    end
  end
end
