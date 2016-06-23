class UsersController < ApplicationController

	def new
		newuser = User.create(fname:params[:fname],lname:params[:lname],email:params[:email],password:params[:password],dress:false,pant:false,shirt:false,jacket:false,sweater:false,top:false,xxs:false,xs:false,s:false,m:false,l:false,xl:false,xxl:false,male:false,female:false,unisex:false,surprise:false)
		if newuser.errors.as_json == [] || newuser.errors.as_json == "" || newuser.errors.as_json == nil || newuser.errors.as_json == {}
			render json: newuser
		else
			render json: newuser.errors
		end
	end


	def login
		User.all.each do |user|
			if user.email == params[:email]
				if user.password == params[:password]
					render json: user
					return
				else
					render json: {"message":"incorrect password"}
					return
				end
			end
		end
		render json: {"message":"no user found"}

	end


	def update

	end


end
