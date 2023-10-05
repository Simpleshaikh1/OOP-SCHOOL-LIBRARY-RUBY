# rubocop:disable Metrics
class Execute
  def initialize(user_choice)
    @user_choice = user_choice
  end

  def execute
    case @user_choice

    when 1
      puts App.list_books
      Main.new.display_ui

    when 2
      puts App.list_persons
      Main.new.display_ui

    when 3
      App.create_person
      Main.new.display_ui

    when 4
      App.create_book
      Main.new.display_ui

    when 5
      App.create_rental
      Main.new.display_ui

    when 6
      App.list_rentals
      Main.new.display_ui

    when 7
      App.save_data
      abort 'Thank you for using the app. Good bye for now !'

    else
      puts ' Invalid choice. Please enter a valid option'
      Main.new.display_ui
    end
  end
end
# rubocop:enable Metrics
