# frozen_string_literal: true

module Accessors
  def my_attr_accessor(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) { |value| instance_variable_set(var_name, value) }
    end
  end

  def attr_accessor_with_history(*names)
    names.each do |name|
      define_method(name) { instance_variable_get("@#{name}".to_sym) }
      define_method("#{name}_history".to_sym) { instance_variable_get("@#{name}_history".to_sym) }
      define_method("#{name}=".to_sym) do |value|
        instance_variable_set("@#{name}".to_sym, value)
        history = instance_variable_get("@#{name}_history".to_sym) || []
        instance_variable_set("@#{name}_history".to_sym, history << value)
      end
    end
  end

  def strong_attr_accessor(name, class_name)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      raise 'Attribute value class error' if value.class != class_name

      instance_variable_set(var_name, value)
    end
  end
end
