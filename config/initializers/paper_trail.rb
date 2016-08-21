
# we must let ActiveRecord know that the PaperTrail::Version class is an abstract_class
module PaperTrail
  class Version < ActiveRecord::Base
    include PaperTrail::VersionConcern
    self.abstract_class = true
  end
end

PaperTrail.config.track_associations = false

