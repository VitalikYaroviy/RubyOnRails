require 'spec_helper'

RSpec.describe User do

  context 'validates the user' do

    let(:post) { FactoryBot.build(:user, name: nil, last_name: nil) }

    it 'validates the user name  and  last name not empty' do
      expect(post).to_not be_valid
      expect(post.errors[:name]).to have(1).item
    end

  end

end