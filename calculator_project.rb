
def calculate 
  puts "Welcome to our calculator feature."
  puts "Please enter the first number."
  number_1 = gets.chomp.to_i
  puts "Please enter the operation."
  operation = gets.chomp
  puts "Please enter the second number."
  number_2 = gets.chomp.to_i
    if operation == "+" || operation == "plus" || operation == "add"
      return number_1 + number_2

    elsif operation == "-" || operation == "minus" || operation == "subtract"
      return number_1 - number_2

    elsif operation == "*" || operation == "times" || operation == "multiplication" || operation == "multiply"
      return number_1 * number_2

    elsif operation == "/" || operation == "divided" || operation == "division" || operation == "divided by"
      return number_1.to_f / number_2.to_f

    elsif operation == "^" || operation == "to the" || operation == "power" || operation == "exponent"
      total = number_1
      while number_2 > 1
        total = total * number_1
        number_2 -=1
      end
      puts total

    elsif operation == "root" || operation == "√" || operation == "sqrt" || operation == "rt"
      if number_2 % 3 == 0 || number_2 % 7 == 0 || number_2 % 11 == 0
        return (number_1 ** (1/number_2.to_f)).to_i + 1   
      else
        return number_1 ** (1/number_2.to_f)
      end
      # Add new features here
      # 
    else 
      return "Function not yet supported."
    end   
end

def graphing
  return "Unfortunately, we are still working on finishing the 'graphing' feature and it is not yet supported."
end

def name_generator
  return "Unfortunately, we are still working on finishing the 'random name' feature and it is not yet supported."
end

puts "Welcome to our calculator program! - Greg, Jethro, and Luca"
puts "Please start by choosing what feature you would like to use."
user_input = ""
while user_input != "end" do
  puts "To use the calculator enter 'calc'. To use the graphing feature enter 'graphing'. To use the random name generator enter 'random name'. To exit the program enter 'end'."
  user_input = gets.chomp
  
  if user_input == "calc"
    answer = calculate
    puts "Congrats your solution was #{answer}"
  elsif user_input == "graphing"
    puts graphing
  elsif user_input == "random name"
    puts name_generator
  else
    puts "This feature is not included in our program yet."
  end
end

puts "You have exited the program. Thank you for using our calculator!"


