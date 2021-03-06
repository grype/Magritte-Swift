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
GRObject subclass: #She
  uses: TMASwiftDescribing
  instanceVariableNames: 'name balance seashore shells'
  classVariableNames: ''
  poolDictionaries: ''
  category: 'SheSellsSeashellsByTheSeashore'!
```

After generating accessors for the ivars, let's add magritte descriptions for those properties:

```smalltalk
She class>>nameDescription
  <magritteDescription>
  ^ MAStringDescription new
    label: 'Name';
    accessor: #name;
    beSwiftCodable;    "<- makes this property Codable"
    swiftName: #name;  "<- swift name of the property"
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

To retrieve the string declaration of that class in Swift:

```smalltalk
She asSwift.
```

which should produce:

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

### Required attributes

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

### Numbers

By default, MagritteSwift will use NSNumber as the numeric type. Let's try change that to a Double, making it required and initialized to a value:

```smalltalk
balanceDescription
  <magritteDescription>
  ^ MANumberDescription new
    label: 'Balance';
    accessor: #balance;
    beSwiftCodable;
    swiftName: #balance;
    swiftType: #Double;    "<- Specify name of swift type"
    beRequired;            "<- Required"
    swiftDefaultValue: 0;  "<- Initial value"
    swiftDeclarationModifiers: #(#'private(set)'). "<- declaration modifiers is just a collection of swift source strings"
    yourself
```

The resulting swift declaration should now look like this:

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

A more fine-grained declaration can be seen here:

```smalltalk
MyClass class>>myPropertyDescription
  ^ MANumberDescription new
    swiftName: #foo;
    "let foo = ... as opposed to: let foo: SomeType = ..."
    swiftType: SwiftInferredType;
    " let foo = ?"
    swiftDefaultValue:
      "create initialization expression MyType<Generic>()"
      (MASwiftInitializingExpression new
        type: (MASwiftType new
	  name: #MyType;
	  genericParameters: #(#Generic);
	  yourself);
	yourself);
    "let as opposed to var"
    beSwiftConstant;
    yourself
```

That should produce:

```swift
let foo = MyType<Generic>()
```

### How do I make this generate [Realm](https://realm.io) models?

Generation of class description for Realm models requires a few tweaks, and the easiest way to accomplish that is to use `TMASwiftRealmDescribing` trait, as opposed to `TMASwiftDescribing`:

```smalltalk
GRObject subclass: #MyModel
  uses: TMASwiftRealmDescribing
  instanceVariableNames: ''
  classVariableNames: ''
  package: 'MyPackage'
```

Better yet, let's use that as the base class for all of our models, which allows us to create extensions in Swift, that are applicable to all models:

```smalltalk
MyModel subclass: #MyFriend
	instanceVariableNames: 'nickname'
	classVariableNames: ''
	package: 'MyPackage'
	
MyFriend class>>nicknameDescription
  <magritteDescription>
  ^ MAStringDescription new
    label: 'Nickname';
    accessor: #nickname;
    beSwiftCodable;
    swiftName: #nickname;
    swiftDeclarationModifiers: #(#'@objc' #dynamic);
    yourself
```

`MyModel asSwift`:

```swift
import Foundation
import RealmSwift

class MyModel : Object {

}
```

`MyFriend asSwift`:

```swift
import Foundation
import RealmSwift

class MyFriend : MyModel, Codable {
  @objc dynamic var nickname: String?

  enum CodingKeys : String, CodingKey {
    case nickname
  }
}
```

That's it...
