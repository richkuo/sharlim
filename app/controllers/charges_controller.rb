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
  # def show
  #   @charge = Charge.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @charge }
  #   end
  # end

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
  # def edit
  #   @charge = Charge.find(params[:id])
  # end

  # POST /charges
  # POST /charges.json
  def create
    @user = current_user
    @event = Event.find(params[:event_id])
    @charge = Charge.new(:user_id => @user.id, :event_id => @event.id, :amount => @event.price)
    # Amount in cents
    @amount = @event.price.to_i

    customer = Stripe::Customer.create(
      :email => @user.email,
      :card  => params[:stripeToken]
    )

    @charge.stripe_customer_id = customer.id

    if Guestlist.count < 101
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => "#{@user.email}; Full Name: #{@user.full_name}",
        :currency    => 'usd'
      )

      @charge.stripe_charge_id = charge.id
    end

    respond_to do |format|
      if charge && charge.save
        # if charge was successful
        @charge.paid = true
        @charge.save

        # add user to guestlist
        @event.add_viewer!(@user)

        @user.deliver_payment_receipt(@event)
        format.html { redirect_to event_path(@event), notice: 'Payment Successful.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { redirect_to event_path(@event), alert: 'The event is at maximum capacity.' }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to @event
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

end
