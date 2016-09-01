
class AlbumsDatatable < ServerSideDatatables
  delegate :edit_album_path, :to => :@view

  private

  def filtered_list
    @klass.includes(:album_type).all
  end

  def data
    items.map do |album|
      [
        link_to(album.name, album),
        album.album_type.try(:name),
        album.date,
        album.end_date,
        # link_to('Show', album),
        link_to('Edit', edit_album_path(album)),
        link_to('Destroy', album, :method => :delete, :data => {:confirm => 'Are you sure?'})
      ]
    end
  end

  def columns
    [
      'name',
      'album_type_id',
      'date',
      'end_date',
      # '',
      '',
      ''
    ]
  end

end

