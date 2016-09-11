
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
        album.band ? link_to(album.band.name, album.band) : '',
        album.date.try(:year),
        album.end_date.try(:year),
        # link_to('Show', album),
        link_to(t('edit'), edit_album_path(album)),
        link_to(t('destroy'), album, :method => :delete, :data => {:confirm => t('are_you_sure')})
      ]
    end
  end

  def columns
    [
      'name',
      'album_type_id',
      'band_id',
      'date',
      'end_date',
      # '',
      '',
      ''
    ]
  end

end

