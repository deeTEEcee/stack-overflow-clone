require 'rails_helper'

describe SessionsController, type: :controller do
  context 'when login failed' do
    it 'should return to the same page with an alert message' do
      user = FactoryGirl.build(:user)
      post :create, session: { username: 'blah', password: 'blah'}
      expect(response).to render_template('users/entry')
    end
  end

  context 'when login succeeded' do
    it 'should go back to the root page' do
      user = FactoryGirl.build(:user)
      post :create, session: { username: user.username, password: 'admin' }
      expect(response.status).to equal(200)
    end
  end
end
