class BadgesController < ApplicationController
  before_action :set_all_badges, only: :index

  def index; end

  private

  def set_all_badges
    @badges = Badge.all
  end
end
