require 'birthday'
require 'date'

class BirthdayList
  attr_reader :stored_birthdays

  def initialize
    @stored_birthdays = Array.new
  end

  def store_birthday(birthday)
    @stored_birthdays.push(birthday)
  end

  def print_birthday_list
    @stored_birthdays.each { |person|
      print "#{person.name}: #{person.birthdate}\n"
    }
  end

  def birthday_reminder
    @stored_birthdays.each { |person|
      persons_birthday = person.birthdate.strftime("%m%d")
      today = Date.today.strftime("%m%d")

      if  today == persons_birthday
        print "It's #{person.name}\'s birthday today! They are #{Date.today.year - person.birthdate.year} years old!\n"
      end
    }
  end
end
