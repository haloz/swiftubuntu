/*
 * ### defer ###
 */

// have a block of code that is executed after all other code in the function,
// just before the function returns. The code is executed even if an error in
// the function is thrown.
// use for example for setup & cleanup

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
	defer {
		fridgeIsOpen = false
	}

	// even though this stands after the defer block, the defer block is 
	// executed only before the return at the end. so the fridgeIsOpen value
	// is set to false then
	fridgeIsOpen = true 

	let result = fridgeContent.contains(food)
	return result
}

print(fridgeContains("banana"))
print(fridgeIsOpen)

print(fridgeContains("milk"))
print(fridgeIsOpen)
