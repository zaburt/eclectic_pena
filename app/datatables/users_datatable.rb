
class UsersDatatable < ServerSideDatatables
  delegate :edit_user_path, :to => :@view

  private

  def data
    items.map do |user|
      [
        link_to(user.name, user),
        user.email,
        user.sign_in_count,
        user.current_sign_in_ip.to_s,
        format_time(user.current_sign_in_at)
      ]
    end
  end

  def columns
    [
      'name',
      'email',
      '',
      '',
      ''
    ]
  end

end

