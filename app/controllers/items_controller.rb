class ItemsController < ApplicationController
  before_action :logged_in_user , except: [:show]
  before_action :set_item, only: [:show]

  def new
    if params[:q]
      q_ary = params[:q].gsub('　',' ').split(' ')
      params[:q] = q_ary.each{|o| q_ary.delete(o) if o.size <= 1}.join(' ')
      render 'new' if params[:q].nil?
      response = RakutenWebService::Ichiba::Item.search(
        keyword: params[:q],
        imageFlag: 1,
      )
      @items = response.first(20)
    end
  end

  def show
    @have_users = @item.have_users
    @want_users = @item.want_users
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
