# frozen_string_literal: true

# Module for counting instances
module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
  # Module for class instance variable
  module ClassMethods
    attr_accessor :instances
  end
  # Module for register instances
  module InstanceMethods
    private

    def register_instance
      self.class.instances ||= []
      self.class.instances << self
    end
  end
end
