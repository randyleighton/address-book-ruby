require 'rspec'
require 'contact'
require 'phone'

describe Contact do
  before do
    Contact.clear
  end
end

describe 'Contact' do

  describe '.clear' do
    it 'empties out all of the saved contacts' do
    Contact.new('Joe Brown').save
    Contact.clear
    Contact.all.should eq []
    end
  end

  describe '.all' do
    it 'lists out all contact names' do
      test_contact = Contact.new("Joe Brown")
      another_test_contact = Contact.new ("Kathy Lee")
      test_contact.save
      another_test_contact.save
      Contact.all
      expect(Contact.all). to eq [test_contact,another_test_contact]
    end
  end

  it 'initializes a contacts object with contact name' do
    test_contact = Contact.new("Joe Brown")
    expect(test_contact).to be_an_instance_of Contact
  end

  it 'updates our contact object with address, phone, and email' do
    test_contact = Contact.new("Joe Brown")
    test_contact.set_address("123 Hey Way, Portland OR")
    test_contact.set_phone("503-555-1212")
    test_contact.set_email("joeb@joeb.com")
    expect(test_contact.name).to eq "Joe Brown"
    expect(test_contact.address).to eq "123 Hey Way, Portland OR"
    expect(test_contact.phone).to eq "503-555-1212"
    expect(test_contact.email).to eq "joeb@joeb.com"
  end

  describe 'add_phone_number' do
    it 'adds a new phone number to the contact' do
      randy = Contact.new('Randy')
      new_phone_number = Phone.new('503-555-1212', 'Home')
      randy.add_phone_number(new_phone_number)
      expect(randy.phone_numbers).to eq [new_phone_number]
    end
  end

end

describe 'Phone' do
  it 'initializes a phones object with a phone number and type' do
    test_phone = Phone.new('503-555-1212', 'Home')
    expect(test_phone).to be_an_instance_of Phone
    expect(test_phone.number).to eq '503-555-1212'
    expect(test_phone.type).to eq 'Home'
  end

  it 'updates the phone number and type' do
    test_phone = Phone.new('503-522-8552', 'Home')
    test_phone.update_number('503-225-2558')
    test_phone.update_type('Cell')
    expect(test_phone.number).to eq '503-225-2558'
    expect(test_phone.type).to eq 'Cell'
  end

end

describe 'Address' do
  it "does something really fun" do
    test_contact = Contact.new("Chucky Redrum")
  end
end

describe 'Email' do
  it "does something amazingly fun" do
    test_contact = Contact.new("Chucky Redrum")
  end
end








