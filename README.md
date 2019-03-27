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

1. Start with a base class for all your models:

```smalltalk
GRObject subclass: #MyModel
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'MyPackage'
```

2. Make is serializable:

```smalltalk
MyModel class>>isSwiftSerializable
  ^ true
```

3. `MyModel` should be inheriting from `Object`, and its subclasses - from `MyModel`:

```smalltalk
MyModel class>>swiftClassContainer
  | container |

  container := self magritteDescription swiftSerializableChildren isEmptyOrNil
    ifTrue: [ MASwiftClassContainer new
      swiftName: self name asSymbol;
      inheritsFrom: #(#Object);
      yourself ]
    ifFalse: [ super swiftClassContainer yourself ].

  self ~= MyModel
    ifTrue: [ container inheritsFrom: (Array with: MyModel name asSymbol) ].
  ^ container
```

4. Be sure to make the property codable and include appropriate declaration modifiers:

```smalltalk
MyModel class>>someProperty
  <magritteDescription>
  ^ MAElementDescription new
      "..."
      beSwiftCodable;
      swiftDeclarationModifiers: #(#'@objc' #dynamic);
      yourself.
```

5. Override #asSwift to return a `MASwiftCanvas` that uses our own document root class which would take care of importing Realm framework:

```smalltalk
MyModel class>>asSwift
  ^ MASwiftCanvas builder
    fullDocument: true;
    rootClass: MyModelSwiftRoot;
    render: self
```

6. Add custom document root:

```smalltalk
MASwiftRoot subclass: #MyModelSwiftRoot
  instanceVariableNames: ''
  classVariableNames: ''
  package: 'MyPackage'
  
MySwiftRoot>>initialize
  super initialize.
  imports add: (MASwiftImportDeclaration named: #RealmSwift). "<- this adds 'import RealmSwift' to the list of file imports"
```

7. Base your smalltalk classes on the base class:

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
