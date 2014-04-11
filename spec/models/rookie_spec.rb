require 'spec_helper'

describe Rookie do

  before :each do
    u = User.create(
        email: 'harry@ga.co',
        password: '1234',
        password_confirmation: '1234',
        first_name: 'Harry',
        last_name: 'Ng'
      )

    r = Rookie.create(
        user_id: u.id,
        rookie_experience: "Skiing, Hiking"
      )
  end

  describe "the system should auto-generate a rookie_id when the user chooses to become a rookie" do
    it "is invalid without a rookie_id"
    it "is valid with a rookie_id"
  end

  describe "create the rookie"
    context "user not logged in" do
      it "cannot be done" do
      end
    end
    context "user logged in" do
      it "can be done" do
      end
    end
    context "rookie already exists" do
      it "cannot be done" do
      end
    end
    context "rookie doesn't exist" do
      it "can be done" do
      end
    end


  describe "add rookie experience" do
    context "user not logged in" do
      it "cannot be done" do
      end
    end
    context "user logged in" do
      it "can be done" do
      end
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
