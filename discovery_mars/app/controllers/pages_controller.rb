class PagesController < ApplicationController
 
  def index
  end

  def track
    land = Land.parse_order_from_text params[:track_orders] if params[:track_orders]
    render json: land.to_json
  rescue => e
    render json: {error: e.message}, status: :bad_request
  end

end
