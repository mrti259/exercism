module TicketingReservation
  def tickets_available : Int32
    @tickets_available
  end

  def order_ticket? : Bool
    if @tickets_available >= 100
      @tickets_available -= 1
      true
    else
      false
    end
  end

  def order_message(name : String) : String
    ticket_number = @tickets_available
    stadium_name = @stadium
    if order_ticket?
      "#{name}, your purchase was successful, your ticket number is ##{ticket_number}, and the game is played at the #{stadium_name} stadium."
    else
      "#{name}, your purchase was unsuccessful, there are not enough tickets available."
    end
  end
end

class TicketSystem
  include TicketingReservation

  def initialize(@tickets_available : Int32, @stadium : String)
  end
end