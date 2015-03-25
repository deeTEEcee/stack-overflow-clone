require 'rails_helper'

RSpec.describe Answer, type: :model do
  it 'can have japanese input' do
    FactoryGirl.create(:answer, description: 'あ漢字カタ'*10)
  end
end
