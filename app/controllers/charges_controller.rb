class ChargesController < ApplicationController
  # GET /charges
  # GET /charges.json
  def index
    @charges = Charge.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @charges }
    end
  end

  # GET /charges/1
  # GET /charges/1.json
  def show
    @charge = Charge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @charge }
    end
  end

  # GET /charges/new
  # GET /charges/new.json
  def new
    @event = Event.find(params[:event_id])

    @charge = Charge.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @charge }
    end
  end

  # GET /charges/1/edit
  def edit
    @charge = Charge.find(params[:id])
  end

  # POST /charges
  # POST /charges.json
  def create
    @event = Event.find(params[:event_id])
    @charge = Charge.new(:user_id => current_user.id, :event_id => @event.id, :amount => @event.price)
    # Amount in cents
    @amount = @event.price.to_i

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => current_user.full_name,
      :currency    => 'usd'
    )

    @charge.stripe_id = customer.id

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
    end

    respond_to do |format|
      if @charge.save
        # if charge was successful
        @charge.paid = true
        @charge.save
        format.html { redirect_to event_path(@event), notice: 'Payment Successful.' }
        # redirect_to event_path(@event_path), notice: 'Payment Successful, Enjoy!'
        format.json { render json: @event, status: :created, location: @event }
      else
        # format.html { render action: "new" }
        # format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end

    puts @charge.inspect

  end

  # PUT /charges/1
  # PUT /charges/1.json
  def update
    @charge = Charge.find(params[:id])

    respond_to do |format|
      if @charge.update_attributes(params[:charge])
        format.html { redirect_to @charge, notice: 'Charge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charges/1
  # DELETE /charges/1.json
  def destroy
    @charge = Charge.find(params[:id])
    @charge.destroy

    respond_to do |format|
      format.html { redirect_to charges_url }
      format.json { head :no_content }
    end
  end
