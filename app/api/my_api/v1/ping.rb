module MyApi
  module V1
    class Ping < Grape::API
      format :json

      desc "returns either 'pong', or the 'ping' parameter"
      params do 
        optional :ping, desc: "a ping parameter"
      end
      get :ping do 
        h = HashWithIndifferentAccess.new
        h[:ping] = ( params[:ping] || :pong )
        present :ping, h, with: MyApi::V1::Entities::Ping
      end


    end
  end
end