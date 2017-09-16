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
    start_date = params[:start_date].presence || Date.current
    end_date = params[:end_date].presence || Date.current
    unique_visitor = params[:unique_visitor] == 'true'
    render json: @link.visits_per_hour(start_date, end_date, unique_visitor)
  end

  protected

  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    @link_params ||= params.require(:link).permit(:original_url)
  end
end
