module CommonMethods
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def all
      instances = {}
      ObjectSpace.each_object(self) do |instance|
        instances[instance.id] = instance
      end
      instances
    end
  end

  module InstanceMethods
  end
end