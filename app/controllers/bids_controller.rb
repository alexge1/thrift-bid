class BidsController < ApplicationController

	def new_super_bid
		
		uid = request.headers["uid"]
		if !User.check_user(uid)
			render json: {"message":"invalid user"}, status:403
			return
		end
		iid = params[:item_id]
		if Item.check_item(iid)
			item = Item.find(iid)
			if item.check_dead
				render json: {"message":"sorry, item offline!"}, status:403
				return
			end
		else
			render json: {"message":"invalid item"}, status:403
			return
		end
		new_bid_price = params[:new_bid_price].to_f
		if new_bid_price != nil
			temp_item = Bid.create_super_bid(uid,iid,new_bid_price)
			if temp_item.is_a? Item
				render json: temp_item
			else
				render json: temp_item, status:403
			end
		else
			render json: {"message":"no bid price provided"}, status:403
		end

	end


	def new_normal_bid
		
		uid = request.headers["uid"]
		if !User.check_user(uid)
			render json: {"message":"invalid user"}, status:403
			return
		end
		iid = params[:item_id]
		if Item.check_item(iid)
			item = Item.find(iid)
			if item.dead
				render json: {"message":"sorry, item offline!"}, status:403
				return
			end
		else
			render json: {"message":"invalid item"}, status:403
			return
		end
		new_bid_price = params[:new_bid_price].to_f
		if new_bid_price != nil
			temp_item = Bid.create_normal_bid(uid,iid,new_bid_price)
			if temp_item.is_a? Item
				render json: temp_item
			else
				render json: temp_item, status:403
			end
		else
			render json: {"message":"no bid price provided"}, status:403
		end

	end




end































