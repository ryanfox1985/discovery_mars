class PagesController < ApplicationController
  layout proc { false if request.xhr? }

  def index
  end

  def track
    @land = Land.parse_order_from_text params[:track_orders] if params[:track_orders]
  rescue => e
    render json: { error: e.message }, status: :bad_request
  end
end
