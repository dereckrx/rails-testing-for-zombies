class Zombie < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :graveyard, presence: true
  has_many :tweets
  has_one :weapon
  
  def avatar_url
    "http://zombitar.com/#{id}.jpg"
  end
  
  def decapitate
    weapon.slice(self, :head)
    self.status = "dead again!"
  end
  
  def status
    "dead again"
  end
  
  def status=(status)
    
  end
  
  def geolocate
    loc = self.weapon.graveyard_locator(self.graveyard)
    "#{loc.latitude}, #{loc.longitude}"
  end


end
