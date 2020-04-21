class Service < ApplicationRecord

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
