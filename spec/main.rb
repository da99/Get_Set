
require File.expand_path('spec/helper')
require 'Get_Set'
require 'Bacon_Colored'

Klass = Class.new {
  
  include Get_Set::DSL
  attr_get_set :name

  def initialize 
    @name = 'Ultra Force'
  end
  
}

Dir.glob('spec/tests/*.rb').each { |file|
  require File.expand_path(file.sub('.rb', '')) if File.file?(file)
}
