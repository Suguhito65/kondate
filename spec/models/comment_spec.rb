require 'rails_helper'
RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント保存' do
    context "コメントが保存できる場合" do
      it "textが存在すれば保存できる" do
        expect(@comment).to be_valid
      end
    end
    context "コメントが保存できない場合" do
      it "textがないと保存できない" do
        @comment.text = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Textを入力してください")
      end
    end
  end
end
