module MyApi
  module V1
    class Users < Grape::API
      format :json

      namespace :users do 

        #{{{ me
        desc "get my profile informations"
        get :me do 
          sign_in!
          present :current_user, with: MyApi::V1::Entities::User
        end
        #}}}

        #{{{ signup
        desc "signup user"
        params do 
          requires :user, type: Hash do 
            requires :email, type: String, desc: "user's email"
            requires :password, type: String, desc: "password"
            requires :password_confirmation, type: String, desc: "password_confirmation"
          end
        end
        post do
          u = User.new(email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
          if u.save
            #binding.pry
            sign_in(:user, u)
            present :user, u, with: MyApi::V1::Entities::User
          else
            error! u.errors
          end
        end
        #}}}

      end
    end
  end
end
