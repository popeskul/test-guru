module BadgesHelper
  def find_current_user_badge(badge)
    badge.user_badges.filter { |b| b.user_id == current_user.id }
  end
end
