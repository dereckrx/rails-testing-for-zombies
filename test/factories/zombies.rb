FactoryGirl.define do 
  factory :zombie do
    sequence(:name) { |i| "Ash#{i}" }
    graveyard "Oak Park"
    
    factory :armed_zombie, class: :zombie do
      association :weapon, factory: :hatchet
    end
    
    # Should not use the below codez?, use dynamic building instead like above
    factory :zombie_bill do
      name "bill"
    end
    
    factory :zombie_mike do 
      name "mike"
      graveyard "downtown"
    end
  end
  
end

    