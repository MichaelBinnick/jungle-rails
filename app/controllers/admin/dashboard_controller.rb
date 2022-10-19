class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"] 

  def show
    @admin_product_count = Product.count
    @admin_category_count = Category.count
  end
end
