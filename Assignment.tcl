set fp [open "/uploads/input.txt" r]


# For the summation of the first 2 integers
set countInt 0
set sum 0

# For the string concatenation
set countString 0
set stringOfThree ""

# For the minimum length (A very big number)
set minLength 12345678900


# Counters
set countInvalid 0
set countOdds 0
set countEvens 0
set countStrings 0

# For the maximum integer value
set max 0

# Read the file "input.txt" line by line
while { [gets $fp line] >= 0 } {
     set strLen [string length $line]
    # Check if the number is an integer
    set temp [ string is integer -strict $line ]
    
    
    # Checking if the line is an integer
    if { $temp==1 } { set tempAsInteger [ expr $line+0 ] 
        # Check if this value is greater than the current max
        if { $tempAsInteger > $max } { 
            set max $tempAsInteger
        }
        
        # Incrementing the count of integers
        if { $countInt<2 } { set sum [ expr $sum+$line]
            set countInt [ expr $countInt+1 ] 
        }
        
        
        # Checking if the number
        if { $tempAsInteger%2==0 } { set evenValue [ expr $tempAsInteger * 3.25 ]
            puts "(length = ${strLen})  ${evenValue}"
            set countEvens [ expr $countEvens+1 ]
        } \
        else { set oddValue [ expr $tempAsInteger / 2 ]
            puts "(length = ${strLen})  ${oddValue}"
            set countOdds [ expr $countOdds+1 ]
        }
    } 
    
    
    # Check if the value of the line is a string
    set temp [ string is ascii $line ]
    set firstChar [ string index $line 0 ]
    
    # Condition
    set condition [ expr $temp==1 && [ string match {[A-Za-z]} $firstChar ] == 1 ]
    
    if { $condition } { puts "(length = ${strLen})  ${line}"
        # Concatenating the first 3 strings
        if { $countString<3 } { set stringOfThree $stringOfThree$line
            set countString [ expr $countString+1 ]
        }  
        
        set countStrings [ expr $countStrings+1 ]
        
        # String length
        set strLen [string length $line]
        if { $strLen < $minLength && $strLen != 0 } { set minLength $strLen }
    } 
    
    if { !$condition && [ string is integer -strict $line ] == 0} {  puts "(length = ${strLen}) INVALID LINE! ${line}" 
        set countInvalid [ expr $countInvalid+1 ]
    }
}

puts "\n"
puts "Concatenated first 3 strings             ${stringOfThree}"
puts "The Maximum Integer of All is            ${max}"
puts "The Minimum Length of a Non-Empy String  ${minLength}"
puts "The Sum of the Integers                  ${sum}"
puts "\n\n"
puts "Summary Report" 
puts "String Lines  ${countStrings}"
puts "Invalid Lines ${countInvalid}"
puts "Odd Lines     ${countOdds}"
puts "Even Lines    ${countEvens}"

close $fp
