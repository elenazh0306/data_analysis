require "active_record"

class PlenaryMeeting < ActiveRecord::Base
  belongs_to :legislator
end
