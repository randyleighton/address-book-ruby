require './lib/contact.rb'
require './lib/phone.rb'
require './lib/address.rb'
require './lib/email.rb'
require './lib/colors.rb'

@current_contact = nil
def main_menu
  system("clear")
  puts "[== Main Menu==]".blue
  puts "[c] create new contact"
  puts "[d] display contacts"
  puts "[x] exit"
  puts "\n\n"
  puts "Enter menu choice: "
  menu_choice = gets.chomp
  if menu_choice == "c"
    create_contact
  elsif menu_choice == "d"
    display_contact
  elsif menu_choice == "x"
    puts "Fine, just leave.".bg_red
    exit
  else
    puts "Not a valid choice."
  end
end

def create_contact
  puts "Please enter the first and last name of your contact"
  contact_name = gets.chomp
  Contact.new(contact_name).save
  @current_contact = Contact.all.last
  contact_menu
end

def display_contact
  system("clear")
  puts "[== Current Contact List ==]"
  display_with_index(Contact.all, "name")
  puts "Choose contact: "
  contact_choice = gets.chomp.to_i
  @current_contact = (Contact.all[contact_choice - 1])
  contact_menu
end

def display_with_index(collection, property)
  collection.each_with_index do |item, index|
    puts "[#{(index+1).to_s}] #{item.send(property)}"
  end
end

def contact_menu
  loop do
    system("clear")
    puts "[== Contact Menu ==]\n".blue
    puts "Current Contact: "
    puts @current_contact.name
    @current_contact.addresses.each do |item|
      puts item.address
    end

    puts "\n"
    puts "[== Make a choice ==]"
    puts "[a] address menu"
    puts "[p] phone number menu"
    puts "[e] email menu"
    puts "[x] Exit to main menu"
    puts "\n"
    menu_choice = gets.chomp
    if menu_choice == "a"
      address_menu
    elsif menu_choice == "p"
      phone_menu
    elsif menu_choice == "e"
      email_menu
    elsif menu_choice == "x"
      main_menu
    else
      puts "Not a valid choice."
    end
  end
end

def phone_menu
  loop do
    puts "[== Phone Options ==]".blue
    puts "[a] add phone number with type"
    puts "[l] list phone numbers"
    puts "[u] update phone numbers"
    puts "[x] exit"
    puts "\n"
    menu_choice = gets.chomp
    if menu_choice == "a"
      phone_menu_add
    elsif menu_choice == "l"
      phone_menu_list
    elsif menu_choice == "u"
      phone_menu_update
    elsif menu_choice == "x"
      main_menu
    else
      puts "Not a valid choice."
    end
  end
end

def phone_menu_add
  puts "Enter the Phone Number"
  phone_num = gets.chomp
  puts "What type of phone number? (Home, Cell, Work)"
  phone_typ = gets.chomp
  current_phone = Phone.new(phone_num, phone_typ)
  @current_contact.add_phone_number(current_phone)
  system("clear")
  puts "[== Phone numbers ==]"
  display_with_index(@current_contact.phone_numbers, "number")
  puts "\n\n"
end

def phone_menu_list
  system("clear")
  puts "[== Phone numbers ==]"
  @current_contact.phone_numbers.each_with_index do |item, index|
    puts "[#{(index+1).to_s}] #{item.number} #{item.type}"
  end
  puts "\n\n"
end

def phone_menu_update
  phone_menu_list
  puts "Choose the phone number you wish to update\n"
  phone_choice = gets.chomp.to_i
  current_phone = @current_contact.phone_numbers[phone_choice - 1]
  puts "The phone number you wish to update: #{current_phone.number}\n"
  puts "Enter the new number: "
  phone_num = gets.chomp
  puts "What type of phone number? (Home, Cell, Work)"
  phone_typ = gets.chomp
  current_phone.update_number(phone_num)
  current_phone.update_type(phone_typ)
  phone_menu_list
end

def address_menu
  loop do
    puts "[==Address Options==]".blue
    puts "[a] add address"
    puts "[l] list addresses"
    puts "[u] update addresses"
    puts "[x] exit"
    puts"\n"
    menu_choice = gets.chomp
    if menu_choice == "a"
      address_menu_add
    elsif menu_choice == "l"
      address_menu_list
    elsif menu_choice == "u"
      address_menu_update
    elsif menu_choice == "x"
      main_menu
    else
      puts "Not a valid choice."
    end
  end
end

def address_menu_add
  puts "Enter the Address"
  address_input = gets.chomp
  current_address = Address.new(address_input)
  @current_contact.add_address(current_address)
  address_menu_list
end

def address_menu_list
  system("clear")
  puts "[== Addresses ==]"
  display_with_index(@current_contact.addresses, "address")
  puts "\n\n"
end

def address_menu_update
  address_menu_list
  puts "Choose the address you wish to update\n"
  address_choice = gets.chomp.to_i
  current_address = @current_contact.addresses[address_choice - 1]
  puts "The address you wish to update: #{current_address.address}\n"
  puts "Enter the new address: "
  new_address = gets.chomp
  current_address.update_address(new_address)
  address_menu_list
end

def email_menu
  loop do
    puts "[==Email Options==]".blue
    puts "[a] add email with type"
    puts "[l] list emails"
    puts "[u] update emails"
    puts "[x] exit"
    puts "\n"
    menu_choice = gets.chomp
    if menu_choice == "a"
      email_menu_add
    elsif menu_choice == "l"
      email_menu_list
    elsif menu_choice == "u"
      email_menu_update
    elsif menu_choice == "x"
      main_menu
    else
      puts "Not a valid choice."
    end
  end
end

def email_menu_add
  puts "Enter the Email"
  email_input = gets.chomp
  current_email = Email.new(email_input)
  @current_contact.add_email_address(current_email)
  email_menu_list
end

def email_menu_list
  system("clear")
  puts "[== Emails ==]"
  display_with_index(@current_contact.emails, "address")
  puts "\n\n"
end

def email_menu_update
  email_menu_list
  puts "Choose the email you wish to update\n"
  email_choice = gets.chomp.to_i
  current_email = @current_contact.emails[email_choice - 1]
  puts "The email you wish to update: #{current_email.address}\n"
  puts "Enter the new email address: "
  new_email = gets.chomp
  current_email.update_address(new_email)
  email_menu_list
end

main_menu
