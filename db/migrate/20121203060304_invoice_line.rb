class InvoiceLine < ActiveRecord::Migration
  def up
	change_column :invoice_lines, :rate, :decimal, {:precision => 10, :scale => 2}
	change_column :invoice_lines, :quantity, :decimal, {:precision => 10, :scale => 2}
	change_column :invoice_lines, :line_total, :decimal, {:precision => 10, :scale => 2}
  end

  def down
	change_column :invoice_lines, :rate, :decimal, {:precision => 10, :scale => 0}
	change_column :invoice_lines, :quantity, :decimal, {:precision => 10, :scale => 0}
	change_column :invoice_lines, :line_total, :decimal, {:precision => 10, :scale => 0}
  end
end
