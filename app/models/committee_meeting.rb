require "active_record"

class CommitteeMeeting < ActiveRecord::Base
  belongs_to :legislator
end
