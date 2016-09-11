
class BandsDatatable < ServerSideDatatables
  delegate :edit_band_path, :to => :@view

  private

  def data
    items.map do |band|
      [
        link_to(band.name, band),
        band.country_name,
        link_if_exists(band.website),
        # link_to('Show', band),
        link_to(t('edit'), edit_band_path(band)),
        link_to(t('destroy'), band, :method => :delete, :data => {:confirm => t('are_you_sure')})
      ]
    end
  end

  def columns
    [
      'name',
      'country',
      'website',
      # '',
      '',
      ''
    ]
  end

end

