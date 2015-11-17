class PagesController < ApplicationController
 
  def index
  end

  def track
    land = Land.parse_order_from_text params[:track_orders] if params[:track_orders]
    render json: land.try(:to_json, {include: :rovers})
  end

end
