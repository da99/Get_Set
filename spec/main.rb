
require File.expand_path('spec/helper')
require 'Get_Set'
require 'Bacon_Colored'
require 'pry'

Dir.glob('spec/tests/*.rb').each { |file|
  require File.expand_path(file.sub('.rb', '')) if File.file?(file)
}
