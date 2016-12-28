class RankingController < ApplicationController
  before_action :logged_in_user

  def have
    @ranking = Have.group(:item_id).order('count_item_id desc').limit(10).count('item_id')
    item_ids = @ranking.keys
    @items = Item.find(item_ids).sort_by{|o| item_ids.index(o.id)}
    render 'have'
  end  

  def want
    @ranking = Want.group(:item_id).order('count_item_id desc').limit(10).count('item_id')
    item_ids = @ranking.keys
    @items = Item.find(item_ids).sort_by{|o| item_ids.index(o.id)}
    render 'want'
  end
end
