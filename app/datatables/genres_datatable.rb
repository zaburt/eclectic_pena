
class GenresDatatable < ServerSideDatatables
  delegate :edit_genre_path, :to => :@view

  private

  def data
    items.map do |genre|
      [
        link_to(genre.name, genre),
        link_to('Edit', edit_genre_path(genre)),
        link_to('Destroy', genre, :method => :delete, :data => { :confirm => 'Are you sure?' })
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

