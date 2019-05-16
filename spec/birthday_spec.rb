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
end
