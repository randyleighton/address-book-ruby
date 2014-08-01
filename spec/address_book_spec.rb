require 'rspec'
require 'contact'
require 'phone'
require 'address'
require 'email'

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
    it 'adds a new phone number to the contact object instance' do
      randy = Contact.new('Randy')
      new_phone_number = Phone.new('503-555-1212', 'Home')
      randy.add_phone_number(new_phone_number)
      expect(randy.phone_numbers).to eq [new_phone_number]
    end
  end

  describe 'add_address' do
    it 'adds a new address to the contact object instance' do
      jenny = Contact.new('Jenny')
      new_address = Address.new("555 Movie Star Way Hollywood CA")
      jenny.add_address(new_address)
      expect(jenny.addresses).to eq [new_address]
    end
  end

  describe 'add_email_address' do
    it 'adds a new email address to the contact object instance' do
      minnie = Contact.new('Minnie')
      new_email_address = Email.new("minnie@disney.com")
      minnie.add_email_address(new_email_address)
      expect(minnie.emails).to eq [new_email_address]
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
  it 'initializes an address object with an address and displays it' do
    test_address = Address.new('123 Hey Way, Portland, OR')
    expect(test_address).to be_an_instance_of Address
    expect(test_address.address).to eq '123 Hey Way, Portland, OR'
  end
  #coming soon to a coder near you
  it 'updates the address' do
    test_address = Address.new('123 Hey Way, Portland, OR')
    test_address.update_address('456 Hey Way, Portland, OR')
    expect(test_address.address).to eq '456 Hey Way, Portland, OR'
  end
end

describe 'Email' do
  it 'initializes an email object with an email and displays it' do
    test_email = Email.new('joeb@joeb.com')
    expect(test_email).to be_an_instance_of Email
    expect(test_email.address).to eq 'joeb@joeb.com'
  end

  it 'updates the email' do
    test_email = Email.new('joeb@joeb.com')
    test_email.update_address('joseph@hireme.com')
    expect(test_email.address).to eq 'joseph@hireme.com'
  end
end





