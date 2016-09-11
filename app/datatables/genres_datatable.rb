
class GenresDatatable < ServerSideDatatables
  delegate :edit_genre_path, :to => :@view

  private

  def data
    items.map do |genre|
      [
        link_to(genre.name, genre),
        link_to(t('edit'), edit_genre_path(genre)),
        link_to(t('destroy'), genre, :method => :delete, :data => {:confirm => t('are_you_sure')})
      ]
    end
  end

  def columns
    [
      'name',
      '',
      ''
    ]
  end

end

