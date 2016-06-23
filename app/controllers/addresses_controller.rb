class AddressesController < ApplicationController


	def shipping
		uid = request.headers["uid"]
		if !User.check_user(uid)
			render json: {"message":"invalid user"}
			return
		end
		user = User.find(uid)
		addresses = Address.where(user:user,ship_address:true)
		render json: addresses
	end

	def billing
		uid = request.headers["uid"]
		if !User.check_user(uid)
			render json: {"message":"invalid user"}
			return
		end
		user = User.find(uid)
		addresses = Address.where(user:user,bill_address:true)
		render json: addresses
	end

	def one_shipping
		uid = request.headers["uid"]
		if !User.check_user(uid)
			render json: {"message":"invalid user"}
			return
		end
		user = User.find(uid)
		aid = params[:id]
		if aid == nil || aid == "" || !Address.exists?(id:aid,user:user)
			render json: {"message":"address not found"}
			return
		end
		address = Address.find(aid)
		if address.ship_address != true
			render json: {"message":"address not found"}
			return
		end
		render json: address
	end

	def one_billing
		uid = request.headers["uid"]
		if !User.check_user(uid)
			render json: {"message":"invalid user"}
			return
		end
		user = User.find(uid)
		aid = params[:id]
		if aid == nil || aid == "" || !Address.exists?(id:aid,user:user)
			render json: {"message":"address not found"}
			return
		end
		address = Address.find(aid)
		if address.bill_address != true
			render json: {"message":"address not found"}
			return
		end
		render json: address
	end


	def new_shipping
		uid = request.headers["uid"]
		if !User.check_user(uid)
			render json: {"message":"invalid user"}
			return
		end
		user = User.find(uid)
		address = Address.create(user:user,recipient:params[:recipient],line_1:params[:line1],line_2:params[:line2],city:params[:city],state:params[:state],zip:params[:zip],ship_address:true, bill_address:false)
		render json: address
	end

	def new_billing
		uid = request.headers["uid"]
		if !User.check_user(uid)
			render json: {"message":"invalid user"}
			return
		end
		user = User.find(uid)
		address = Address.create(user:user,recipient:params[:recipient],line_1:params[:line1],line_2:params[:line2],city:params[:city],state:params[:state],zip:params[:zip],bill_address:true, ship_address:false)
		render json: address
	end



end
















