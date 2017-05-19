class Admin::OrdersController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @orders = Order.order("id DESC")
  end

  def show
    @order = Order.find(params[:id])
    @product_lists = @order.product_lists
  end

  def shipped
    @order = order.find(params[:id])
    @order.deliver!
    redirect_to :back
  end

  def ship
    @order = Order.find(params[:id])
    @order.ship!
    redirect_to :back
  end

  def cancel
    @order = order.find(params[:id])
    @order.return_good!
    redirect_to :back
  end
end
