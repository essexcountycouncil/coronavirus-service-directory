class Service < ApplicationRecord

  def self.categories
    [
      ["Understanding coronavirus", "Understanding coronavirus"],
      ["Managing and coping with change", "Managing and coping with change"],
      ["Separation and loss", "Separation and loss"],
      ["Managing and coping with anxiety", "Managing and coping with anxiety"],
      ["Maintaining healthy relationships", "Maintaining healthy relationships"],
      ["Staying active", "Staying active"],
      ["Education and learning", "Education and learning"]
    ]
  end

  def self.ages
    [
      ["Child", "Child"],
      ["Young person", "Young person"],
      ["Parent", "Parent"],
      ["Adult", "Adult"],
      ["All ages", "All ages"]
    ]    
  end

end
