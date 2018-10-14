Extension { #name : #MANumberDescription }

{ #category : #'*Magritte-Swift' }
MANumberDescription >> beSwiftDouble [
	self propertyAt: #swiftType put: #Double
]

{ #category : #'*Magritte-Swift' }
MANumberDescription >> beSwiftFloat [
	self propertyAt: #swiftType put: #Float
]

{ #category : #'*Magritte-Swift' }
MANumberDescription >> beSwiftFloat32 [
	self propertyAt: #swiftType put: #Float32
]

{ #category : #'*Magritte-Swift' }
MANumberDescription >> beSwiftFloat64 [
	self propertyAt: #swiftType put: #Float64
]

{ #category : #'*Magritte-Swift' }
MANumberDescription >> beSwiftFloat80 [
	self propertyAt: #swiftType put: #Float80
]

{ #category : #'*Magritte-Swift' }
MANumberDescription >> beSwiftInt [
	self propertyAt: #swiftType put: #Int
]

{ #category : #'*Magritte-Swift' }
MANumberDescription >> beSwiftInt16 [
	self propertyAt: #swiftType put: #Int16
]

{ #category : #'*Magritte-Swift' }
MANumberDescription >> beSwiftInt32 [
	self propertyAt: #swiftType put: #Int32
]

{ #category : #'*Magritte-Swift' }
MANumberDescription >> beSwiftInt64 [
	self propertyAt: #swiftType put: #Int64
]

{ #category : #'*Magritte-Swift' }
MANumberDescription >> beSwiftInt8 [
	self propertyAt: #swiftType put: #Int8
]

{ #category : #'*Magritte-Swift' }
MANumberDescription class >> swiftType [
	^ 'NSNumber'
]
