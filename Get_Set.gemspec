# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "Get_Set/version"

Gem::Specification.new do |s|
  s.name        = "Get_Set"
  s.version     = Get_Set::VERSION
  s.authors     = ["da99"]
  s.email       = ["i-hate-spam-45671204@mailinator.com"]
  s.homepage    = "https://github.com/da99/Get_Set"
  s.summary     = %q{An alternative to :attr_accessor}
  s.description = %q{
    Creates instance method that can both get or set an instance variable.  
  It's like squeezing :attr_writer into :attr_reader.
  }

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "bacon"
  s.add_development_dependency "rake"
  s.add_development_dependency 'Bacon_Colored'
  s.add_development_dependency 'pry'
  
  # s.rubyforge_project = "Get_Set"
  # specify any dependencies here; for example:
  # s.add_runtime_dependency "Checked"
end
