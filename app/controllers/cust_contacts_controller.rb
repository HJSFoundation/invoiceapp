class CustContactsController < ApplicationController
  # GET /cust_contacts
  # GET /cust_contacts.json
  def index
    @cust_contacts = CustContact.find(params[:customer_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @cust_contacts }
    end
  end

  # GET /cust_contacts/1
  # GET /cust_contacts/1.json
  def show
    @customer = Customer.find(params[:customer_id])
    @cust_contact = @customer.cust_contacts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @cust_contact }
    end
  end

  # GET /cust_contacts/new
  # GET /cust_contacts/new.json
  def new
    @customer = Customer.find(params[:customer_id])
    @cust_contact = @customer.cust_contacts.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @cust_contact }
    end
  end

  # GET /cust_contacts/1/edit
  def edit
    @customer = Customer.find(params[:customer_id])
    @cust_contact = @customer.cust_contacts.find(params[:id])
  end

  # POST /cust_contacts
  # POST /cust_contacts.json
  def create
    @customer = Customer.find(params[:customer_id])
    @cust_contact = @customer.cust_contacts.new(params[:cust_contact])

    respond_to do |format|
      if @cust_contact.save
        format.html { redirect_to [@cust_contact.customer, @cust_contact], :notice => 'Contact was successfully created.' }
        format.json { render :json => @cust_contact, :status => :created, :location => @cust_contact }
      else
        format.html { render :action => "new" }
        format.json { render :json => @cust_contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cust_contacts/1
  # PUT /cust_contacts/1.json
  def update
    @customer = Customer.find(params[:customer_id])
    @cust_contact = @customer.cust_contacts.find(params[:id])

    respond_to do |format|
      if @cust_contact.update_attributes(params[:cust_contact])
        format.html { redirect_to customer_path(@customer), :notice => 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @cust_contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cust_contacts/1
  # DELETE /cust_contacts/1.json
  def destroy
    @customer = Customer.find(params[:customer_id])
    @cust_contact = @customer.cust_contacts.find(params[:id])
    @cust_contact.destroy

    respond_to do |format|
      format.html { redirect_to customer_url(@customer) }
      format.json { head :no_content }
    end
  end
end
