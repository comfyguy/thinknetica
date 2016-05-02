module CommonMethods
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def all
      ObjectSpace.each_object(self).to_a
    end
  end

  module InstanceMethods
  end
end