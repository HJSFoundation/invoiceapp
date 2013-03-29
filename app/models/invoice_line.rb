class InvoiceLine < ActiveRecord::Base
  validates_presence_of :matter_id, :biller_id, :rate, :quantity
  
  attr_accessible :biller_id, :invoice_header_id, :line_total, :matter_id, :quantity, :rate, :description
  belongs_to :invoice_header
  has_many :billers
  #has_many :invoice_lines_matters;
  #has_and_belongs_to_many :matters
  
  before_save :calc_line_total
  #after_save :calc_header_total
  
  private
	def calc_line_total
		self.line_total = self.rate* self.quantity
	end
	def calc_header_total
		@invoice_header = InvoiceHeader.find(self.invoice_header_id)
		@invoice_header.invoice_total = @invoice_header.invoice_lines.sum(:line_total)
	end
  
end
