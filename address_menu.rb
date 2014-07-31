require './lib/contact.rb'
require './lib/phone.rb'


@current_contact = nil
def main_menu
  system("clear")
  puts "[== Main Menu==]"
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
    puts "Fine, just leave."
    exit
  else
    puts "Not a valid choice."
  end

end

def create_contact
  puts "[==Please enter the first and last name of your contact==]"
  contact_name = gets.chomp
  Contact.new(contact_name).save
  @current_contact = Contact.all.last
  contact_menu
end

def display_contact
  system("clear")
  puts "[== Current Contact List ==]"
  display_with_index(Contact.all)
  puts "Choose contact: "
  contact_choice = gets.chomp.to_i
  @current_contact = (Contact.all[contact_choice - 1])
  contact_menu
end

def display_with_index(object_type)
  object_type.each_with_index do |item, index|
  # Contact.all.each_with_index do |item, index|
    puts "[#{(index+1).to_s}] #{item.name}"
  end
end

def contact_menu
  loop do
    system("clear")
    puts "[== Contact Menu ==]\n"
    puts "Current Contact: "
    puts @current_contact.name
    puts @current_contact.address
    puts @current_contact.phone
    puts @current_contact.email
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
def address_menu
  puts "[==Address Options==]"
  puts "[a] add address with type"
  puts "[l] list addresses"
  puts "[u] update addresses"
  puts "[x] exit"
  puts"\n"
  menu_choice = gets.chomp
    if menu_choice == "a"

    elsif menu_choice == "l"

    elsif menu_choice == "u"

    elsif menu_choice == "x"
      main_menu
    else
      puts "Not a valid choice."
    end


end

def email_menu
  puts "[==Email Options==]"
  puts "[a] add email with type"
  puts "[l] list emails"
  puts "[u] update emails"
  puts "[x] exit"
  puts "\n"
  menu_choice = gets.chomp
    if menu_choice == "a"

    elsif menu_choice == "l"

    elsif menu_choice == "u"

    elsif menu_choice == "x"

    else
      puts "Not a valid choice."
    end


end

def phone_menu
  loop do
    # system("clear")
    #display_with_index(Phone.all)
    puts "[== Phone Options ==]"
    puts "[a] add phone number with type"
    puts "[l] list phone numbers"
    puts "[u] update phone numbers"
    puts "[x] exit"
    puts "\n"
    menu_choice = gets.chomp
    if menu_choice == "a"
      phone_menu_add
    elsif menu_choice == "l"

    elsif menu_choice == "u"

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
  puts "Phone numbers"
  #display_with_index(@current_contact.phone_numbers[])
  @current_contact.phone_numbers.each_with_index do |item, index|
    puts "[#{(index+1).to_s}] #{item.number} #{item.type}"
  end

end








main_menu
