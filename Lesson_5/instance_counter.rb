module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
  module ClassMethods
    @@instances = []
    def instances
      @@instances.count {|x| x == self}
    end
    private
    def instances_inc
      @@instances << self
    end
  end

  module InstanceMethods
    private
    def register_instance
      self.class.send :instances_inc
    end
  end
end
