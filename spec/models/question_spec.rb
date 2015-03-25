require 'rails_helper'

describe Question, type: :model do
  it 'can have japanese input' do
    FactoryGirl.create(:question, title: 'あ漢字カタ'*10, description: 'あ漢字カタ'*10)
  end
end
