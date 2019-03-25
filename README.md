# Magritte-Swift

Extends Magritte with ability to generate Swift class declarations from Smalltalk classes.

## Installing

```smalltalk
Metacello new
	baseline: 'MagritteSwift';
	repository: 'github://grype/Magritte-Swift';
	onConflictUseLoaded;
	load.
```

Magritte-Swift depends on Magritte3, which is still tied to Seaside on smalltalkhub. So if you've loaded Seaside from GitHub, be sure to include #onConflictUseLoaded, as indicated above...

## Using

As an example, let's start with a simple class that defines a few basic types of properties:

```smalltalk
Object subclass: #She
  instanceVariableNames: 'name balance seashore shells'
  classVariableNames: ''
  poolDictionaries: ''
  category: 'SheSellsSeashellsByTheSeashore'!
```

After generating accessors for the ivars, let's make it possible to generate swift class declaration from this class:

```smalltalk
She class>>isSwiftSerializable
  ^ true
```

Then define, again on the class side, methods that return magritte description for those properties:

```smalltalk
She class>>nameDescription
  <magritteDescription>
  ^ MAStringDescription new
    label: 'Name';
    accessor: #name;
    beSwiftCodable;
    swiftName: #name;
    yourself.
    
She class>>balanceDescription
  <magritteDescription>
  ^ MANumberDescription new
    label: 'Balance';
    accessor: #balance;
    beSwiftCodable;
    swiftName: #balance;
    yourself.
    
She class>>seashoreDescription
  <magritteDescription>
  ^ MAToOneRelationDescription new
    label: 'Seashore';
    accessor: #seashore;
    classes: { Seashore };
    beSwiftCodable;
    swiftName: #seashore;
    yourself.
    
She class>>shells
  <magritteDescription>
  ^ MAToManyRelationDescription new
    label: 'Shells';
    accessor: #shells;
    classes: { Shell };
    beSwiftCodable;
    swiftName: #shells;
    yourself.
```

After we did that, we can retrieve a string declaration of that class in Swift via #asSwift:

```smalltalk
She asSwift.
```

and this is what we'd get:

```swift
import Foundation

class She : Codable {
	var seashore: Seashore?
	var shells: [Shell]?
	var name: String?
	var balance: NSNumber?

	enum CodingKeys : String, CodingKey {
		case seashore
		case shells
		case name
		case balance
	}
}
```

Now let's say that the #name is a required attribute:

```smalltalk
She class>>nameDescription
  <magritteDescription>
  ^ MAStringDescription new
    label: 'Name';
    accessor: #name;
    required: true; "<-- Adding required field"
    beSwiftCodable;
    swiftName: #name;
    yourself.
```

That would produce a slightly different swift declaration of the class:

```swift
class She : Codable {
	var seashore: Seashore?
	var shells: [Shell]?
	var name: String
	var balance: NSNumber?

	init(name aName: String) {
		name = aName
	}

	enum CodingKeys : String, CodingKey {
		case seashore
		case shells
		case name
		case balance
	}
}
```

Notice that the property is no longer optional and an init() method declaration was added...

By default, MagritteSwift will use NSNumber as the numeric type. Let's try change that to a Double, and while at it - make it required, initialized to 0 and a private setter:

```smalltalk
balanceDescription
  <magritteDescription>
  ^ MANumberDescription new
    label: 'Balance';
    accessor: #balance;
    beSwiftCodable;
    swiftName: #balance;
    swiftType: #Double;
    beRequired;
    swiftDefaultValue: 0;
    swiftDeclarationModifiers: #(#'private(set)')
    yourself
```

The resulting swift declaration is:

```swift
class She : Codable {
	var seashore: Seashore?
	var shells: [Shell]?
	var name: String
	private(set) var balance: Double = 0

	init(name aName: String) {
		name = aName
	}

	enum CodingKeys : String, CodingKey {
		case seashore
		case shells
		case name
		case balance
	}
}
```
