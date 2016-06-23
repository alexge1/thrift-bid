class ItemsController < ApplicationController


	# GET /randomes
  # GET /randomes.json
  def index
  	@items = Item.all
  end

  def render_next_items
  	uid = request.headers["uid"]
    if !User.check_user(uid)
  		render json: {"message":"no current user"}
  		return
  	else
  		user = User.find(uid)
      # call function in Item to grab new and alive items
  		items_to_render_array = Item.next_items(user)
			if items_to_render_array != nil
				dict = []
				items_to_render_array.each do |item|
					dict << {"item_id": item.id,"price": item.price,"deadline": item.deadline,"dead": item.dead}
				end
				render json: dict
			else
				render json: {"message":"no unviewed items"}
			end
    end
  end


  def get_item
    # check for valid user
    uid = request.headers["uid"]
    if !User.check_user(uid)
      render json: {"message":"invalid user"}
      return
    else
      # check for valid item id
      iid = params[:id]
      if !Item.check_item(iid)
        render json: {"message":"invalid item id"}
        return
      else
        item = Item.find(iid)
        item.check_dead
        #add attributes
        size_hash = {"xxs": item.xxs, "xs": item.xs, "s": item.s, "m": item.m, "l": item.l, "xl": item.xl,"xxl": item.xxl}
        gender_hash = {"male": item.male, "female": item.female, "unisex": item.unisex}
        tags_hash = {"dress": item.dress, "pant": item.pant,"shirt": item.shirt,"jacket": item.jacket,"sweater": item.sweater,"top": item.top}
        preference_hash = {"tags": tags_hash,"sizes": size_hash, "gender": gender_hash, "surprise": item.surprise}
        to_render = {"item_id": item.id, "description": item.description,"price": item.price,"deadline": item.deadline,"dead": item.dead,"bids": item.bids,"preferences": preference_hash}
  			render json: to_render
  			return
      end
    end
  end
    

  # def new_item
  #   item = Item.create("description":params[:description],"price":params[:price],"deadline":params[:deadline],"dead":params[:dead],"bids":params[:bids],"XXS":params[:XXS],"XS":params[:XS],"S":params[:S],"M":params[:M],"L":params[:L],"XL":params[:XL],"XXL":params[:XXL],"male":params[:male],"female":params[:female],"unisex":params[:unisex],"surprise":params[:surprise],"dress":params[:dress],"pant":params[:pant],"shirt":params[:shirt],"jacket":params[:jacket],"sweater":params[:sweater],"top":params[:top])
  # end

        




end






















