=begin
Problem
  input: string; can contain non-alphas
  output: string with staggered caps
            if a non-alpha appears, alternation pattern skips that char
Data
  character array?
Algo:
  inititialize return_string
  split input string into chars array
  set uppercase flag to true
  iterate through charsarray
    check if alpha
      next if not
    char gets upcased if uppercase flag
            else it gets downcased
    concatenate to new string
    !uppercase flag
  return new string
=end

ALPHABET = ("A".."Z").to_a + ("a".."z").to_a

def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if !ALPHABET.include?(char)
      result << char
      next
    elsif uppercase
      result << char.upcase
    else
      result << char.downcase
    end
    need_upper = !need_upper
  end
  result
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'