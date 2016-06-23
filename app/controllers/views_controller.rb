class ViewsController < ApplicationController

	def new_view
		uid = request.headers["uid"]
		iid = params[:item_id]
		render json: View.create_view(uid,iid)
	end



end





























