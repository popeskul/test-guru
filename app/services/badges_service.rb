class BadgesService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user

    initialize_badge
  end

  private

  def initialize_badge
    Badge.all.each do |badge|
      create_badge(badge) if self.send(badge.badge_type, badge.parameter)
    end
  end

  def create_badge(badge)
    @user_badge = UserBadge.new(
      test_id: @test_passage.test.id,
      user_id: @user.id,
      badge_id: badge.id
    )
    errors.add(:badges, :invalid) unless @user_badge.save
  end

  def all_tests_at_category(category_title)
    return false if @test_passage.test.category.title != category_title

    @test_passage.passed? && @user.tests.by_category_title(category_title).uniq.count == Test.by_category_title(category_title).count
  end

  def passing_test_at_first_attempt(*args)
    TestPassage.where(user: @test_passage.user, test: @test_passage.test).count == 1
  end

  def all_tests_at_level(level)
    return false if level != @test_passage.test.level

    tests = Test.where(level: level).pluck(:id)
    completed = @test_passage
                  .user
                  .test_passages
                  .where(passed: true, test: tests)
                  .pluck(:test_id)
                  .uniq
    tests.count == completed.count
  end
end
