require 'rails_helper'

# RSpec.describe Product, type: :model do
#   describe 'Validations' do
#     # validates: name, presence: true
#     # validates: price, presence: true
#     # validates: quantity, presence: true
#     # validates: category, presence: tru
#      it 'should save a valid product' do
#       @category = Category.create(name:"Test Category")
#       @product = Product.new(
#         name: "Mona Lisa",
#         price: 0.99,
#         quantity: 1,
#         category_id: @category.id
#         )
#       expect(@product).to (be_valid)
#     end
#   end
# end
RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save a valid product' do
      @category = Category.create(name:"Test Category")
      @product = Product.new(
        name: "Mona Lisa",
        price: 0.99,
        description:"description",
        quantity: 1,
        category_id: @category.id
        )
      expect(@product).to (be_valid)
      expect(@product.errors.full_messages).to include "Add a valid Product"
    end

    it 'should not save without a valid name' do
      @category = Category.create(name:"Test Category")
      @product = @category.products.new(
        name: nil,
        price: 0.99,
        description:"description",
        quantity: 1,
        category_id: @category.id
        )
      expect(@product).to_not (be_valid)
      expect(@product.errors.full_messages).to include "Add a valid name"

    end

    it 'should not save without a valid price' do
      @category = Category.create(name:"Test Category")
      @product = Product.new(
        name: "Mona Lisa",
        price: nil,
        description:"description",
        quantity: 1,
        category_id: @category.id
        )
      @product.save

      expect(@product).to_not (be_valid)
    expect(@product.errors.full_messages).to include "Add a valid price"
    end

    it 'should not save without a valid quantity' do
      @category = Category.create(name:"Test Category")
      @product = @category.products.new(
        name: "Mona Lisa",
        price: 0.99,
        description:"description",
        quantity: nil,
        category_id: @category.id
        )
      expect(@product).to_not (be_valid)
      expect(@product.errors.full_messages).to include "Add a valid quantity"
    end

    it 'should not save without a catagory_id' do
      @category = Category.create(name:"Test Category")
      @product = Product.new(
        name: "Mona Lisa",
        price: 0.99,
        description:"description",
        quantity: 1,
        category_id: nil
        )
      expect(@product).to_not (be_valid)
      expect(@product.errors.full_messages).to include "catagory_id not valid"
    end
  end
end
