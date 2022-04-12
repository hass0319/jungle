class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'].to_s, password: ENV['PASSWORD'].to_s

  def show
    @categories_count = Category.count(:all)
    @products_count   = Product.count(:all)
  end
end
