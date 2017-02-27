// Switch Statements

import Foundation
/*
 
switch <#value#> {
case <#pattern#>:
    <#code#>
default:
    <#code#>
}
 
 Switch statement considers a value and compares it against several possible matching patterns. It then executes
 an appropriate block of code, based on the first pattern that matchess successfully. A switch statement provides
 an alternative to the if statement for responding to multiple potential states.
 */

var someCharacter: Character = "a"

if someCharacter == "a" {
    print("is an A")
}



switch someCharacter {
    
    case "a":
        print("is an A")
    
    case "b", "c":              // add 2 cases using the same block of code.
        print("is a B or a C")
    
    default:
        print("some fallback")
    
}

