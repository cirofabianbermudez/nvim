# OOP notes

Object-Oriented Programming (OOP) revolves around four main concepts:

- Encapsulation
- Inheritance
- Abstraction
- Polymorphism

Encapsulation bundles data with methods, inheritance lets you create subclasses,
abstraction hides complex details, and polymorphism allows for different 
implementations.

1. **Encapsulation** allows you to **bundle data (attributes) and behaviors 
(methods)** within a class to create a cohesive unit. By defining methods to 
control access to attributes and its modification, encapsulation helps maintain
data integrity and promotes modular, secure code, `public`, `private`.

2. **Inheritance** enables the creation of hierarchical relationships between
classes allowing a subclass to inherit attributes and methods from a parent 
class. This promotes code reuse and reduces duplication.

3. **Abstraction** focuses on hiding implementation details and exposing only
the essential functionality of an object. By enforcing a consistent interface,
abstraction simplifies interactions with objects, allowing developers to **focus
on what an object does rather than how it achieves its functionality**.

4. **Polymorphism** allows you to treat object of different types as instances
of the same type, as long as they implement a common interface of behavior.

Classes allow you to create user-defined data structures. Classes define functions
called **methods**, which identify the behaviors and actions that an object 
created from the class can perform with its data.

A class is a blueprint for how to define something. While the class is the
blueprint, an **instance** is an object that's built from a class and contains
real data.

When you create a new class instance the variables that hold information are
called instance **attributes**.

Collectively, attributes and methods can be refereced as **members** of a class.

- Interfaces and abstract classes provide abstraction by defining a contract of
behaviors without revealing implementation details. They specify what an object
can do, while the implementing class encapsulates how it does it.

## Relations Between Objects

- Inheritance is the ability to build new classes on top of existing ones.
Then main benefit of inheritance is code reuse.
 

### Dependency


- Dependency: Class А can be affected by changes in class B.

- Association: Object А knows about object B. Class A depends on B.

- Aggregation: Object А knows about object B, and consists of B. Class A depends
on B.

-Composition: Object А knows about object B, consists of B, and manages B’s life
cycle. Class A depends on B.

- Implementation: Class А defines methods declared in interface B. Objects A can
be treated as B. Class A depends on B.

- Inheritance: Class А inherits interface and implementation of class B but can
extend it. Objects A can be treated as B. Class A depends on B.
