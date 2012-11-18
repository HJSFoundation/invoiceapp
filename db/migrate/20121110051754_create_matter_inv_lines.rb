class CreateMatterInvLines < ActiveRecord::Migration
  def change
    create_table :matter_inv_lines, :id => false do |t|
      t.references :matter
      t.references :invoice_line

      t.timestamps
    end
    add_index :matter_inv_lines, :matter_id
    add_index :matter_inv_lines, :invoice_line_id
  end
end
