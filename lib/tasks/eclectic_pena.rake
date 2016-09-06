require 'zip'
require 'pp'

namespace :eclectic_pena do

  desc 'Rebuild database from scratch with base data'
  task :rebuilddb => [
    'db:drop',
    'db:create',
    'db:migrate',
    'db:seed',
    # 'eclectic_pena:import:tellico'
  ]

  namespace :import do

    desc 'import data from tellico'
    task :tellico => :environment do
      xml = nil
      display_parse_results = false
      filepath = Rails.root.join('db', 'seeds', 'tellico.tc')
      all_artists = []
      all_genres = []
      all_albums = {}
      all_tracks = {}

      Zip::File.open(filepath) do |z|
        entry = z.get_entry('tellico.xml')
        rawdata = entry.get_input_stream.read

        xml = Nokogiri::XML(rawdata) do |config|
          config.nonet
        end
      end

      xml.remove_namespaces!

      xml.xpath('//entry').each do |ent|
        id = ent.xpath('.//id').text
        title = ent.xpath('.//title').text
        artists = ent.xpath('.//artists/artist').map(&:text)
        year = ent.xpath('./year').text
        comments = ent.xpath('.//comments').text

        genres = ent.xpath('.//genres/genre').map do |k|
          sanitize_genre(k.text)
        end

        tracks = ent.xpath('.//tracks/track').map do |track|
          track_data = track.xpath('./column').map(&:text)
          [track_data[0], track_data[2]]
        end

        all_artists += artists
        all_genres += genres
        all_albums[title] = {
          artists: artists,
          year: year,
          genres: genres,
          comments: comments,
          tracks: tracks
        }

        if display_parse_results
          puts
          puts "############################# #{id} ###########################"
          puts " title: #{title}"
          puts " year: #{year}"

          puts " artists:"
          artists.each do |artist|
            puts "   #{artist}"
          end

          puts " genres:"
          genres.each do |genre|
            puts "   #{genre}"
          end

          puts " comments: #{comments}"
          puts

          puts " tracks:"
          tracks.each do |track|
            pp track
          end

          puts
        end
      end

      all_artists.uniq!.sort!
      all_genres.uniq!.sort!

      puts "creating #{all_genres.count} genres"
      all_genres.each do |genre|
        Genre.create(:name => genre)
      end

      puts "creating #{all_artists.count} bands"
      all_artists.each do |artist|
        Band.create(:name => artist)
      end

      genre_ids = Hash[Genre.pluck(:name, :id)]
      band_ids = Hash[Band.pluck(:name, :id)]

      puts "creating #{all_albums.count} albums"
      all_albums.each do |title, data|
        band_id = band_ids[data[:artists].first]

        album_args = {
          :name => title,
          :date => "#{data[:year]}-01-01"
        }

        album_args.merge!(:band_id => band_id) if band_id.present?
        album = Album.create(album_args)

        data[:genres].each do |genre|
          AlbumGenre.create(:album_id => album.id, :genre_id => genre_ids[genre]) if genre.present?
        end

        AlbumTrack.create(:album_id => album.id, :tracks => data[:tracks]) if data[:tracks].present?
      end
    end

    def sanitize_genre(str)
      return str if str.blank?

      str.gsub(/Avantgarde/, 'Avant Garde')
      .gsub(/Bluesrock/, 'Blues Rock')
      .gsub(/Folkrock/, 'Folk Rock')
      .gsub(/Hardrock/, 'Hard Rock')
      .gsub(/ProgRock/, 'Progressive Rock')
      .gsub(/Prog Rock/, 'Progressive Rock')
      .gsub(/Psychedelia/, 'Psychedelic')
      .gsub(/Psychedelic Roc/, 'Psychedelic Rock')
      .gsub(/Psychrock/, 'Psychedelic Rock')
      .gsub(/Psych Rock/, 'Psychedelic Rock')
      .gsub(/Psyche Folk/, 'Psychedelic Folk')
      .gsub(/Psych-Funk/, 'Psychedelic Funk')
      .gsub(/[\/-]/, ' ')
    end
  end
end

