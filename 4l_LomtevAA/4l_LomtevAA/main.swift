//
//  main.swift
//  4l_LomtevAA
//
//  Created by Александр Ломтев on 21.07.2021.
//

import Foundation

/*
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.

 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

 5. Создать несколько объектов каждого класса. Применить к ним различные действия.

 6. Вывести значения свойств экземпляров в консоль.
 */
enum Engine_state {
    case Run
    case Stop
}
enum Windows_state {
    case Open
    case Close
}
class Car {
    var filled_volume_of_bag: Double = 0
    var year: Int
    var volume_of_bag: Double
    var mark_car: String
    var model_car: String
    init(mark: String, model: String, year: Int, volume_of_bag: Double) {
        self.year = year
        self.volume_of_bag = volume_of_bag
        self.model_car = model
        self.mark_car = mark
    }
    var engine_state: Engine_state = .Stop{
            willSet{
                if newValue == .Run {
                    print("Двигатель автомобиля \(mark_car) \(model_car) запущен")
                }
                else {
                    print("Двигатель автомобиля \(mark_car) \(model_car) остановлен")
                }
            }
        
        }
    var windows_state: Windows_state = .Close{
            willSet{
                if newValue == .Open {
                    print("Окна автомобиля \(mark_car) \(model_car) открыты")
                }
                else {
                    print("Окна автомобиля \(mark_car) \(model_car) закрыты")
                }
            }
        }
    func Add_to_bag(volume: Double){
                if filled_volume_of_bag + volume <= volume_of_bag {
                    filled_volume_of_bag += volume
                    print("Добавлен груз, объёмом \(volume)")
                }
                else{
                    print("Объект с объёмом \(volume),  превышает свободный объем равный \(volume_of_bag - filled_volume_of_bag)")
                }
            }
            
    func Remove_from_bag(volume: Double){
                if filled_volume_of_bag - volume >= 0 {
                    filled_volume_of_bag -= volume
                    print("Произведена разгрузка груза, объемом \(volume)")
                }
                else{
                    print("Объём груза \(volume),  превышает заполненный объем равный \(filled_volume_of_bag)")
                }
            }
    func get_parameters()
    {
        print("Марка автомобиля: \(mark_car)\nМодель: \(model_car)")
    }
}

class trunkCar: Car {
    private let type_car: String = "грузовой"
    override func get_parameters()
    {
        print("Тип автомобиля: \(type_car)\nМарка автомобиля: \(mark_car)\nМодель: \(model_car)\nГод выпуска \(year)\nДвигатель \(engine_state)\nОкна: \(windows_state)\nОбъем кузова \(volume_of_bag)\nЗаполненный объем кузова \(filled_volume_of_bag)")
    }
}

class sportCar: Car {
    private let type_car: String = "спортивный"
    override func get_parameters()
    {
        print("Тип автомобиля: \(type_car)\nМарка автомобиля: \(mark_car)\nМодель: \(model_car)\nГод выпуска \(year)\nДвигатель \(engine_state)\nОкна: \(windows_state)\nОбъем багажника \(volume_of_bag)\nЗаполненный объем багажника \(filled_volume_of_bag)")
    }
    
}



var auto1 = trunkCar(mark: "Kamaz", model: "m 118", year: 2009, volume_of_bag: 1200.0)
auto1.get_parameters()
auto1.engine_state = .Run
auto1.Add_to_bag(volume: 5000)
auto1.Remove_from_bag(volume: 100)
auto1.windows_state = .Open
auto1.Add_to_bag(volume: 120)
auto1.get_parameters()

print("------------------------------------------------------")

var auto2 = sportCar(mark: "Posche", model: "911", year: 2015, volume_of_bag: 120.0)
auto2.get_parameters()
auto2.engine_state = .Run
auto2.Add_to_bag(volume: 500)
auto2.Remove_from_bag(volume: 100)
auto2.windows_state = .Open
auto2.Add_to_bag(volume: 120)
auto2.get_parameters()
