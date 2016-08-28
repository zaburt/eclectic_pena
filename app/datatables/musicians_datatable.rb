
class MusiciansDatatable < ServerSideDatatables
  delegate :edit_musician_path, :to => :@view

  private

  def data
    items.map do |musician|
      [
        musician.name,
        musician.birthdate,
        musician.country,
        link_to('Show', musician),
        link_to('Edit', edit_musician_path(musician)),
        link_to('Destroy', musician, :method => :delete, :data => { :confirm => 'Are you sure?' })
      ]
    end
  end

  def columns
    [
      'name',
      'birthdate',
      'country',
      '',
      '',
      ''
    ]
  end

end

