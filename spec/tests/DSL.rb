
class Klassy

  include Get_Set::DSL
  attr_get_set :name, :notify, :location

  def initialize 
    @name = 'Ultra Force'
  end
  
end # === Klassy

describe "attr_get_set :var" do
  
  before { @klass = Klassy.new }
  
  it 'gets instance variable if no arguments given' do
    t = 'Screaming Viking'
    o = @klass
    o.name t
    o.name.should == t
  end
  
  it 'sets instance variable.' do
    t = 'Quite Viking'
    o = @klass
    o.name t
    o.instance_eval { @name }.should == t
  end
  
  it 'saves more than one argument as Array' do
    t = [ :a, :b, :c]
    @klass.name *t
    @klass.name.should == t
  end
  
  it 'defines method to retrieve value' do
    @klass.name.should == 'Ultra Force'
  end
  
  it 'defines method to set value' do
    @klass.name :Ultra
    @klass.name.should == :Ultra
  end
  
  it 'initializes variable to nil if not defined' do
    @klass.location.should == nil
  end

  it 'saves proc given given to setter as its value' do
    @klass.location {}
    @klass.location.is_a?(Proc).should == true
  end

  it "saves value and proc given to setter as an array" do
    b = Proc.new { :b }
    @klass.location(:a, &b)
    @klass.location.should == [:a, b]
  end
  
  it "saves values and proc given to setter as an array within an array" do
    c = Proc.new { :c }
    @klass.location(:a, :b, &c)
    @klass.location.should == [[:a, :b], c]
  end
  
end # === describe :attr_get_set :name
