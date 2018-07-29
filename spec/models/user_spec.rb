require 'spec_helper'

describe User do

  it "validates the user name  and  last name it's not empty" do
    user = User.new(name: '', lastName: '')
    user.valid?
    user.errors[:name].should_not be_empty
  end
end