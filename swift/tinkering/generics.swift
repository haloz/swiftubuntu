/*
 * ### generics ###
 */

// generics are kind of swift's pendents of C++ templates. In C++ this was:
/*
	template <typename T>
	T max(T x, T y)
	{
		T value;
		if (x < y)
			value = y;
		else
			value = x;
		return value;
	}
*/

// or similar Java's generics:
/*
	public class Pocket<T>
	{
		private T value;
		public Pocket() {}
		public Pocket( T value ) { this.value = value; }
		// ...
	}
*/

// So in swift:

// for a given type this func returns an array of n elements of this type
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
	var result = [Item]() // empty array of Item 
	for _ in 0...numberOfTimes { // underscore if index not needed
		result.append(item)
	}
	return result
}

let number = 10
let intArray = makeArray(repeating: number, numberOfTimes: 9)
print(intArray)

// generic form of enum
// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
	case none
	case some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .none
print(possibleInteger)

possibleInteger = .some(100)
print(possibleInteger)

// where
// where specifies a list of requirements. So require the type to implement a
// protocol. Or require two types be the same, or a class to have a particular
// superclass

// Sequence is a protocol. It is adopted for example by NSArray. It brings for
// example the Iterator associated type.

// Equatable is another protocol, one of swift's comparison protocols 

// syntax here:
// func funcName<type 1, type2>(param 1, param2) -> ReturnValue where ... {}
func anyCommonElement<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool 
	where 
	 	T.Iterator.Element: Equatable, 
	 	T.Iterator.Element == U.Iterator.Element {
	for lhsItem in lhs {
		for rhsItem in rhs {
			if lhsItem == rhsItem {
				return true
			}
		}
	}	
	return false
}
print(anyCommonElement([1, 2, 3], [3])) //true
print(anyCommonElement([1, 2, 3], [4])) //false

// note: this does not do element-based type checks. so this works:
print(anyCommonElement([1, 2, 3], [3.0])) // true


