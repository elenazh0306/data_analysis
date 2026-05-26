require_relative "../models/legislator"
require_relative "../views/legislators_view"

class LegislatorsController
  def initialize
    @view = LegislatorView.new
  end

  def find
    name = @view.find
    @name = Legislator.find_by(name: name)
  end

  def plenary_meetings(name)
    meetings = name.plenary_meetings
    @view.planery_meeting(meetings, name)
  end

  def committee_meetings(name)
    meetings = name.committee_meetings
    @view.committee_meeting(meetings, name)
  end



end
