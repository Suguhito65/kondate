require 'rails_helper'
RSpec.describe Recipe, type: :model do
  before do
    @recipe = FactoryBot.build(:recipe)
    @recipe.image = fixture_file_upload("/files/test_image.png")
  end

  describe 'レシピ情報の保存' do
    context "レシピ情報が保存できる場合" do
      it "画像や料理名、食材があれば保存できる" do
        expect(@recipe).to be_valid
      end
    end
    context "商品情報が保存できない場合" do
      it "ユーザーが紐づいていないと保存できない" do
        @recipe.user = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("User must exist")
      end
      it "画像がないと保存できない" do
        @recipe.image = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Image can't be blank")
      end
      it "料理名がないと保存できない" do
        @recipe.cuisine = ""
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Cuisine can't be blank")
      end
      it "食材がないと保存できない" do
        @recipe.foodstuff = ""
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Foodstuff can't be blank")
      end
    end
  end
end
