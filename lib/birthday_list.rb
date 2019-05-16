require 'birthday'
require 'date'

class BirthdayList
attr_reader :stored_birthdays

  def initialize
    @stored_birthdays = Array.new
  end

  def store_birthday(name, birthdate)
    @stored_birthdays.push(name)
    @stored_birthdays.push(birthdate)
  end

  def print_birthday_list
    n = 0
    while n < @stored_birthdays.length
      print "#{@stored_birthdays[n]}: #{@stored_birthdays[n+1]}\n"
      n += 2
    end
  end

  def birthday_reminder
    n = 1
    birthdays_today =[]

    while n < @stored_birthdays.length
      Date.today.to_s.scan(/(?<=-)\d+/).join == @stored_birthdays[n].to_s.split('').last(4).join ? birthdays_today.push(@stored_birthdays[n-1]) : nil
      n += 2
    end

    birthdays_today.each { |name|
      age_output = Date.today.year - @stored_birthdays[@stored_birthdays.index(name) + 1].to_s.split('').first(4).join.to_i
      print "It's #{name}\'s birthday today! They are #{age_output} years old!\n"
    }
  end
end
