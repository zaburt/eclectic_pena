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
      data = nil
      filepath = Rails.root.join('db', 'seeds', 'tellico.tc')

      Zip::File.open(filepath) do |z|
        entry = z.get_entry('tellico.xml')
        rawdata = entry.get_input_stream.read
      end

      xml = Nokogiri::XML(rawdata) do |config|
        config.nonet
      end

      xml.remove_namespaces!

      xml.xpath('//entry').each do |ent|
        id = ent.xpath('.//id').text
        title = ent.xpath('.//title').text
        artists = ent.xpath('.//artists/artist').map(&:text)
        year = ent.xpath('./year').text
        comments = ent.xpath('.//comments').text
        genres = ent.xpath('.//genres/genre').map(&:text)

        tracks = ent.xpath('.//tracks/track').map do |track|
          track.xpath('./column').map(&:text)
        end

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

  end
end

