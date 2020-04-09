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
      ["Understanding Coronavirus", "understanding"],
      ["Managing and coping with change", "change"],
      ["Separation and loss", "loss"],
      ["Manging and Coping with Anxiety", "anxiety"],
      ["Maintaining Healthy Relationships", "relationships"],
      ["Staying active and curious", "active"]
    ]
  end

end
