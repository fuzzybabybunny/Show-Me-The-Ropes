require 'spec_helper'

describe User do

  before :each do
    User.create(email: 'harry@ga.co', password: '1234', password_confirmation: '1234')
  end

  it "is valid with an email" do
    user = User.new(email: 'harryworld@gmail.com', password: '1234', password_confirmation: '1234')
    user.save
    expect(user).to be_valid
  end

  it "is invalid without an email" do
    user = User.new(password: '1234', password_confirmation: '1234')
    user.save
    expect(user).to have(1).errors_on(:email)
  end

  describe "password is provided" do
    before :each do
      @user = User.new(email: 'harryworld@gmail.com', password: '1234', password_confirmation: '1234')
    end

    it "should be valid with password_confirmation" do
      @user.save
      expect(@user).to be_valid
    end

    context "password_confirmation is provided as empty" do
      it "should be invalid without password_confirmation" do
        @user.password_confirmation = ''
        @user.save
        expect(@user).to have(1).errors_on(:password_confirmation)
      end
    end

    context "password_confirmation is provided as nil" do
      it "should be valid without password_confirmation" do
        @user.password_confirmation = nil
        @user.save
        expect(@user).to be_valid
      end
    end
  end

  describe "authenticate username and password" do
    describe "self.authenticate" do
      context "correct password" do
        it "should be valid to authenticate" do
          user = User.authenticate 'harry@ga.co', '1234'
          expect(user).to be_valid
        end
      end

      context "incorrect password" do
        it "should return nil to authenticate" do
          user = User.authenticate 'harry@ga.co', '12345678'
          expect(user).to be_nil
        end
      end
    end

    describe "authenticate" do
      it "authenticate correctly" do
        user = User.find_by email: 'harry@ga.co'
        auth_result = user.authenticate '1234'
        result = user.fish == BCrypt::Engine.hash_secret('1234', user.salt)
        expect(auth_result).to eq result
      end
    end
  end

  describe "reset password" do
    before :each do
      @user = User.find_by email: 'harry@ga.co'
      @user.set_password_reset
      @params = {:password => '1234', :password_confirmation => '1234'}
    end

    context "code exists after set_password_reset" do
      it "should have value set to code and expires_at" do
        @user.set_password_reset
        expect(@user.code).to_not be_nil
        expect(@user.expires_at).to_not be_nil
      end
    end

    describe "password reset" do
      context "password is blank" do
        it "should be invalid if password is blank" do
          @params[:password] = ''
          result = @user.reset_password @params
          expect(result).to be_false
        end
      end

      context "password is not blank" do
        context "password with confirmation matches" do
          it "should have the fish changed" do
            old_fish = @user.fish
            @user.reset_password @params
            expect(old_fish).to_not eq @user.fish
          end

          it "should have code and expires_at set to nil" do
            @user.reset_password @params
            expect(@user.code).to be_nil
            expect(@user.expires_at).to be_nil
          end
        end

        context "password with confirmation not matches" do
          it "should have the fish and salt unchanged" do
            @params[:password_confirmation] = 'abcd'
            old_fish = @user.fish
            @user.reset_password @params
            expect(old_fish).to eq @user.fish
          end

          it "should have code and expires_at unchanged" do
            @params[:password_confirmation] = 'abcd'
            @user.reset_password @params
            expect(@user.code).to_not be_nil
            expect(@user.expires_at).to_not be_nil
          end
        end
      end
    end
  end

  describe "Set random password if password is not provided" do
    before :each do
      @user = User.new email: 'harry@ga.co'
    end

    context "salt and fish exists" do
      it "should have value in salt and fish" do
        @user.send(:set_random_password)
        expect(@user.salt).to_not be_nil
        expect(@user.fish).to_not be_nil
      end
    end
  end

  describe "Password is encrypted before save" do
    before :each do
      @user = User.new email: 'harry@ga.co'
    end

    context "password is present" do
      it "should have value in salt and fish" do
        @user.password = '1234'
        @user.send(:encrypt_password)
        expect(@user.salt).to_not be_nil
        expect(@user.fish).to_not be_nil
      end

      context "encrypted password is not the same as plain" do
        it "should have values of password and fish differently" do
          @user.password = '1234'
          @user.send(:encrypt_password)
          expect(@user.password).to_not eq @user.fish
        end
      end
    end

    context "password is not present" do
      it "should not have value in salt and fish" do
        @user.send(:encrypt_password)
        expect(@user.salt).to be_nil
        expect(@user.fish).to be_nil
      end
    end
  end
end