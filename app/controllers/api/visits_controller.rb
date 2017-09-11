class Api::VisitsController < Api::BaseController
  before_action :set_link, only: [:index]

  def index
    paginate_results @link.visits.order(created_at: :desc)
  end

  protected

  def set_link
    @link = Link.find(params[:link_id])
  end
end
