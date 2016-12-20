class RankingController < ApplicationController
  
  def have_ranking
    @title = "Have Ranking"
    @rank = Have.group(:item_id).order('count_item_id desc').limit(10).count('item_id')
    item_ids = @rank.keys
    @items = Item.find(item_ids).sort_by{|o| item_ids.index(o.id)}
    render 'ranking'
  end
  
  def want_ranking
    @title = "Want Ranking"
    @rank = Want.group(:item_id).order('count_item_id desc').limit(10).count('item_id')
    item_ids = @rank.keys
    @items = Item.find(item_ids).sort_by{|o| item_ids.index(o.id)}
    render 'ranking'
  end
end
