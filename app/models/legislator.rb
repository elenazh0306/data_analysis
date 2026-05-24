class Legislator < ActiveRecord::Base
  has_many :plenary_meetings
  has_many :committee_meetings
end
