require "Get_Set/version"
require 'Checked'

module Get_Set
  
  module DSL
    
    include Checked::DSL

    def self.included klass
      klass.extend Class_Methods
    end

    module Class_Methods
      
      include Checked::DSL
      
      def attr_get_set *names
        Array!(names).symbols!
        names.each { |n|
          class_eval %~
            def #{n} *args
              instance_variable_set( :@#{n}, nil ) unless instance_variable_defined?(:@#{n})
              Get_Set! :@#{n}, *args
            end
          ~, __FILE__, __LINE__
        }
      end
      
    end # === module Class_Methods
    
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
