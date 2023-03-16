class CartsController < ApplicationController
	before_action :authenticate_user!
  before_action :check_user

   def index
		@carts=Cart.details(current_user.id)
	 end 

	def show
		@carts = Cart.details(params[:id])
	end 

  def check_user
	  if current_user.role =="seller"
			return redirect_to properties_path
		end
	end

	def cart_destroy
		params["id"]=params[:id].to_i
		@cart=Cart.find(params[:id])
		if @cart.destroy
		 redirect_to carts_path
		end 
		 
	end 

	def buy
		params["p_id"]=(params[:p_id]).to_i
		@buyer=User.find(current_user.id)
		@property=Property.find(params[:p_id])
		@seller= User.find(@property.user_id)
		@seller_mail=@seller.email
		@buyer_mail=@buyer.email
		BuyerMailer.buyer_email(@seller,@buyer,	@seller_mail,@buyer_mail,@property).deliver_now
		BuyerMailer.seller_email(@seller,@buyer,@seller_mail,@buyer_mail,@property).deliver_now
		render plain: "confirm"
 
	end

		

	def create
		@cart=Cart.new
		@cart.user_id = params["user_id"].to_i
		@cart.property_id = params["property_id"].to_i
		if @cart.save
	  redirect_to cart_path(current_user.id)

		else
			format.html { render :new, status: :unprocessable_entity }
			format.json { render json: @cart.errors, status: :unprocessable_entity }
		end
	end

	private
	def cart_params
		@cart.user_id = params["user_id"].to_i
		@cart.property_id = params["property_id"].to_i
	params.require(:cart).permit(:user_id, :property_id)
	end
end
