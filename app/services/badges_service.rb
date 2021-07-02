class BadgesService
  def initialize(test_passage)
    @test_passage = test_passage
    @current_user = test_passage.user
  end

  def call
    @badges = Badge.all
    @badges.each do |badge|
      self.create_badge(badge) if validator(badge)
    end
  end

  private

  def create_badge(badge)
    @user_badge = UserBadge.new(
      test_id: @test_passage.test.id,
      user_id: @current_user.id,
      badge_id: badge.id
    )
    errors.add(:badges, :invalid) unless @user_badge.save
  end

  def validator(badge)
    self.send(badge.badge_type)
  end

  def passing_test_at_first_attempt
    @current_user.tests.where(id: @test_passage.test.id).count == 1
  end

  def all_tests_at_level
    current_level = @test_passage.test.level
    test_ids = Test.where(level: current_level).ids
    completed_ids = TestPassage
                      .all
                      .where(test_id: test_ids, user_id: @current_user.id)
                      .pluck(:test_id)
                      .uniq
    test_ids.sort == completed_ids.sort
  end

  def all_tests_at_category
    category = @test_passage.test.category
    current_category_tests_ids = Test
                                   .joins(:category)
                                   .where(categories: { title: category.title })
                                   .order(id: :asc)
                                   .ids
    completed_ids = TestPassage
                      .all
                      .where(test_id: current_category_tests_ids, user_id: @current_user.id)
                      .pluck(:test_id)
                      .uniq
    current_category_tests_ids.sort == completed_ids.sort
  end
end
