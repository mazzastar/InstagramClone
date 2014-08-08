class ChargesController < ApplicationController

before_action :authenticate_user!

def new
	@post = Post.find params[:post_id]
end

def create

	@post = Post.find params[:post_id]
  # Amount in cents
  @amount = 2000

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => "Print Of #{@post.title}" ,
    :currency    => 'gbp'
  )

  Order.create(user: current_user, post: @post)
  flash[:notice] = "Thanks for the order"
  redirect_to '/posts'

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to post_charges_path(@post)
end

end
