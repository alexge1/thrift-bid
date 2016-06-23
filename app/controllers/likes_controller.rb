class LikesController < ApplicationController

	def new_like

		uid = request.headers["uid"]
    if !User.check_user(uid)
      render json: {"message":"invalid user"}
      return
    end
		iid = params[:item_id]
    if !Item.check_item(iid)
      render json: {"message":"invalid item"}
      return
    end
		render json: Like.create_like(uid,iid)
	end


	def delete
		
		uid = request.headers["uid"]
		if !User.check_user(uid)
			render json: {"message":"invalid user"}
			return
		end
    iid = params[:item_id]
		if !Item.check_item(iid)
			render json: {"message":"invalid item"}
			return
		end
    user = User.find(uid)
    item = Item.find(iid)
    if !Like.exists?(user:user,item:item)
      render json: {"message":"like not found"}
      return
    end
    num_views = View.where(user:user,item:item).count
		if num_views > 1
			render json: {"message":"too many previous views"}
			return
		end
    if num_views < 1
      render json: {"message":"too few views"}
      return
    end
    Like.find_by(user:user,item:item).delete
    render json: {"success":"SUCCESS"}        

	end	





end

























