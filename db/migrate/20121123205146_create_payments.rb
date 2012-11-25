class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :invoice_header
      t.decimal :payment_amount, :precision => 10, :scale => 2
      t.date :payment_date
      t.string :payment_type
      t.text :payment_notes

      t.timestamps
    end
  end
end
