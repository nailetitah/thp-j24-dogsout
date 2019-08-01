class AddCitiesToTables < ActiveRecord::Migration[5.2]
  def change
    add_reference :dogs, :city, index: true
    add_reference :dogsitters, :city, index: true
    add_reference :strolls, :city, index: true
  end
end
