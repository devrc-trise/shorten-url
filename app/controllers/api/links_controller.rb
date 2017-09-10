class Api::LinksController < Api::BaseController
  before_action :set_link, only: [:show]

  def index
    paginate_results Link.order(created_at: :desc)
  end

  def create
    @link = Link.create! link_params.merge(user_ip: request.remote_ip)
    render :show
  end

  protected

  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    @link_params ||= params.require(:link).permit(:original_url)
  end
end
