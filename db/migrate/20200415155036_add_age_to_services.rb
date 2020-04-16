class AddAgeToServices < ActiveRecord::Migration[5.2]
  def change
  	add_column :services, :age, :string, array:true, default: []
  end
end
