
Get\_Set
========

A Ruby gem that provides an alternative to :attr\_accessor.
The difference is the setters lack *=* sign.

Use It
-----

Install:

    gem install Get_Set

Use:

    require "Get_Set"

    class Uni_Bash
    
      include Get_Set::DSL

      attr_get_set :name, :age, :homes, :var_and_block, :vars_and_block
      
    end

    o = Uni_Bash.new

    # --- Setters
    o.name "Uncle Martin"     
    o.age  190
    o.homes "Mars", "California"
    o.var_and_block(:a) { :b }
    o.vars_and_block(:a, :b, :c) { :d }

    # ---- Getters
    o.name           # --> 'Uncle Martin
    o.age            # --> 190
    o.homes          # --> [ 'Mars', 'California' ]
    o.var_and_block  # --> [ :a, Proc Instance ]
    o.vars_and_block # --> [ [:a, :b, :c], Proc Instance ]</pre>


