require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it '正常な値だと新規登録可能' do
        expect(@user).to be_valid
      end
    end

    context '空の項目がある際はユーザー登録できない' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_furiganaが空では登録できない' do
        @user.first_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana can't be blank")
      end
      it 'last_furiganaが空では登録できない' do
        @user.last_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last furigana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end

    context 'メールアドレス関連' do
      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = "hogehoge"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
    end

    context 'パスワード関連' do
      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = "1234a"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'パスワードは、数字のみの場合登録できないこと' do
        @user.password = "123456"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'パスワードは、半角英のみで登録出来ないこと' do
        @user.password = "abcdef"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'パスワードは、全角英が含まれていると登録出来ないこと' do
        @user.password = "abcdeｆ1"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'パスワードは、確認用を含めて2回入力すること' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
        @user.password = "12345a"
        @user.password_confirmation = "123456a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
    context '名前関連' do
      it '苗字は全角漢字・ひらがな・カタカナ以外は登録できません' do
        @user.first_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角漢字・ひらがな・カタカナ以外は登録できません")
      end    
      it '名前は全角漢字・ひらがな・カタカナ以外は登録できません' do
        @user.last_name = "ﾃｽﾄ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角漢字・ひらがな・カタカナ以外は登録できません")
      end
      it '苗字のフリガナはカタカナ以外は登録できません' do
        @user.first_furigana = "てすと"
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana カタカナ以外は登録できません")
      end    
      it '名前のフリガナはカタカナ以外は登録できません' do
        @user.last_furigana = "ﾃｽﾄ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last furigana カタカナ以外は登録できません")
      end    
    end
  end
end
