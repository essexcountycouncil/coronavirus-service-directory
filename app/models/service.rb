class Service < ApplicationRecord

  def self.categories
    [
      ["Understanding coronavirus", "Understanding coronavirus"],
      ["Managing and coping with change", "Managing and coping with change"],
      ["Separation and loss", "Separation and loss"],
      ["Manging and coping with anxiety", "Manging and coping with anxiety"],
      ["Maintaining healthy relationships", "Maintaining healthy relationships"],
      ["Staying active and curious", "Staying active and curious"],
      ["Support for younger children", "Support for younger children"],
      ["Support for older children", "Support for older children"],
      ["Support for adults", "Support for adults"],
      ["Support for all ages", "Support for all ages"]
    ]
  end

end
