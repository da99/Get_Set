

describe "Get_Set! :@var" do
  
  before { extend Get_Set::DSL }
  
  it 'raises ArgumentError if instance variable has not been initialized.' do
    lambda { Get_Set! :@something }
    .should.raise(ArgumentError)
    .message.should.match %r!@something has not been defined!
  end
  
  it 'gets instance variable if array is empty.' do
    @server = :hi
    Get_Set!( :@server ).should == @server
  end
  
end # === describe Get_Set!

describe "Get_Set! :@var, var" do
  
  before { extend Get_Set::DSL }
  
  it 'raises ArgumentError if instance variable has not been initialized.' do
    lambda { Get_Set! :@someg, :hi}
    .should.raise(ArgumentError)
    .message.should.match %r!@someg has not been defined!
  end
  
  it 'sets instance variable.' do
    @server = :hi
    Get_Set!( :@server, :bye)
    @server.should == :bye
  end
  
  it 'returns last value' do
    @server = :hi
    Get_Set!( :@server, :bye ).should == :bye
  end
  
end # === describe Get_Set!

describe ":attr_get_set :name" do
  
  before { @klass = Klass.new }

  it 'defines method to retrieve value' do
    @klass.name.should == 'Ultra Force'
  end
  
  it 'defines method to set value' do
    @klass.name(:Ultra)
    @klass.name.should == :Ultra
  end
  
  it 'initializes variable to nil if not defined' do
    @klass.location.should == nil
  end
  
end # === describe :attr_get_set :name
