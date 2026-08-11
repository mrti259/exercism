module Meetup
  WEEK = {
    "first" => 1,
    "second" => 8,
    "third" => 15,
    "fourth" => 22,
    "teenth" => 13,
  }

  DAY_OF_WEEK = {
    "Monday" => Time::DayOfWeek::Monday,
    "Tuesday" => Time::DayOfWeek::Tuesday,
    "Wednesday" => Time::DayOfWeek::Wednesday,
    "Thursday" => Time::DayOfWeek::Thursday,
    "Friday" => Time::DayOfWeek::Friday,
    "Saturday" => Time::DayOfWeek::Saturday,
    "Sunday" => Time::DayOfWeek::Sunday,
  }

  def self.meetup(year : Number, month : Number, week : String, day_of_week : String) : String
    if week == "last"
      date = Time.utc(year, month, 1).at_end_of_month
      day = date.day
      until DAY_OF_WEEK[day_of_week] == date.day_of_week
        day -= 1
        date = Time.utc(year, month, day)
      end
    else
      day = WEEK[week]
      date = Time.utc(year, month, day)
      until DAY_OF_WEEK[day_of_week] == date.day_of_week
        day += 1
        date = Time.utc(year, month, day)
      end
    end
    date.to_s "%Y-%m-%d"
  end
end
