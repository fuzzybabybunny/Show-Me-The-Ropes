require 'spec_helper'

describe Rookie do

  before :each do
    User.create(email: 'harry@ga.co', password: '1234', password_confirmation: '1234', first_name: 'Harry', last_name: 'Ng')
  end

  context "the system should auto-generate a rookie_id when the user chooses to become a rookie" do
    it "is invalid without a rookie_id"
    it "is valid with a rookie_id"
  end

  describe "rookie experience is provided" do
    context "the rookie's experience text should not be greater that 1000 characters" do
      it "is invalid because greater than 1000 characters"
      it "should be valid if less than 1000 characters"
      it "should be valid if it is a string"
      it "is invalid because it is not a string"
    end
  end
end
