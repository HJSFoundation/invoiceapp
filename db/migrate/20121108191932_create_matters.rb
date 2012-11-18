class CreateMatters < ActiveRecord::Migration
  def change
    create_table :matters do |t|
      t.string :matter
      t.integer :customer_id

      t.timestamps
    end
  end
end
