class Api::LinksController < Api::BaseController
  before_action :set_link, only: [:show, :analytics]

  def index
    paginate_results Link.order(created_at: :desc)
  end

  def create
    @link = Link.create! link_params.merge(user_ip: request.remote_ip)
    render :show
  end

  def analytics
    start_date = Date.parse(params[:start_date]) rescue Date.current
    end_date = Date.parse(params[:end_date]) rescue Date.current
    visits_per_hour = @link.visits_per_hour(start_date, end_date)
    total = visits_per_hour&.values&.sum
    render json: { visits_per_hour: visits_per_hour, total: total }
  end

  protected

  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    @link_params ||= params.require(:link).permit(:original_url)
  end
end
