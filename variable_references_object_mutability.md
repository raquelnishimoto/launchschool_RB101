# Variable References and Object Mutability 

Topics discussed:

- Pass by reference vs pass by value

- Variables as pointers

- Method return value vs side effects


Why is this discussion important? To understand the fundamentals of a programming language and be able to antecipate what ruby will do, when it will do it and why it will do it - when reading and/or writing code.

```each programming language works differently
Perl and C++ makes copies of objects
Javascript, Python create a link or binding to an object
```

Variable is a pointer to an object.

Object is a space in memory (bit of data) that has some sort of state - sometimes referred as value. These objects can be assigned to variables e.g. language = 'ruby'. This assignment associates the name/label 'language' to the String object whose state or value is 'ruby'.

This assignment causes the variable 'language' to reference the string object 'ruby'. It does so by storying the object id associated with the string. Then, the value 'ruby' is accessed or manipulated by using the variable name. *Every object retrieved by Ruby has an unique ID.*

Every object, including `nil` can be called on variables (calling `#object_id` ) or literals.

Assigning the variable 'language' to a new variable called 'name' - references the same string - they are aliases to each other.

![Screen Shot 2019-09-05 at 12.44.24 PM](/Users/raquelnishimoto/Desktop/Screen Shot 2019-09-05 at 12.44.24 PM.png)

Therefore, changing the object by using one of the two variables will reflect on the other variable. 

# Mutability of objects

Objects can be mutable (or changed) or immutable (cannot be changed). Different languages behave differently. For example, same string objects in C++ and Perl are mutable, while in Java and Python they are immutable.

```immutable objects in Ruby
nil
numbers
range
booleans
```

```ruby
number = 3
number = 2 + number # new object (reassignment)
number
>> 6
```

```markdown
mutable objects in ruby
* arrays
* collections
* strings
```

```ruby
# examples of mutable objects in ruby
array = ['x', 'y', 'z']
array[0] = 'b' # reassignment of element at index 0
array
>> ['b', 'y', 'z'] # modification of object array
```

```ruby
2.6.3 :059 > array = ['x', 'y', 'z']
 => ["x", "y", "z"] 
2.6.3 :060 > array.object_id
 => 70114129121800 
2.6.3 :061 > array[0].object_id
 => 70114129121860 
2.6.3 :062 > array[0] = 'b' # reassignment - variable will point to a new object
 => "b" 
2.6.3 :063 > array.object_id # same object. However, it has changed at index 0.
 => 70114129121800 
2.6.3 :064 > array[0].object_id # new object has unique object id
 => 70114129153760 
```

# Object Passing and Method side-effect

When an object is passed as an argument to a method, this method can modify its argument.

The oject will be modified based on:

- Whether object is mutable or immutable.
- How the argument is passed to the method.

### Pass by value

The original object cannot be modified.

Some languages use 'pass by value' object passing strategy, which mean that they make copies of method argument and pass those copies to the method.

### Pass by reference

Modify the original object.

Some languages use 'pass by reference' object passing strategy. This reference (to the original object) can be used to modify the original object - only if the object is mutable.

### How about using both strategies?

Some languages employ both strategies.

- Strategy can be by default.
- Or used when a special syntax, key word or declaration is used.
- Employ different defaults depending on the object type.

Regardless of which strategy is used for a given argument and method it is important to know which one is being employed, so we can understand if the method will have any side effects - whether it will modify the argument or not.

Immutable objects - pass by reference.

```ruby
def increment(number)
number = number + 1
end

value = 3 # numbers are immutable
puts increment(value)
>> 4
puts value
>> 3
```

Mutable objects can be modified by calling one of their mutating methods. 

e.g. 

# <<

# sub!

# upcase!

# concat()

### Mutating and Non-mutating methods in ruby

Mutating methods mutate their caller, but few mutate the argument e.g. 'string'.upcase!() - 'string' is the caller and () is the argument.

All methods are non-mutating with respect to immutable objects.

Assignment `=` acts as a non-mutating method, which means that it does not change the object, but it will reference that variable to a new object.

#### mutation and reference to the original object

```ruby
def fix(value)!
	value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s) # t will store the reference variable of #fix and s binds the string represented by the string 'hello' to value.
```

The variable `s` is initialised and assigned a new object of type string. 

On the following line `s` is passed as an argument to method `#fix`. This binds the string represented by 'hello' to value. Next we call `#upcase!`, at this point `value` is a reference to the original object type string.

![image-20190907121152931](/Users/raquelnishimoto/Library/Application Support/typora-user-images/image-20190907121152931.png)

`s` and `value` reference the same object. They are now aliases for the string 'hello'.

Then we call `#concat`, which is a destructive method - returning the same object. It will not create a new object.

Finally, we return a reference to the string and store it in `t`.

```ruby
def fix(value)
	value = value.upcase # reassignment - we assign the return value of value.upcase back to value.
  value.concat('!') # it creates a new copy and modifies the copy of the object.
end

s = 'hello'
t = fix(s)

```

 `s` is pointing to object of string type 'hello' and `t` references a new object - changed by reassignment in the method.

```ruby
def fix(value)
	value = value.upcase! # returns a reference to the original object to the caller - this assignment re-binds value back to the object it was previously bound to. 
  value.concat('!')
end

s = 'hello'
t = fix(s)

```

### Mutating Methods

A method will be 'mutating' if it modifies its caller or its argument.

```ruby
s = '  hello  '
s.strip! # reference to the original object. Modifies the state of the object - does not create a new object.
>> 'hello'

```

`!` is an indication that a method is mutating, but does not garantee that e.g. `#concat()`; `#[]`; `#<<` are all mutating methods.

#### Indexed assignment is mutating

```ruby
def fix(value)
	value[1] = 'x' # does not create a new object. References the same (albeit modified) object. #[] = is a method that mutates its object. It is not reassignment.
  value
end

s = 'abc'
t = fix(s)

```

Same with arrays - it is the element that is assigned to a new object and not the collection itself.

#### Concatenation is mutating

`#<<`, hashes, arrays, `#concat`, strings - these methods do not create new objects. The object referenced by the caller (e.g. variable) is modified.

#### Setters are mutating

Setters behave similarly to index assignment. 

```ruby
# they mutate the object bound to person
person.name = 'Mayumi'
person.age = 37 

```

#### '+ =' and '* = ' are always non-mutating

### First mental model

Only appear to work like this -> Immutable objects seem to be pass by value, while mutable objects seem to be pass by reference. 

Assignment can break the binding between an argument name and the object it references.

# Object Passing

Object passing references to how data is passed around by a language. What happens to the original object passed to or returned by a method.

In ruby nearly everything is an object - e.g. object literal, variable name, complex expressions.

#### Method argument

When you call a method with some expression as an argument, this expression is evaluated by ruby and ultimately reduced to an object. Then, ruby makes that object available inside the method. This is called object passing.

#### Caller/ Receiver

The object on which the method (applies to blocks, procs and lambdas) is called can be thought of 'implicit argument'. 

Returned values are passed by those methods back to the caller.

`#+`, `#*`,`#[]`, `#!` are methods and `#=` act like a method.

`y + z`

`operands`, such as y and z are arguments and have return values. 

### Evaluation Strategy

Ruby uses strict evaluation strategy - each programming language used some sort of evaluation strategy.

`Strict evaluation strategy` means that every expression is evaluated and converted to an object before it is passed along to a method.

**pass by value** and **pass by reference** are the two most common strict evaluation strategies. It is important to know if and when the language is using which strategy in order to know if the change is local to the method or is it modifies the original object.

Pass by value maked a copy of the objects so it is not possible to change it. Immitable objects such as numbers, nil, range, boolean act as pass by value.

Pass by reference is a reference to the object. The original object is passed around, establishing an alias to the original object. Both implicit and explicit arguments and the object refer to the same location in memory.

Variables contain references to objects. If a literal is passed to a method, ruby will first convert the literal to an object and internally create a reference to that object. Literal references can be thought of as anonimous, nameless references.

### Second mental model

Ruby is refered as `pass by reference of the value`; `pass by reference value`; or `pass by value of the reference`. It all boils down to the fact that ruby passes around copies of the reference.

###### Pass by reference: 

variables are references and this concept applies to both mutable and immutable objects. However,  this reference is not a garantee that the object cvcan be modified.

###### Pass by value:

if ruby was purely pass by reference, assignment would be mutating, but it is not. Because variables and constants are not objects. They are pointers or references to objest. Assignment merely changes which object is bound to which variable.
