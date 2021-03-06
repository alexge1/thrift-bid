class PaymentsController < ApplicationController


	def get_all
		uid = request.headers["uid"]
		if !User.check_user(uid)
			render json: {"message":"invalid user"}, status:403
			return
		end
		user = User.find(uid)
		render json: user.payments
	end


	def get_one
		uid = request.headers["uid"]
		if !User.check_user(uid)
			render json: {"message":"invalid user"}, status:403
			return
		end
		user = User.find(uid)
		pid = params[:id]
		if pid == nil || pid == "" || !Payment.exists?(id:pid)
			render json: {"message":"invalid payment"}, status:403
			return
		end
		render json: user.payments.find(pid)
	end


	def new_payment
		uid = request.headers["uid"]
		if !User.check_user(uid)
			render json: {"message":"invalid user"}, status:403
			return
		end
		user = User.find(uid)
		new_card = Payment.create(user:user,cardholder:params[:cardholder],cardnumber:params[:card_number],cvv:params[:cvv],provider:params[:provider],month:params[:month],year:params[:year])
		render json: new_card
	end



end

























