

describe "Get_Set! :@var" do
  
  behaves_like :dsl
  
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
  
  behaves_like :dsl
  
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
