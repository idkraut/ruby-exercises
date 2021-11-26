=begin
Problem
  build a mini stack-regist lang
    has commands that manipulate stack and register value
  input: a string containing commands, including n, which can be an integer
    integer arguments reset register value
  output:
    result of performing all operations
Algorithm:
  define all the methods in case statement
  initialize register to 0
  initialize stack to empty array
  create array of commands
  iterate through commands
      translate string to correct method
        call that method with register and stack
      use arrays and modifying methods
    end
=end


def call_method(string, register, stack)
  case string
  when "PRINT"
    puts(register)
  when "PUSH"
    stack << register[0]
  when "ADD"
    register[0] += stack.pop
  when "SUB"
    register[0] -= stack.pop
  when "MULT"
    register[0] *= stack.pop
  when "DIV"
    register[0] /= stack.pop
  when "MOD"
    register[0] %= stack.pop
  when "POP"
    register[0] = stack.pop
  end
end

def minilang(commands)
  register = [0]
  stack = []
  commands_array = commands.split

  commands_array.each do |command|
    if command.to_i.to_s == command
      register[0] = command.to_i
    else
      call_method(command, register, stack)
    end
  end
end

minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 4 PUSH 5 MULT ADD SUB DIV PRINT')

# minilang('5 PRINT PUSH DIV PRINT')

# minilang('PRINT')
# # 0

# minilang('5 PUSH 3 MULT PRINT')
# # 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8

# minilang('5 PUSH POP PRINT')
# # 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12

# minilang('-3 PUSH 5 SUB PRINT')
# # 8

# minilang('6 PUSH')
# # (nothing printed; no PRINT commands)