class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :item
      t.integer :quantity
      t.decimal :price
      t.integer :customer_id

      t.timestamps
    end
  end
end
