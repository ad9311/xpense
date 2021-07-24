module ApplicationHelper
  def user_navbar
    if current_page?(root_path)
      render 'users/nav'
    else
      render 'layouts/nav'
    end
  end
end
