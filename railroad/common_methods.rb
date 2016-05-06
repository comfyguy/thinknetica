module CommonMethods
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def all
      instances = {}
      ObjectSpace.garbage_collect
      ObjectSpace.each_object(self) do |instance|
        instances[instance.id] = instance
      end
      instances
    end
    def find(id)
      self.all[id]
    end
    def foreach
      ObjectSpace.garbage_collect
      ObjectSpace.each_object(self) { |obj| yield(obj) }
    end      
  end

  module InstanceMethods
  end
end
