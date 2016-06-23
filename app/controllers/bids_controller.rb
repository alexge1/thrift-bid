class BidsController < ApplicationController

	def new_super_bid
		
		uid = request.headers["uid"]
		if !User.check_user(uid)
			render json: {"message":"invalid user"}
			return
		end
		iid = params[:item_id]
		if Item.check_item(iid)
			item = Item.find(iid)
			if item.check_dead
				render json: {"message":"sorry, item offline!"}
				return
			end
		else
			render json: {"message":"invalid item"}
			return
		end
		new_bid_price = params[:new_bid_price].to_f
		if new_bid_price != nil
			render json: Bid.create_super_bid(uid,iid,new_bid_price)
		else
			render json: {"message":"no bid price provided"}
		end

	end


	def new_normal_bid
		
		uid = request.headers["uid"]
		if !User.check_user(uid)
			render json: {"message":"invalid user"}
			return
		end
		iid = params[:item_id]
		if Item.check_item(iid)
			item = Item.find(iid)
			if item.dead
				render json: {"message":"sorry, item offline!"}
				return
			end
		else
			render json: {"message":"invalid item"}
			return
		end
		new_bid_price = params[:new_bid_price].to_f
		if new_bid_price != nil
			render json: Bid.create_normal_bid(uid,iid,new_bid_price)
		else
			render json: {"message":"no bid price provided"}
		end

	end




end































