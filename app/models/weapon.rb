class Weapon < ActiveRecord::Base
  
  belongs_to :zombie
  validates :zombie, presence: true
  
  def slice(*args)
    return nil
  end
  
  def graveyard_locator(graveyard)
    Location.new
  end
  
end

class Location
  def latitude
    return 2
  end
  
  def longitude
    return 3
  end
end
