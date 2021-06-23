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
    if I18n.locale == I18n.default_locale
      link_to "En", { lang: 'en' }, class: current_user&.admin? ? 'nav-link text-white' : 'nav-link'
    else
      link_to "Ру", { lang: 'ru' }, class: current_user&.admin? ? 'nav-link text-white' : 'nav-link'
    end
  end
end
