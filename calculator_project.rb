puts "Welcome to our calculator project."
puts "Please enter the first number."
number_1 = gets.chomp.to_i
puts "Please enter the operation."
operation = gets.chomp
puts "Please enter the second number."
number_2 = gets.chomp.to_i

def calculate (number_1, operation, number_2)
  calculator = "*"
  while calculator == "*"
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
      return total

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
    puts "If you would like to enter another calculation enter *. If you would like to quit enter anything else."
    calculator = gets.chomp
  end
end
puts "Your solution is #{calculate(number_1, operation, number_2)}!"
