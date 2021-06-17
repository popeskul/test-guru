module TestsHelper
  LEVELS = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard }.freeze

  def test_level(test)
    LEVELS[test.level] || :hero
  end

  def test_authors(authors)
    authors.map { |author| tag.p "#{author.full_name}" }.join.html_safe
  end
end
