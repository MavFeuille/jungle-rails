require 'rails_helper'

# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true


RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "should have valid attributes in all fields" do
      @category = Category.new
      @category.name = 'Test category'
      @product = Product.new
      @product.name = 'Test product'
      @product.price = 10099
      @product.quantity = 3
      @product.category = @category
   
      expect(@product).to be_valid
    end

    it "is not valid without a product name" do
      @category = Category.new
      @category.name = 'Test category'
      @product = Product.new
      @product.name = nil
      @product.price = 10099
      @product.quantity = 3
      @product.category = @category

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Name can't be blank"]
    end

    it "is not valid without a product price" do
      @category = Category.new
      @category.name = 'Test category'
      @product = Product.new
      @product.name = 'Test product'
      @product.quantity = 3
      @product.category = @category
      # @product.save!
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Price cents is not a number", "Price is not a number", "Price can't be blank"]
    end

    it "is not valid without a product quantity" do
      @category = Category.new
      @category.name = 'Test category'
      @product = Product.new
      @product.name = 'Test product'
      @product.price = 10099
      @product.quantity = nil
      @product.category = @category

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Quantity can't be blank"]
    end

    it "is not valid without a category" do
      @category = Category.new
      # @category.name = 'test'
      @product = Product.new
      @product.name = 'Test product'
      @product.price = 10099
      @product.quantity = 1
      @product.category = nil

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Category can't be blank"]
    end
  end
end
