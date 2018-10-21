//: [Previous](@previous)
/*:
 # Animal Shelter
 An animal shelter, which holds only dogs and cats, operates on a strictly "first in, first out"basis. People must adopt either the "oldest"(based on arrival time) of all animals at the shelter, or they can select whether they would prefer a dog or a cat (and will receive the oldest animal of that type). They cannot select which specific animal they would like. Create the data structures to maintain this system and implement operations such as enqueue, dequeueAny, dequeueDog, and dequeueCat. You may use the built-in LinkedList data structure.
 */
import Foundation

class Animal: CustomStringConvertible {
    private(set) var order: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func set(order: Int) {
        self.order = order
    }
    
    var description: String {
        return "(name: \(name), order: \(order))"
    }
}

class Dog: Animal {}
class Cat: Animal {}

class AnimalShelter: CustomStringConvertible {
    
    private var dogs: LinkedList<Dog> = LinkedList<Dog>.init()
    private var cats: LinkedList<Cat> = LinkedList<Cat>.init()
    private var order: Int = 0
    
    init() {}
    
    func enqueue(_ animal: Animal) {
        animal.set(order: order)
        order += 1
        if let dog = animal as? Dog {
            dogs.append(dog)
        } else if let cat = animal as? Cat {
            cats.append(cat)
        }
    }
    
    func dequeueDog() -> Dog? {
        return dogs.removeFirst()
    }
    
    func dequeueCat() -> Cat? {
        return cats.removeFirst()
    }
    
    func dequeueAny() -> Animal? {
        
        if dogs.count == 0 {
            return cats.removeFirst()
        } else if cats.count == 0 {
            return dogs.removeFirst()
        }
        
        let dog = dogs.peek!
        let cat = cats.peek!
        
        if dog.order < cat.order {
            return dog
        } else {
            return cat
        }
    }
    
    var description: String {
        return "AnimalShelter: (Dogs: \(dogs.count), Cats: \(cats.count))"
    }
    
}

let animalshelter = AnimalShelter()

animalshelter.dequeueAny()

let dog = Dog(name: "Dog - 1")
animalshelter.enqueue(dog)

var cat = Cat(name: "Cat - 1")
animalshelter.enqueue(cat)
cat = Cat(name: "Cat - 2")
animalshelter.enqueue(cat)

animalshelter.dequeueDog()
animalshelter.dequeueCat()
animalshelter.dequeueAny()
