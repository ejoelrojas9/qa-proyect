class AddColumnToManagers < ActiveRecord::Migration[7.0]
  def change
    add_column :managers, :email, :string
    add_column :managers, :phone, :string, :limit => 30
    add_column :managers, :age, :integer, :limit => 3 
    add_column :managers, :city, :string
  end
end
