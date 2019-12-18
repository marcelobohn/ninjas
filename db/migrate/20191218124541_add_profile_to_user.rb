class AddProfileToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profile, :integer
    add_column :users, :name, :string
  end
end
