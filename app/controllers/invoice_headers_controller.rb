class InvoiceHeadersController < ApplicationController  
  # GET /invoice_headers
  # GET /invoice_headers.json
  def index
    if params[:customer_id]
		@invoice_headers = InvoiceHeader.where(:customer_id => params[:customer_id])
	else
		@invoice_headers = InvoiceHeader.all
	end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @invoice_headers }
    end
  end

  # GET /invoice_headers/1
  # GET /invoice_headers/1.json
  def show
    @invoice_header = InvoiceHeader.find(params[:id])
    @invoice_lines = InvoiceLine.where("invoice_header_id = ?", params[:id])
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @invoice_header }
    end
  end

  # GET /invoice_headers/new
  # GET /invoice_headers/new.json
  def new
    @invoice_header = InvoiceHeader.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @invoice_header }
    end
  end

  # GET /invoice_headers/1/edit
  def edit
    @invoice_header = InvoiceHeader.find(params[:id])
  end

  # POST /invoice_headers
  # POST /invoice_headers.json
  def create
    @invoice_header = InvoiceHeader.new(params[:invoice_header])

    respond_to do |format|
      if @invoice_header.save
        format.html { redirect_to @invoice_header, :notice => 'Invoice header was successfully created.' }
        format.json { render :json => @invoice_header, :status => :created, :location => @invoice_header }
      else
        format.html { render :action => "new" }
        format.json { render :json => @invoice_header.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invoice_headers/1
  # PUT /invoice_headers/1.json
  def update
    @invoice_header = InvoiceHeader.find(params[:id])

    respond_to do |format|
      if @invoice_header.update_attributes(params[:invoice_header])
        format.html { redirect_to @invoice_header, :notice => 'Invoice header was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @invoice_header.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_headers/1
  # DELETE /invoice_headers/1.json
  def destroy
    @invoice_header = InvoiceHeader.find(params[:id])
    @invoice_header.destroy

    respond_to do |format|
      format.html { redirect_to invoice_headers_url }
      format.json { head :no_content }
    end
  end
end
