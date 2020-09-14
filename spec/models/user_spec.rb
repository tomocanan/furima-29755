require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー情報登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context 'ユーザー登録できる時' do
      it "nickname、email、password、password_confirmationと本人確認（本名の名字と名前、本名の名字カナと名前カナ、生年月日）が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが半角英数混合かつ6文字以上であれば登録できる" do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end
      
    end
    context 'ユーザー登録できない時' do
      it 'ニックネームが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは@を含む必要があること' do
        @user.email = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは6文字以上であること' do
        @user.password = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは半角英数字混合であること' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')

        @user.password = '000000'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'パスワードは確認用を含めて2回入力すること' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザー本名（名字）が必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'ユーザー本名（名前）が必須であること' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'ユーザー本名（名字）は全角（漢字・ひらがな・カタカナ）で入力させること' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'ユーザー本名（名前）は全角（漢字・ひらがな・カタカナ）で入力させること' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'ユーザー本名のフリガナ（名字）が必須であること' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'ユーザー本名のフリガナ（名前）が必須であること' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'ユーザー本名（名字）のフリガナは全角（カタカナ）で入力させること' do
        @user.first_name_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'ユーザー本名（名前）のフリガナは全角（カタカナ）で入力させること' do
        @user.last_name_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it '生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end