module ApplicationHelper
  def current_year
    DateTime.current.year
  end

  def github_url(author, repo, project_name)
    link_to "#{project_name}", "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def welcome_message(user)
    "Welcome, guru #{user.first_name} #{user.last_name}!".html_safe
  end
end
