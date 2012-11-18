class CreateInvoiceHeaders < ActiveRecord::Migration
  def change
    create_table :invoice_headers do |t|
      t.integer :customer_id
      t.decimal :invoice_total

      t.timestamps
    end
  end
end
