
require File.expand_path('spec/helper')
require 'Get_Set'
require 'Bacon_Colored'

shared :dsl do
  before {
    extend Get_Set::DSL
  }
end

Dir.glob('spec/tests/*.rb').each { |file|
  require File.expand_path(file.sub('.rb', '')) if File.file?(file)
}
