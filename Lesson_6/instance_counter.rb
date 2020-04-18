module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
  module ClassMethods

    attr_accessor :instances
    
  end

  module InstanceMethods
    private
    def register_instance
      self.class.instances ||= []
      self.class.instances << self
    end
  end
end
