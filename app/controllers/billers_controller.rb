class BillersController < ApplicationController
  # GET /billers
  # GET /billers.json
  def index
    @billers = Biller.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @billers }
    end
  end

  # GET /billers/1
  # GET /billers/1.json
  def show
    @biller = Biller.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @biller }
    end
  end

  # GET /billers/new
  # GET /billers/new.json
  def new
    @biller = Biller.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @biller }
    end
  end

  # GET /billers/1/edit
  def edit
    @biller = Biller.find(params[:id])
  end

  # POST /billers
  # POST /billers.json
  def create
    @biller = Biller.new(params[:biller])

    respond_to do |format|
      if @biller.save
        format.html { redirect_to @biller, :notice => 'Biller was successfully created.' }
        format.json { render :json => @biller, :status => :created, :location => @biller }
      else
        format.html { render :action => "new" }
        format.json { render :json => @biller.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /billers/1
  # PUT /billers/1.json
  def update
    @biller = Biller.find(params[:id])

    respond_to do |format|
      if @biller.update_attributes(params[:biller])
        format.html { redirect_to @biller, :notice => 'Biller was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @biller.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /billers/1
  # DELETE /billers/1.json
  def destroy
    @biller = Biller.find(params[:id])
    @biller.destroy

    respond_to do |format|
      format.html { redirect_to billers_url }
      format.json { head :no_content }
    end
  end
end
