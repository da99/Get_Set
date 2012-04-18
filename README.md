
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
      extend Get_Set

      get_set :name, :age
    end


    o = Uni_Bash.new
    
    # --- Setters
    o.name "Uncle Martin"     
    o.age  190
    
    # ---- Getters
    o.name             
    o.age             


Note
----

If you now of another gem that does the same thing, let me
know through github: "Edit this file", submit project issue, or
send me a message.  I always love to make my stuff obsolete so I can delete
it and use something better.


