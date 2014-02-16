require 'gtk2'

class LaufzeitSystem

  def initialize(services)
    @services = services

# Creates the window.
    @window = Gtk::Window.new

  end

  def start

# You may call the show method of each widgets, as follows:
#   button1.show
#   button2.show
#   box1.show
#   window.show
    @window.show_all
    Gtk.main
  end

  def initial_setup(zeichenflaeche)

    # werden wir brauchen... nachdem das fenster da ist,mit einer zeichen-komponente
    # bekommt die zeichenflaeche eine canvas referenz eingepflanzt
    @zeichenflaeche = zeichenflaeche


# Specify the title and border of the window.
    @window.title = 'Hello Buttons'
    @window.border_width = 10

# The program will directly end upon 'delete_event'.
    @window.signal_connect('delete_event') do
      Gtk.main_quit
      false
    end

# We create a box to pack widgets into.
# This is described in detail in the following section.
# The box is not really visible, it is just used as a tool to arrange
# widgets.
    box1 = Gtk::HBox.new(false, 0)

# Put the box into the main window.
    @window.add(box1)

# Creates a new button with the label "Button 1".
    button1 = Gtk::Button.new('Button 1')

# Now when the button is clicked, we call the "callback" method
# with a reference to "button 1" as its argument.
    button1.signal_connect('clicked') do |w|
      2.upto(6) { |e|
        @services.service1
        #puts "bin bei #{e}"
      }

    end

# Instead of window.add, we pack this button into the invisible
# box, which has been packed into the window.
    box1.pack_start(button1, true, true, 0)

# Do these same steps again to create a second button.
    button2 = Gtk::Button.new('Button 2')

# Call the same callback function with a different argument,
# passing a reference to "button 2" instead.
    button2.signal_connect('clicked') do |w|
      @services.service2
    end

# Pack the second button in a box as well.
    box1.pack_start(button2, true, true, 0)

# Do these same steps again to create a third button.
    button3 = Gtk::Button.new('Button 3')

# Call the same callback function with a different argument,
# passing a reference to "button 3" instead.
    button3.signal_connect('clicked') do |w|
      @services.service3
    end

# Pack the third button in a box as well.
    box1.pack_start(button3, true, true, 0)

    # return
    @window
  end

end