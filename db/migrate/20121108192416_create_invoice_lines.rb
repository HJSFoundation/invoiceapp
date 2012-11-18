class CreateInvoiceLines < ActiveRecord::Migration
  def change
    create_table :invoice_lines do |t|
      t.integer :invoice_header_id
      t.integer :biller_id
      t.integer :matter_id
      t.decimal :rate
      t.decimal :quantity
      t.decimal :line_total

      t.timestamps
    end
  end
end
