class InvoiceLinesController < ApplicationController
  # GET /invoice_lines
  # GET /invoice_lines.json
  def index
    @invoice_lines = InvoiceLine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @invoice_lines }
    end
  end

  # GET /invoice_lines/1
  # GET /invoice_lines/1.json
  def show
    @invoice_line = InvoiceLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @invoice_line }
    end
  end

  # GET /invoice_lines/new
  # GET /invoice_lines/new.json
  def new
    @invoice_header = InvoiceHeader.find(:invoice_header_id)
    @invoice_line = @invoice_header.invoice_lines.new
    #@inv_num_max = InvoiceHeader.maximum(:id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @invoice_line }
    end
  end

  # GET /invoice_lines/1/edit
  def edit
    @invoice_header = InvoiceHeader.find(params[:invoice_header_id])
    @invoice_line = @invoice_header.invoice_lines.find(params[:id])    
  end

  # POST /invoice_lines
  # POST /invoice_lines.json
  def create
    @invoice_header = InvoiceHeader.find(params[:invoice_header_id])
	@invoice_line = @invoice_header.invoice_lines.create(params[:invoice_line])

    respond_to do |format|
      if @invoice_line.save
        format.html { redirect_to invoice_header_path(@invoice_header), :notice => 'Invoice line was successfully created.' }
        format.json { render :json => @invoice_line, :status => :created, :location => @invoice_line }
      else
        format.html { redirect_to invoice_header_path(@invoice_header), :notice => 'Invoice line could not be created.' }
        format.json { render :json => @invoice_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invoice_lines/1
  # PUT /invoice_lines/1.json
  def update
    @invoice_header = InvoiceHeader.find(params[:invoice_header_id])
    @invoice_line = @invoice_header.invoice_lines.find(params[:id])
    #redirect_to invoice_header_path(@invoice_header)

    respond_to do |format|
      if @invoice_line.update_attributes(params[:invoice_line])
        format.html { redirect_to @invoice_header, :notice => 'Invoice line was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @invoice_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_lines/1
  # DELETE /invoice_lines/1.json
  def destroy
    @invoice_header = InvoiceHeader.find(params[:invoice_header_id])
    @invoice_line = @invoice_header.invoice_lines.find(params[:id])
    @invoice_line.destroy
    redirect_to invoice_header_path(@invoice_header)

  end
end
