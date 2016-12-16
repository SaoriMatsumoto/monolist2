class ItemsController < ApplicationController
  before_action :logged_in_user , except: [:show]
  before_action :set_item, only: [:show]

  def new
    begin
    response = RakutenWebService::Ichiba::Item.search(
      keyword: params[:q],
    )
    @items = response.first(20)
    rescue => e
      render 'new'
    end
  end

  def show
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
