class CartsController < ApplicationController
#	before_filter :sanitize_page_params

   def index
		@carts=Cart.all
	 end
 
	def create
    @cart=Cart.new
		@cart.user_id = params["user_id"].to_i
		@cart.property_id = params["property_id"].to_i
		if @cart.save
			format.html { redirect_to cart_url(@cart), notice: "card is  was successfully created." }
			format.json { render :show, status: :created, location: @card }
		else
			format.html { render :new, status: :unprocessable_entity }
			format.json { render json: @cart.errors, status: :unprocessable_entity }
		end
	end

	private
	def cart_params
	params.require(:cart).permit(:user_id, :property_id)
	end
end
