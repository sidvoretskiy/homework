# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
  # Module for class
  module ClassMethods
    def validate(attr, validation_type, validation_params = '')
      value = instance_variable_get('@validations') || {}
      value[attr] || value[attr] = []
      value[attr] << { validation_type => validation_params }
      instance_variable_set('@validations', value)
    end

    def presence(attr, *_options)
      !!attr
    end

    def format(attr, formate)
      attr&.match?(formate)
    end

    def type(attr, type)
      attr.class == type
    end
  end
  # Module for register instances
  module InstanceMethods
    def validate!
      validations = self.class.instance_variable_get('@validations')
      validations&.each_pair do |attr_name, attr_validations|
        attr_value = instance_variable_get("@#{attr_name}")
        attr_validations.each do |validation|
          validation.each_pair do |val_type, val_options|
            next if self.class.send val_type, attr_value, val_options

            raise "Attribute: #{attr_name} validation type: #{val_type}  #{'validation options: ' if val_options}#{val_options}"
          end
        end
      end
    end

    def valid?
      validate!
      true
    rescue RuntimeError
      false
    end
  end
end

# class Test
#   include Validation

#   attr_accessor :aa, :bb
#   validate :aa, :presence
#   validate :aa, :format, /[a-zа-я0-9]{3}-?[a-zа-я0-9]{2}$/i.freeze
#   validate :aa, :type, String
# end
