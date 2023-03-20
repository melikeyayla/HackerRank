//
//  main.swift
//  AdvancedSwiftProject
//
//  Created by Melike Yayla on 20.03.2023.
//

import Foundation

let classJames = MusicianClass(nameInput: "James", ageInput: 50, instrumentInput: "Guitar")

//print(classJames.age)


var structJames = MusicianStruct(name: "James", age: 50, instrument: "Guitar")

//IMMUTABLE STRUCT

//print(structJames.age)

classJames.age = 51

//print(classJames.age)

structJames.age = 51
//print(structJames.age)

//REFERENCE VS VALUE

let copyOfClassJames = classJames

var copyOfStructJames = structJames

//print(copyOfClassJames.age)

//print(copyOfStructJames.age)

copyOfClassJames.age = 52
copyOfStructJames.age = 52

//print(copyOfClassJames.age)

//print(copyOfStructJames.age)

//print(classJames.age) // reference type
//print(structJames) // value type

//reference types -> class
//copy -> same object  new reference -> 1 object + 2 Reference

//value types -> struct
//copy -> new object -> 2 object

//Function vs Mutating Function

//print(classJames.age)
classJames.happyBirthday()
//print(classJames.age)

print(structJames.age)
structJames.happyBirthday()
print(structJames.age)
