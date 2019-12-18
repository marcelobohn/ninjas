class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.references :customer, null: false, foreign_key: { to_table: :users }
      t.references :ninja, null: true, foreign_key: { to_table: :users }
      t.string :description
      t.integer :service_type, null: false
      t.datetime :date_accepted
      t.datetime :date_finished
      t.integer :rating

      t.timestamps
    end
  end
end
