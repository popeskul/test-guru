class BadgesService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @badges = Badge

    initialize_badge
  end

  private

  def initialize_badge
    @badges.all.each do |badge|
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

  def all_tests_at_category(*args)
    category = Category.find_by(title: args[0])

    return false if @test_passage.test.category.id != category.id
    @test_passage.passed? && @user.tests.where(category_id: category.id).uniq.count == Test.where(category_id: category.id).count
  end

  def passing_test_at_first_attempt(*args)
    @test_passage.passed?
  end

  def all_tests_at_level(*args)
    level = args[0].to_i

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
