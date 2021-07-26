//
//  main.swift
//  5l_LomtevAA
//
//  Created by Александр Ломтев on 26.07.2021.
//

import Foundation

/**
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.

 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

 5. Создать несколько объектов каждого класса. Применить к ним различные действия.

 6. Вывести сами объекты в консоль.
 */
enum Engine_state {
    case Run
    case Stop
}
enum Windows_state {
    case Open
    case Close
}
enum nitro {
    case nitroOn
    case nitroOff
}
enum luggage {
    case trunkIsFull
    case TrunkIsEmpty
}
protocol Car {
    var mark_car: String {get}
    var year: Int {get}
    var engine_state: Engine_state {get set}
    var windows_state: Windows_state {get set}
}
extension Car {
    mutating func changeEngineState(engineState: Engine_state){
        self.engine_state = engineState
    }
    mutating func chageWindowsState(windowsState: Windows_state){
        self.windows_state = windowsState
    }
}
class basicCar: Car{
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
                        print("В \(mark_car) \(model_car) Добавлен груз, объёмом \(volume)")
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
}
class sportCar: basicCar, CustomStringConvertible{
    var nitroState: nitro = .nitroOff
    var description: String{
        return "engine is \(engine_state), windows is \(windows_state), nitro is \(nitroState), release date is \(year)"
    }
}
class trunkCar: basicCar, CustomStringConvertible{
    var trunkState: luggage = .TrunkIsEmpty
    var description: String{
        return "двигатель \(engine_state), окна \(windows_state), trunk is \(trunkState), год выпуска \(year)"
    }
}
var porsche = sportCar(mark: "Porsche", model: "911", year: 2009, volume_of_bag: 500)
var kamaz = trunkCar(mark: "Камаз", model: "118", year: 2000, volume_of_bag: 20000)
porsche.changeEngineState(engineState: .Run)
porsche.nitroState = .nitroOn
kamaz.chageWindowsState(windowsState: .Open)
kamaz.trunkState = .trunkIsFull
kamaz.Add_to_bag(volume: 1200)
print(porsche.description)
print(kamaz.description)
