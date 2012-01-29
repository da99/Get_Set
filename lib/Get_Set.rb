require "Get_Set/version"
require 'Checked'

module Get_Set
  
  module DSL
    
    include Checked::DSL

    def Get_Set! *args
      Size! args, 1..2
      name = args.shift
      raise ArgumentError, "Instance variable #{name.inspect} has not been defined." unless instance_variable_defined?(name)

      if args.empty?
        instance_variable_get name
      else
        instance_variable_set name, args.first
      end
    end
    
  end # === module DSL
  
end # === module Get_Set
