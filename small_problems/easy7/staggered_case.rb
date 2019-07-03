def staggered_case_alternate(string)
  staggered_string = []
  string.split('').each_index do |idx|
    staggered_string << if string[idx].match?(/[a-zA-Z]/)
                          if idx.even?
                            string[idx].upcase
                          elsif idx.odd?
                            string[idx].downcase
                          end
                        else
                          string[idx]
                        end
  end
  staggered_string.join
end

def staggered_case_options(string, need_upper = true)
  result = ''
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

def staggered_case(string)
  counter = 0
  result = []
  string.each_char do |char|
    result << if char.match(/[a-zA-Z]/)
                if counter.even?
                  counter += 1
                  char.upcase
                else
                  counter += 1
                  char.downcase
                end
              else
                char
              end
  end
  result.join
end

def staggered_case_option(string, non_alpha = true)
  non_alpha ? staggered_case(string) : staggered_case_alternate(string)
  end

# p staggered_case_options('I Love Launch School!', false)
# p staggered_case_alternate('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case_alternate('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
# p staggered_case('I Love Launch School!')
# p staggered_case('ignore 77 the 444 numbers')
# p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# p staggered_case('ALL CAPS') == 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

  p staggered_case_option('ignore 77 the 444 numbers', false)
  p staggered_case_option('ignore 77 the 444 numbers')
  p staggered_case_option('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 NuMbErS'
  p staggered_case_option('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
