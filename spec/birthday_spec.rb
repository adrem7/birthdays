require 'birthday'

describe Birthday do
  let(:birthday) {Birthday.new("SamJ", 20000101)}

  it 'shows class Birthday exists' do
    expect(birthday).to be_a_kind_of(Birthday)
  end

  it 'birthday variable can be got' do
    expect(birthday.birthdate).to eq(20000101)
  end

  it 'name variable can be got' do
    expect(birthday.name).to eq ("SamJ")
  end

  # it 'can store a name against a birthday' do
  #   birthday_to_add = 19900101
  #   name_to_add = "SamJ"
  #
  #   stored_birthday = birthday.store_birthday(name_to_add, birthday_to_add)
  #
  #   expect(stored_birthday).to eq({"SamJ" => 19900101})
  # end
end
