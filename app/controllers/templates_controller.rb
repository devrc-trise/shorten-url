class TemplatesController < ApplicationController
  def page
    render template: "templates/#{params[:path]}", layout: nil
  end
end
