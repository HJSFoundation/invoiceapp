class CreateBillers < ActiveRecord::Migration
  def change
    create_table :billers do |t|
      t.string :biller_name
      t.decimal :rate

      t.timestamps
    end
  end
end
