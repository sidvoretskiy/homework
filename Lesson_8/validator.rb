# frozen_string_literal: true

# Module for validation
module Validator
  def self.included(base)
    base.send :include, InstanceMethods
  end
  # Module for validation method
  module InstanceMethods
    def valid?
      validate!
      true
    rescue StandardError
      false
    end
  end
end
