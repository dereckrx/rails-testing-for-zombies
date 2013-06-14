require 'test_helper'

class ZombiesTest < ActionDispatch::IntegrationTest
  fixtures :all

  # test "Anyone can view zombie info" do 
  #   z = zombies(:ash)
  #   get zombie_url(z)
  #   assert_response :success
  #   assert_select "h1", z.name
  # end
  
  # Capybara replaces previous method with this
  test "Anyone can view zombie info" do 
    z = zombies(:ash)
    visit zombie_url(z)
    
    assert_equal zombie_path(z), current_path
    within("h1") do
      assert has_content?(z.name)
    end
  end
  
  test "nav is avail to the zombie page" do 
    z = zombies(:ash)
    t = tweets(:hello)
    #z = Factory(:zombie)
    #t = Factory(:tweet, zombie: z)
 
    visit root_url
    within("#tweet_#{t.id}") do 
      click_link z.name
      assert_equal zombie_path(z), current_path
    end
  end
  
  test "should create a new zombie" do 
    visit root_url
    click_link "sign up"
    fill_in "name", with: "breins"
    fill_in "graveyard", with: "downtown"
    click_button "sign up"
    assert_equal zombie_tweets_path("breins"), current_path
  end

end
