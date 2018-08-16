require 'spec_helper'

describe User do
  context 'validates the user' do
    let(:post) { FactoryGirl.build(:user, name: nil, lastName: nil) }
    it "validates the user name  and  last name it's not empty" do
      expect(post.valid?).to be_falsey
      expect(post.errors[:name].size).to eq(1)
    end
  end

end