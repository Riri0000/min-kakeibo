class StaticPagesController < ApplicationController
  skip_before_action :require_login
  before_action :redirect_to_page, only: :top

  def top; end

  def terms_of_service; end

  def privacy_policy; end

  private

  def redirect_to_page
    return unless logged_in?

    redirect_to account_books_path
  end
end
