class StrollModification < ActiveRecord::Migration[5.2]
  def change
    remove_column :strolls, :datetime, :string
    add_column :strolls, :date, :datetime
    add_reference :strolls, :dog, foreign_key: true
    add_reference :strolls, :dogsitter, foreign_key: true
  end
end
