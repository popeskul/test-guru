module ApplicationHelper
  def current_year
    DateTime.current.year
  end

  def github_url(author, repo, project_name)
    link_to "#{project_name}", "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def welcome_message(user)
    welcome = t('activerecord.welcome')
    "#{welcome} #{user.full_name}!".html_safe
  end

  def select_language
    is_default_local = I18n.locale == I18n.default_locale

    link_options = {
      title: is_default_local ? 'En' : 'Ру',
      lang: is_default_local ? 'en' : 'ру',
      class: current_user&.admin? ? 'nav-link text-white' : 'nav-link'
    }

    link_to link_options[:title], { lang: link_options[:lang] }, class: link_options[:class]
  end
end
