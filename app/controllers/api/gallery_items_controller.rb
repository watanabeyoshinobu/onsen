class Api::GalleryItemsController < ApplicationController
  def index
    # URLに ?category=look などの指定があれば絞り込み、なければ全て取得
    if params[:category].present?
      @items = GalleryItem.where(category: params[:category])
    else
      @items = GalleryItem.all
    end
    
    # 取得したデータをJSON形式でVue.jsに返す
    render json: @items
  end
end
