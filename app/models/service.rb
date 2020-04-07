class Service < ApplicationRecord
  geocoded_by :postcode
  after_validation :geocode

  def rough_distance
      if distance < 1
        "Less than a mile away"
      elsif (1 < distance) && (distance < 2)
        "About a mile away"
      else
        "About #{distance.round} miles away"
      end
  end

  def self.categories
    [
      ["Coping with and managing anxiety", "anxiety"],
      ["Coping with and managing change", "change"],
      ["Preparing and coping with loss", "loss"],
      ["Parenting in challenging circumstances", "parenting"],
      ["Relationships in challenging circumstances", "relationships"],
      ["Keeping busy; building a routine at home", "routine"],
      ["Feeling lonely; connecting with others whilst at home", "lonely"],
      ["Staying active", "active"]
    ]
  end

end
