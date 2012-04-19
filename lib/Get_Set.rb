require "Get_Set/version"

module Get_Set
  
  module DSL
    
    def self.included klass
      klass.extend Class_Methods
    end

    module Class_Methods
      
      def attr_get_set *raw_names
        names = raw_names.flatten.map(&:to_s).sort.map(&:to_sym)
        names.each { |n|
          class_eval %~
            def #{n} *args, &blok
            
              if !args.empty? || block_given?
              
                final = case args.size
                        when 1
                          args.first
                        when 0
                          nil
                        else
                          args
                        end
                        
                if block_given?       
                  final = [final, blok].compact 
                  final = final.first if final.size == 1
                end
                  
                instance_variable_set( :@#{n}, final  )
                
              end
              
              instance_variable_get( :@#{n} )
            end
          ~, __FILE__, __LINE__
        }
      end
      
    end # === module Class_Methods
    
  end # === module DSL
  
end # === module Get_Set
