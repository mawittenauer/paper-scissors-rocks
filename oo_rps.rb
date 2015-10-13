class Player
  attr_accessor :name, :choice
  CHOICES = ['paper', 'scissors', 'rock']
  
  def initialize
    puts "Enter your name:"
    @name = gets.chomp
  end
  
  def make_choice
    begin
      puts "Hello #{name}, Please enter - Paper, Scissors or Rock?"
      self.choice = gets.chomp.downcase
    end until CHOICES.include?(self.choice)
  end

  def print_choice
    puts "#{name} chose #{choice}"
  end
end

class Computer < Player
  def initialize
    @name = 'computer'
  end
  
  def make_choice
    self.choice = CHOICES.sample
  end
end

class Game
  attr_accessor :player, :computer, :play_again
  
  def initialize
    @player = Player.new
    @computer = Computer.new
    @play_again = "yes"
  end
  
  def play
    while play_again == 'yes'
      system 'clear'
      player.make_choice
      computer.make_choice
      player.print_choice
      computer.print_choice
      print_winning_choice(winning_choice?)
      print_winner_message
      play_again?
    end
  end
    
  def play_again?
    puts "Would you like to play again? (type 'yes' or 'no')"
    self.play_again = gets.chomp.downcase
  end
  
  def winning_choice?
    if player.choice == computer.choice
      nil
    elsif player.choice == 'rock' && computer.choice == 'scissors' ||
          player.choice == 'paper' && computer.choice == 'rock' ||
          player.choice == 'scissors' && computer.choice == 'paper'
      player.choice
    else
      computer.choice
    end
  end
  
  def print_winner_message
    if self.winning_choice? == player.choice
      puts "You win!"
    elsif self.winning_choice? == computer.choice
      puts "Computer wins!"
    else
      puts "It's a tie!"
    end
  end
  
  def print_winning_choice(winner)
    if winner == "paper"
      puts "Paper covers rock!"
    elsif winner == "scissors"
      puts "Scissors cuts paper!"
    elsif winner == "rock"
      puts "Rocks crushes scissors!"
    end
  end
end

Game.new.play
