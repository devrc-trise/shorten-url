class Api::LinksController < Api::BaseController
  def index
    paginate_results Link.order(created_at: :desc)
  end

  def create
    @link = Link.create! link_params.merge(user_ip: request.remote_ip)
    render :show
  end

  protected

  def link_params
    @link_params ||= params.require(:link).permit(:original_url)
  end
end
