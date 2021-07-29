//
//  main.swift
//  6l_LomtevAA
//
//  Created by Александр Ломтев on 29.07.2021.
//

import Foundation

/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)

 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
 */

import Foundation




struct Journal {

    var name: String

    var mark: Int

}




extension Journal: CustomStringConvertible {

    var description : String {

        return "Имя: \(name), Оценка: \(mark)"

    }

}







struct queue <T> {

    private var elements: [T] = []

    

    public var isEmpty: Bool {

        return elements.count == 0

    }

    

    mutating func enqueue(element: T) {

        elements.append(element)

    }

    mutating func dequeue()->T {

        return elements.removeLast()

    }

    

    public var head: T? {

        if isEmpty {

            print("Элементы массива не найдены. Он пуст.")

            return nil

        } else {

            print("Последний элемент \(elements.last!)")

            return elements.last

        }

    }

    

    public var front: T? {

        if isEmpty {

            print("Элементы массива не найдены. Он пуст.")

            return nil

        } else {

            print("Первый элемент массива \(elements.first!)")

            return elements.first

        }

    }

    

    func printMyQueue() {

        print(elements)

    }

}




extension queue {

    func myFilter(predicate:(T) -> Bool) -> [T] {

        var result = [T]()

        for i in elements {

            if predicate(i) {

                result.append(i)

            }

        }

        return result

    }

}




var pupil = queue<Journal>()

print(pupil.head)

pupil.front

pupil.enqueue(element: .init(name: "Алиса", mark: 5))

pupil.enqueue(element: .init(name: "Иван", mark: 4))

pupil.enqueue(element: .init(name: "Софья", mark: 5))

pupil.enqueue(element: .init(name: "Андрей", mark: 3))

pupil.enqueue(element: .init(name: "Николай", mark: 5))

pupil.enqueue(element: .init(name: "Тимофей", mark: 3))

pupil.enqueue(element: .init(name: "Эржена", mark: 4))

pupil.enqueue(element: .init(name: "Алефтина", mark: 3))




pupil.printMyQueue()

pupil.head

pupil.front




let honoursPupil = pupil.myFilter(predicate: {$0.mark == 5})

print(honoursPupil)
