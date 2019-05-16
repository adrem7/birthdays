
require 'birthday_list'
require 'date'

describe 'BirthdayList' do
  let(:birthday_list) {BirthdayList.new()}

  it 'shows class BirthdayList exists' do
    expect(birthday_list).to be_a_kind_of(BirthdayList)
  end

  it 'can initialize a new array which can be got' do
    expect(birthday_list.stored_birthdays).to eq([])
  end

  it 'can respond to store_birthday method' do
    expect(birthday_list).to respond_to(:store_birthday)
  end

  describe 'multiple birthday tests' do
    before(:each) do
      today = Date.today
      day = today.day
      month = today.month
      year = today.year - 29
      @date_minus_29_years = Date.new(year, month, day)
      3.times { birthday_list.store_birthday(Birthday.new("SamJ", @date_minus_29_years)) }
      @birthdays = birthday_list.stored_birthdays
    end

    it 'can store multiples' do
      expect(@birthdays.count).to eq(3)
    end

    it 'can store multiple objects' do
      100.times {
        expect(@birthdays.sample).to be_a_kind_of(Birthday)
      }
    end

    it 'can print names with birthdays on a single line each, making an easy to read list' do
      expect{ birthday_list.print_birthday_list }.to output("SamJ: #{@date_minus_29_years}\nSamJ: #{@date_minus_29_years}\nSamJ: #{@date_minus_29_years}\n").to_stdout
    end

    it 'should print multiple birthday messages if more than one person has a birthday today' do
      expect{ birthday_list.birthday_reminder }.to output("It's SamJ's birthday today! They are 29 years old!\nIt's SamJ's birthday today! They are 29 years old!\nIt's SamJ's birthday today! They are 29 years old!\n").to_stdout
    end

    it 'should not print a birthday message for anyone who doesnt have a birthday today' do
      not_today = Date.today - 1
      birthday_list.store_birthday(Birthday.new("SamJ", not_today))
      expect{ birthday_list.print_birthday_list }.to output(
        "SamJ: #{@date_minus_29_years}\nSamJ: #{@date_minus_29_years}\nSamJ: #{@date_minus_29_years}\nSamJ: #{not_today}\n").to_stdout
      expect{ birthday_list.birthday_reminder }.to output("It's SamJ's birthday today! They are 29 years old!\nIt's SamJ's birthday today! They are 29 years old!\nIt's SamJ's birthday today! They are 29 years old!\n").to_stdout
    end
  end
end
