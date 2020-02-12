require 'rails_helper'
describe User do
  describe '#create' do

    it "is valid with a nickname, email, password, password_confirmation, post_number, prefecture 
    city, house_number, birthday, profile, first_name, last_name, first_kane, last_kane" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid with a nickname that has more than 10 characters " do
      user = build(:user, nickname: "aaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 10 characters)")
    end

    it "is valid with a nickname that has less than 10 characters " do
      user = build(:user, nickname: "aaaaaaaaaa")
      expect(user).to be_valid
    end

    it "is invalid with a duplicate nickname" do
      user = create(:user)
      another_user = build(:user, nickname: user.nickname)
      another_user.valid?
      expect(another_user.errors[:nickname]).to include("has already been taken")
    end

    it "is invalid without an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid with a password that has less than 7 characters " do
      user = build(:user, password: "aaaaaaa")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
    end

    it "is valid with a password that has more than 8 characters " do
      user = build(:user, password: "aaaaaaaa")
      expect(user).to be_valid
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid without a post_number" do
      user = build(:user, post_number: nil)
      user.valid?
      expect(user.errors[:post_number]).to include("can't be blank")
    end

    it "is invalid without a prefecture" do
      user = build(:user, prefecture: nil)
      user.valid?
      expect(user.errors[:prefecture]).to include("can't be blank")
    end

    it "is invalid without a city" do
      user = build(:user, city: nil)
      user.valid?
      expect(user.errors[:city]).to include("can't be blank")
    end

    it "is invalid without a house_number" do
      user = build(:user, house_number: nil)
      user.valid?
      expect(user.errors[:house_number]).to include("can't be blank")
    end
    
    it "is invalid without a birthday" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    it "is invalid without a profile" do
      user = build(:user, profile: nil)
      user.valid?
      expect(user.errors[:profile]).to include("can't be blank")
    end

    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid with a first_name that has more than 10 characters " do
      user = build(:user, first_name: "aaaaaaaaaaa")
      user.valid?
      expect(user.errors[:first_name]).to include("is too long (maximum is 10 characters)")
    end

    it "is valid with a first_name that has less than 10 characters " do
      user = build(:user, first_name: "aaaaaaaaaa")
      expect(user).to be_valid
    end

    it "is invalid without a last_name" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "is invalid with a last_name that has more than 10 characters " do
      user = build(:user, last_name: "aaaaaaaaaaa")
      user.valid?
      expect(user.errors[:last_name]).to include("is too long (maximum is 10 characters)")
    end

    it "is valid with a last_name that has less than 10 characters " do
      user = build(:user, last_name: "aaaaaaaaaa")
      expect(user).to be_valid
    end

    it "is invalid without a first_kane" do
      user = build(:user, first_kane: nil)
      user.valid?
      expect(user.errors[:first_kane]).to include("can't be blank")
    end

    it "is invalid with a first_kane that has more than 10 characters " do
      user = build(:user, first_kane: "aaaaaaaaaaa")
      user.valid?
      expect(user.errors[:first_kane]).to include("is too long (maximum is 10 characters)")
    end

    it "is valid with a first_kane that has less than 10 characters " do
      user = build(:user, first_kane: "aaaaaaaaaa")
      expect(user).to be_valid
    end

    it "is invalid without a last_kane" do
      user = build(:user, last_kane: nil)
      user.valid?
      expect(user.errors[:last_kane]).to include("can't be blank")
    end

    it "is invalid with a last_kane that has more than 10 characters " do
      user = build(:user, last_kane: "aaaaaaaaaaa")
      user.valid?
      expect(user.errors[:last_kane]).to include("is too long (maximum is 10 characters)")
    end

    it "is valid with a last_kane that has less than 10 characters " do
      user = build(:user, last_kane: "aaaaaaaaaa")
      expect(user).to be_valid
    end
  end
end


