require 'spec_helper'

describe Guide do

  before :each do
    User.create(email: 'harry@ga.co', password: '1234', password_confirmation: '1234', first_name: 'Harry', last_name: 'Ng')
  end

  context "the system should auto-generate a guideID when the user chooses to become a guide" do
    it "is invalid without a guideID"
    it "is valid with a guideID"
  end

  describe "guide experience is provided" do
    context "the guide's experience text should not be greater that 1000 characters" do
      it "is invalid because greater than 1000 characters"
      it "should be valid if less than 1000 characters"
      it "should be valid if it is a string"
      it "is invalid because it is not a string"
    end
  end
end