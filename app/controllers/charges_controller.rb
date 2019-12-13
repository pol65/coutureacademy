class ChargesController < ApplicationController
    def new
      @lesson = Lesson.find(params[:lesson_id])
      @amount = Lesson.find(params[:lesson_id]).price * 100
    end
    
    def create
      # Amount in cents
      @amount = Lesson.find(params[:lesson_id]).price * 100
    
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

      @classroom = Classroom.new(
        lesson_id: params[:lesson_id], 
        student_id: current_user.id )
        
    if @classroom.save 
        flash[:success] = "Vous vous êtes bien inscrit!"
        redirect_to lesson_path(@lesson)
    else
        redirect_to new_lesson_path
    end
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
end
