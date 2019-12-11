class ChargesController < ApplicationController
    def new
      @amount = Lesson.find(params[:lesson_id]).price
    end
    
    def create
      # Amount in cents
      @amount = Lesson.find(params[:lesson_id]).price
    
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
    
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount.to_i,
        description: 'Paiement du cours',
        currency: 'EUR',
      })
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
end
