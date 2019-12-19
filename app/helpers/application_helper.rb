module ApplicationHelper
  def link_to_new_user(options = {})
    options[:class] = '' if options[:class].nil?
    link_to "<i class=\"fas fa-user-plus\"></i> Novo usuário".html_safe, new_user_registration_path, class: options[:class]
  end

  def link_to_sign_in(options = {})
    options[:class] = '' if options[:class].nil?
    link_to "<i class=\"fas fa-sign-in-alt\"></i> Entrar".html_safe, new_user_session_path, class: options[:class]
  end

  def link_to_sign_out
    link_to "<i class=\"fas fa-sign-out-alt\"></i> Sair".html_safe, destroy_user_session_path, method: :delete, data: { confirm: I18n.t('views.are_you_sure') }, :class => 'dropdown-item', id: 'destroy_user_session'
  end

  def link_to_edit_user
    link_to "<i class=\"fas fa-user-edit\"></i> Editar".html_safe, edit_user_registration_path, :class => 'dropdown-item'
  end

  def link_to_new(path, options = {})
    options[:index] = 'views.new' if options[:index].nil?
    options[:class] = 'btn btn-success btn-sm' if options[:class].nil?
    text = get_text_link options
    link_to '<i class="fa fa-plus-circle"></i> '.html_safe + text, path, class: options[:class], title: "Novo"
  end

  def link_to_show(path, options = {})
    options[:index] = 'views.show' if options[:index].nil?
    options[:class] = 'btn btn-info btn-sm' if options[:class].nil?
    text = get_text_link options
    icon_default = !options[:ignore_icon].nil? && options[:ignore_icon] ? '' : '<i class="fas fa-th-list"></i> '
    link_to icon_default.html_safe + text, path, class: options[:class], title: "Exibir"
  end

  def get_text_link(options)
    (options[:text]) || t(options[:index]) if options && (options[:show_text] != false)
  end
end
