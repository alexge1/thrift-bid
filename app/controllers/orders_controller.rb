class OrdersController < ApplicationController


	def get_all
		uid = request.headers["uid"]
		if User.check_user(uid)
			user = User.find(uid)
			to_render = []
			user.orders.each do |order|
				to_render << {"order_id":order.id,"item_id":order.item.id, "item_price": order.item.price,"item_description":order.item.description}
			end
			render json: to_render
		else
			render json: {"message":"user invalid"}
		end
	end


	def get_order
		uid = request.headers["uid"]
		if !User.check_user(uid)
			render json: {"message":"invalid user"}
			return
		end
		iid = params[:id]
		if !Item.check_item(iid)
			render json: {"message":"invalid order"}
			return
		end
		user = User.find(id:uid)
		item = Item.find(id:iid)
		if User.orders.exists?(item:item)
			order = User.orders.find(item:item)
			size_hash = {"xxs": item.XXS, "xs": item.XS, "s": item.S, "m": item.M, "l": item.L, "xl": item.XL,"xxl": item.XXL}
	        gender_hash = {"male": item.male, "female": item.female, "unisex": item.unisex}
	        tags_hash = {"dress": item.dress, "pant": item.pant,"shirt": item.shirt,"jacket": item.jacket,"sweater": item.sweater,"top": item.top}
	        preference_hash = {"tags": tags_hash,"sizes": size_hash, "gender": gender_hash, "surprise": item.surprise}
	        to_render = {"item_id": item.id, "description": item.description,"price": item.price,"deadline": item.deadline,"dead": item.dead,"bids": item.bids,"preferences": preference_hash}
	  		render json: to_render
  			return
		else
			render json: {"message":"could not find your order"}
			return
		end
	end




end




















