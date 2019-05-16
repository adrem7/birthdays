
require 'birthday_list'

describe "BirthdayList" do
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

# Commented out these tests as later tests supercede them.
# Keeping tests as comments as like to refer back 

  # it 'stores a birthday' do
  #   birthday_to_add = 20000101
  #   stored_birthdays = birthday_list.store_birthday(birthday_to_add)
  #   expect(stored_birthdays).to eq([20000101])
  # end

  # it 'can store multiple birthdays' do
  #   birthday1_to_add = 19900101
  #   birthday2_to_add = 19950101
  #   birthday3_to_add = 20000101
  #   birthday4_to_add = 20050101
  #
  #   store_birthday1 = birthday_list.store_birthday(birthday1_to_add)
  #   store_birthday2 = birthday_list.store_birthday(birthday2_to_add)
  #   store_birthday3 = birthday_list.store_birthday(birthday3_to_add)
  #   store_birthday4 = birthday_list.store_birthday(birthday4_to_add)
  #
  #   expect(store_birthday4).to eq([19900101, 19950101, 20000101, 20050101])
  # end

  # it 'stores a birthday passed from Birthday object' do
  #   new_birthday = Birthday.new(20000101, "SamJ")
  #   birthday_to_add = new_birthday.birthdate
  #   stored_birthdays= birthday_list.store_birthday(birthday_to_add)
  #   expect(stored_birthdays).to eq( [20000101])
  # end

  # it 'can store multiple birthdays passed from Birthday object' do
  #   new_birthday1 = Birthday.new(19900101, "SamJ")
  #   new_birthday2 = Birthday.new(19950101, "SamJ")
  #   new_birthday3 = Birthday.new(20000101, "SamJ")
  #   new_birthday4 = Birthday.new(20050101, "SamJ")
  #
  #   birthday_to_add1 = new_birthday1.birthdate
  #   birthday_to_add2 = new_birthday2.birthdate
  #   birthday_to_add3 = new_birthday3.birthdate
  #   birthday_to_add4 = new_birthday4.birthdate
  #
  #   store_birthday1 = birthday_list.store_birthday(birthday_to_add1)
  #   expect(store_birthday1).to eq([19900101])
  #
  #   store_birthday2 = birthday_list.store_birthday(birthday_to_add2)
  #   expect(store_birthday2).to eq([19900101, 19950101])
  #
  #   store_birthday3 = birthday_list.store_birthday(birthday_to_add3)
  #   expect(store_birthday3).to eq([19900101, 19950101, 20000101])
  #
  #   store_birthday4 = birthday_list.store_birthday(birthday_to_add4)
  #   expect(store_birthday4).to eq([19900101, 19950101, 20000101, 20050101])
  # end

#  At this stage I added an arguement to store_birthday method, making some previous tests redundant.

  it 'can store names with the birthdays' do
    new_birthday1 = Birthday.new( "SamJ", 19900101)
    new_birthday2 = Birthday.new("SamK", 19950101)
    new_birthday3 = Birthday.new("SamL", 20000101)
    new_birthday4 = Birthday.new("SamM", 20050101)

    name_to_add1 = new_birthday1.name
    name_to_add2 = new_birthday2.name
    name_to_add3 = new_birthday3.name
    name_to_add4 = new_birthday4.name

    birthday_to_add1 = new_birthday1.birthdate
    birthday_to_add2 = new_birthday2.birthdate
    birthday_to_add3 = new_birthday3.birthdate
    birthday_to_add4 = new_birthday4.birthdate

    store_birthday1 = birthday_list.store_birthday(name_to_add1, birthday_to_add1)
    expect(store_birthday1).to eq(["SamJ", 19900101])

    store_birthday2 = birthday_list.store_birthday(name_to_add2, birthday_to_add2)
    expect(store_birthday1).to eq(["SamJ", 19900101, "SamK", 19950101])

    store_birthday3 = birthday_list.store_birthday(name_to_add3, birthday_to_add3)
    expect(store_birthday1).to eq(["SamJ", 19900101, "SamK", 19950101, "SamL", 20000101])

    store_birthday4 = birthday_list.store_birthday(name_to_add4, birthday_to_add4)
    expect(store_birthday1).to eq(["SamJ", 19900101, "SamK", 19950101, "SamL", 20000101, "SamM", 20050101])
  end

  it 'can print names with birthdays on a single line each, making an easy to read list' do
    new_birthday1 = Birthday.new( "SamJ", 19900101)
    new_birthday2 = Birthday.new("SamK", 19950101)
    new_birthday3 = Birthday.new("SamL", 20000101)
    new_birthday4 = Birthday.new("SamM", 20050101)

    name_to_add1 = new_birthday1.name
    name_to_add2 = new_birthday2.name
    name_to_add3 = new_birthday3.name
    name_to_add4 = new_birthday4.name

    birthday_to_add1 = new_birthday1.birthdate
    birthday_to_add2 = new_birthday2.birthdate
    birthday_to_add3 = new_birthday3.birthdate
    birthday_to_add4 = new_birthday4.birthdate

    store_birthday1 = birthday_list.store_birthday(name_to_add1, birthday_to_add1)
    store_birthday2 = birthday_list.store_birthday(name_to_add2, birthday_to_add2)
    store_birthday3 = birthday_list.store_birthday(name_to_add3, birthday_to_add3)
    store_birthday4 = birthday_list.store_birthday(name_to_add4, birthday_to_add4)

    expect{ birthday_list.print_birthday_list }.to output("SamJ: 19900101\nSamK: 19950101\nSamL: 20000101\nSamM: 20050101\n").to_stdout
  end

#  Commented out this test due to the one after superceding it

  # it 'should check whos birthday it is today' do
  #   new_birthday1 = Birthday.new( "SamJ", 19900101)
  #   new_birthday2 = Birthday.new("SamK", 19950101)
  #   new_birthday3 = Birthday.new("SamL", 20000101)
  #   new_birthday4 = Birthday.new("SamM", 20050515)
  #
  #   name_to_add1 = new_birthday1.name
  #   name_to_add2 = new_birthday2.name
  #   name_to_add3 = new_birthday3.name
  #   name_to_add4 = new_birthday4.name
  #
  #   birthday_to_add1 = new_birthday1.birthdate
  #   birthday_to_add2 = new_birthday2.birthdate
  #   birthday_to_add3 = new_birthday3.birthdate
  #   birthday_to_add4 = new_birthday4.birthdate
  #
  #   store_birthday1 = birthday_list.store_birthday(name_to_add1, birthday_to_add1)
  #   store_birthday2 = birthday_list.store_birthday(name_to_add2, birthday_to_add2)
  #   store_birthday3 = birthday_list.store_birthday(name_to_add3, birthday_to_add3)
  #   store_birthday4 = birthday_list.store_birthday(name_to_add4, birthday_to_add4)
  #
  #   birthday_today = birthday_list.birthday_reminder
  #
  #   expect(birthday_today).to eq("SamM")
  # end

  it 'should print a birthday message' do
    new_birthday1 = Birthday.new( "SamJ", 19900101)
    new_birthday2 = Birthday.new("SamK", 19950101)
    new_birthday3 = Birthday.new("SamL", 20000101)
    new_birthday4 = Birthday.new("SamM", 20050515)

    name_to_add1 = new_birthday1.name
    name_to_add2 = new_birthday2.name
    name_to_add3 = new_birthday3.name
    name_to_add4 = new_birthday4.name

    birthday_to_add1 = new_birthday1.birthdate
    birthday_to_add2 = new_birthday2.birthdate
    birthday_to_add3 = new_birthday3.birthdate
    birthday_to_add4 = new_birthday4.birthdate

    store_birthday1 = birthday_list.store_birthday(name_to_add1, birthday_to_add1)
    store_birthday2 = birthday_list.store_birthday(name_to_add2, birthday_to_add2)
    store_birthday3 = birthday_list.store_birthday(name_to_add3, birthday_to_add3)
    store_birthday4 = birthday_list.store_birthday(name_to_add4, birthday_to_add4)

    expect{ birthday_list.birthday_reminder }.to output("It's SamM's birthday today! They are 14 years old!\n").to_stdout
  end

# how to make sure tests are robust over time - if I ran this test later it wouldn't work?!?!
# Running these tests today won't work as the test is hard coded for yesterday's date...

  it 'should print multiple birthday messages if more than one person has a birthday today' do
    new_birthday1 = Birthday.new( "SamJ", 19900101)
    new_birthday2 = Birthday.new("SamK", 19950101)
    new_birthday3 = Birthday.new("SamL", 20000515)
    new_birthday4 = Birthday.new("SamM", 20050515)

    name_to_add1 = new_birthday1.name
    name_to_add2 = new_birthday2.name
    name_to_add3 = new_birthday3.name
    name_to_add4 = new_birthday4.name

    birthday_to_add1 = new_birthday1.birthdate
    birthday_to_add2 = new_birthday2.birthdate
    birthday_to_add3 = new_birthday3.birthdate
    birthday_to_add4 = new_birthday4.birthdate

    store_birthday1 = birthday_list.store_birthday(name_to_add1, birthday_to_add1)
    store_birthday2 = birthday_list.store_birthday(name_to_add2, birthday_to_add2)
    store_birthday3 = birthday_list.store_birthday(name_to_add3, birthday_to_add3)
    store_birthday4 = birthday_list.store_birthday(name_to_add4, birthday_to_add4)

    expect{ birthday_list.birthday_reminder }.to output("It's SamL's birthday today! They are 19 years old!\nIt's SamM's birthday today! They are 14 years old!\n").to_stdout
  end
end
