class Meeting
  attr_reader :date, :committee, :meeting_name, :content, :legislator

  def initialize(attributes={})
    @date = attributes[:date]
    @committee = attributes[:committee]
    @meeting_name = attributes[:meeting_name]
    @content = attributes[:content]
    @legislator = attributes[:legislator]
  end
end
