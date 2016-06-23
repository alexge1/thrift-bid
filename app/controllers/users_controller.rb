class UsersController < ApplicationController

	def new
		newuser = User.create(fname:params[:fname],lname:params[:lname],email:params[:email],password:params[:password],dress:false,pant:false,shirt:false,jacket:false,sweater:false,top:false,xxs:false,xs:false,s:false,m:false,l:false,xl:false,xxl:false,male:false,female:false,unisex:false,surprise:false)
		if newuser.errors.as_json == [] || newuser.errors.as_json == "" || newuser.errors.as_json == nil || newuser.errors.as_json == {}
			render json: newuser
		else
			render json: {"message":"failed"}, status:403
		end
	end


	def login
		User.all.each do |user|
			if user.email == params[:email]
				if user.password == params[:password]
					render json: user
					return
				else
					render json: {"message":"incorrect password"}, status:403
					return
				end
			end
		end
		render json: {"message":"no user found"}, status: 403

	end


	def update

		uid = request.headers["uid"]
		if !User.check_user(uid)
			render json: {"message":"invalid user"}, status:403
			return
		else
			user = User.find(uid)
			user.dress = params[:dress]
			user.pant = params[:pant]
			user.shirt = params[:shirt]
			user.jacket = params[:jacket]
			user.sweater = params[:sweater]
			user.top = params[:top]
			user.male = params[:male]
			user.female = params[:female]
			user.unisex = params[:unisex]
			user.xxs = params[:xxs]
			user.xs = params[:xs]
			user.s = params[:s]
			user.m = params[:m]
			user.l = params[:l]
			user.xl = params[:xl]
			user.xxl = params[:xxl]
			user.surprise = params[:surpise]
			user.save

			render json: user
		end


	end


	def self.check_preferences(user,item)

	end



end




















