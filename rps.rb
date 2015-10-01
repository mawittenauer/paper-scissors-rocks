puts "Play Paper Rock Scissors!"
CHOICES = { 'p' => 'paper', 's' => 'scissors', 'r' => 'rocks' }

loop do
  
  #Get The Players Choice
  begin
    puts "Choose one: (P/R/S)"
    player_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(player_choice)

  #Get Computer Choice
  computer_choice = CHOICES.keys.sample

  #Main Game Logic
  if computer_choice == player_choice
    puts "It's a tie!"
  elsif (computer_choice == 'p' && player_choice == 'r') || 
        (computer_choice == 's' && player_choice == 'p') || 
        (computer_choice == 'r' && player_choice == 's')
    puts "Computer won!"
    puts "#{CHOICES[computer_choice]} beats #{CHOICES[player_choice]}"
  else
    puts "You won!"
    puts "#{CHOICES[player_choice]} beats #{CHOICES[computer_choice]}"
  end
  
  #Ask To Play Again
  puts "Play again?(Y/N)"
  play_again = gets.chomp
  if play_again.downcase == 'n'
    break
  end
  
end

