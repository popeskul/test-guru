class Admin::BadgesController < ApplicationController
  before_action :set_badge, only: [:show, :edit, :update, :destroy]

  def index
    @badges = Badge.all
  end

  def show; end

  def new
    @badge = Badge.new
  end

  def edit; end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      redirect_to :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  def achievements
    @achieved_badges = current_user.badge.group(:title, :image_url).count
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :badge_type, :image_url)
  end
end
