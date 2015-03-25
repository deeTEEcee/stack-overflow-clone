require 'rails_helper'

describe UsersController, type: :controller do
  context 'when user validation fails' do
    it 'should go back to the root page' do
      user = FactoryGirl.build(:user)
      post :create,
        user: {
          username: user.username,
          email: 'no',
          password: 'admin',
          password_confirmation: 'what'
      }
      expect(response).to render_template(:entry)
    end
  end

  context 'when user properly registered' do
    it 'should return back to the main page as a user' do
      user = FactoryGirl.build(:user)
      post :create,
        user: {
        username: user.username,
        email: user.email,
        password: 'admin',
        password_confirmation: 'admin'
      }
      expect(response).to redirect_to(root_url)
    end
  end
end
