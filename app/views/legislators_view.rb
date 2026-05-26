class LegislatorView
  def find
    puts "Write legislators name"
    puts ">>"
    gets.chomp
  end

  def planery_meeting(meetings, name)
    puts "Plenary meetings details for #{name.name}"
    meetings.each do |meeting|
      puts "date: #{meeting.date}"
      puts "name: #{meeting.name}"
      puts "content: #{meeting.content}"
    end

  end

  def committee_meeting(meetings, name)
    puts "Committe meetings details for #{name}"
    meetings.each do |meeting|
      puts "date: #{meeting.date}"
      puts "committee: #{meeting.committee}"
      puts "name: #{meeting.name}"
      puts "content: #{meeting.content}"
    end
  end

end
