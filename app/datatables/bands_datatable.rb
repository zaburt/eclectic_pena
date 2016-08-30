
class BandsDatatable < ServerSideDatatables
  delegate :edit_band_path, :to => :@view

  private

  def data
    items.map do |band|
      [
        link_to(band.name, band),
        band.country,
        band.website,
        link_to('Show', band),
        link_to('Edit', edit_band_path(band)),
        link_to('Destroy', band, :method => :delete, :data => {:confirm => 'Are you sure?'})
      ]
    end
  end

  def columns
    [
      'name',
      'country',
      'website',
      '',
      '',
      ''
    ]
  end

end

