require './question'
require './player'
 
  # q = Question.new()
  # print q.get_question()
  # puts q.get_answer()
  def get_user_answer(q,turn)
    if (turn % 2 == 0)
      str = 'player2'
    else
      str = 'player1'
    end 
    print str + " " +q.get_question()
    answer = gets
    answer.chomp
    return answer
  end

  def validate_answer(answer, correct_answer)
    answer_integer = answer.to_i
    if (answer_integer == correct_answer)
      return true
    end
    return false
  end

player1 = Player.new('player1')
player2 = Player.new('player2') 
turn = 1 
while (player1.live > 0 && player2.live > 0 )
  puts "-----NEW TURN-----"
  q = Question.new()
  a = get_user_answer(q,turn)
  valid = validate_answer(a, q.get_answer())
  if (turn % 2 == 0 )       
      if (!valid) 
        puts "Seriously? No!"
        player2.decrease_live()
        puts "p1 #{player1.live}/3 vs p2 #{player2.live}/3"
      else
        puts "Player2: YES! You are correct"
        puts "p1 #{player1.live}/3 vs p2 #{player2.live}/3"
      end  
  else 
      if (!valid) 
        puts "Seriously? No!"
        player1.decrease_live()
        puts "p1 #{player1.live}/3 vs p2 #{player2.live}/3"
      else
        puts "Player1: YES! You are correct" 
        puts "p1 #{player1.live}/3 vs p2 #{player2.live}/3" 
      end
  end
  turn = turn -1;
  if (player1.live == 0 || player2.live == 0)
    puts "-----GAME OVER------"
    puts "Good bye!"
  end
end
