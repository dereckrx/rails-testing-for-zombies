require 'test_helper'

class ZombieTest < ActiveSupport::TestCase

  def setup
    @z = zombies(:ash)
    @z1 = Factory(:zombie)
    @z2 = Factory(:zombie)
    1000.times { Factory(:zombie) }
    
  end
  
  test "invalid without a name" do 
    @z.name = nil
    assert !@z.valid?, "Name is not being validated."
  end
  
  test "valid with all attributes" do 
    assert @z.valid?, "Zombie was not valid."
  end
  
  # test "invalid name gives error message" do 
  #   @z.name = nil
  #   assert_presence(@z, :name)
  # end
  
  # test "invalid graveyard" do 
  #   @z.graveyard = nil
  #   assert_presence(@z, :graveyard)
  # end
  
  should validate_presence_of(:name)
  should have_many(:tweets)
  
  test "can generate avatar_url" do 
    assert_equal "http://zombitar.com/#{@z.id}.jpg", @z.avatar_url
  end
  
  test "should respond to tweets" do 
    assert_respond_to @z, :tweets
  end
  
  test "should contain tweets" do 
    assert @z.tweets.all? {|t| t.zombie == @z }
  end
  
  test "decapitate status" do 
    @z.weapon.stubs(:slice)
    @z.decapitate
    
    assert_equal "dead again", @z.status
  end
  
  test "decapitate should call slice" do 
    z = FactoryGirl.build(:zombie, status: 'dead')
    z.weapon.expects(:slice)
    z.decapitate
  end
  
  test "geolocate should call graveyard locator" do 
    loc = stub(latitude: 2, longitude: 3)
    @z.weapon.expects(:graveyard_locator).with(@z.graveyard).returns(loc)
    @z.geolocate
  end
  
  test "geolacate returns proper formated lat and long" do
    loc = stub(latitude: 2, longitude: 3)
    @z.weapon.stubs(:graveyard_locator).returns(loc)
    assert_equal "2, 3", @z.geolocate
  end
  
end
