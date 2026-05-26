class Router
  def initialize(legislators_controller)
    @legislators_controller = legislators_controller

    @running = true
  end

  def run
    while @running
      @legislator = @legislators_controller.find
      action(action_menu)
    end
  end

  private

  def action(choice)
    case choice
    when 1 then @legislators_controller.plenary_meetings(@legislator)
    when 2 then @legislators_controller.committee_meetings(@legislator)
    when 3 then change!
    when 4 then stop!
    else
      puts "Please pick an action"
    end
  end

  def change!
    @legislator = nil
  end

  def stop!
    @running = false
  end

  def action_menu
    puts "-- Legislator database --"
    puts "1 - Show plenary meetings"
    puts "2 - Show committee meetings"
    puts "3 - Pick another legislator"
    puts "4 - Exit"
    gets.chomp.to_i
  end


end

# legislator - speaks and votes
