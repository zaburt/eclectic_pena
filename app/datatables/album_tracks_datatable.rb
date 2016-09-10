
class AlbumTracksDatatable < ServerSideDatatables
  delegate :edit_album_track_path, :to => :@view

  private

  def filtered_list
    @klass.includes(:album).all
  end

  def data
    items.map do |album_track|
      [
        link_to(album_track.name, album_track),
        link_to(album_track.album.name, album_track.album),
        album_track.tracks,
        link_to(t('edit'), edit_album_track_path(album_track)),
        link_to(t('destroy'), album_track, :method => :delete, :data => {:confirm => t('are_you_sure')})
      ]
    end
  end

  def columns
    [
      'name',
      'album_id',
      'tracks',
      '',
      ''
    ]
  end

end

