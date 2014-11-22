describe MyApi::V1::Users do 

  before do 
    User.delete_all
  end

  #{{{ user/me
  describe :me do 
    subject(:get_me) { get '/api/users/me'}
    context "when logged out" do 
      it {is_expected.to respond_with 401}
    end
    context "when logged in" do 
      it {is_expected.to respond_with 200}
    end
  end
  #}}}

  #{{{ signup
  describe :signup do 

    subject(:sign_up){ 
      u = FactoryGirl.build(:user)
      post "/api/users", {user: {email:u.email, password:u.password, password_confirmation: u.password}}
    }

    it "should create a user" do 
      expect{sign_up}.to change{User.count}.by(1)
    end

    it "should login the user" do 
      sign_up
      get '/users/me'
      expect(response.status).to eq 200
    end

  end
  #}}}

end

