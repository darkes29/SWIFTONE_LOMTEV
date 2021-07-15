//
//  main.swift
//  3l_LomtevAA
//
//  Created by Александр Ломтев on 13.07.2021.
//
import Foundation

/*1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
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


struct SportCar {
    var mark: String
    var filled_volume_of_bag: Double = 0
    var year: Int
    var volume_of_bag: Double
    var engine_state: Engine_state{
        willSet{
            if newValue == .Run {
                print("Двигатель автомобиля \(mark) запущен")
            }
            else {
                print("Двигатель автомобиля \(mark) остановлен")
            }
        }
    }
    var windows_state: Windows_state{
        willSet{
            if newValue == .Open {
                print("Окна автомобиля \(mark) открыты")
            }
            else {
                print("Окна автомобиля \(mark) закрыты")
            }
        }
    }
    
    mutating func Add_to_bag(volume: Double){
        if filled_volume_of_bag + volume <= volume_of_bag {
            filled_volume_of_bag += volume
            print("Добавлен груз, объёмом \(volume)")
        }
        else{
            print("Объект с объёмом \(volume),  превышает свободный объем багажника, равный \(volume_of_bag - filled_volume_of_bag)")
        }
    }
    
    mutating func Remove_from_bag(volume: Double){
        if filled_volume_of_bag - volume >= 0 {
            filled_volume_of_bag -= volume
            print("Произведена разгрузка груза, объемом \(volume)")
        }
        else{
            print("Объём багажа \(volume),  превышает заполненный объем багажника, равный \(filled_volume_of_bag)")
        }
    }
    
    init(mark: String, year: Int, volume_of_bag: Double, engine_state: Engine_state, windows_state: Windows_state){
        self.mark = mark
        self.year = year
        self.volume_of_bag = volume_of_bag
        self.engine_state = engine_state
        self.windows_state = windows_state
    }
    
    
}

struct TrunkCar {
        var mark: String
        var filled_volume_of_bag: Double = 0
        var year: Int
        var volume_of_bag: Double
        var engine_state: Engine_state{
            willSet{
                if newValue == .Run {
                    print("Двигатель \(mark) запущен")
                }
                else {
                    print("Двигатель \(mark) остановлен")
                }
            }
        }
        var windows_state: Windows_state{
            willSet{
                if newValue == .Open {
                    print("Окна \(mark) открыты")
                }
                else {
                    print("Окна \(mark) закрыты")
                }
            }
        }
        
        mutating func Add_to_bag(volume: Double){
            if filled_volume_of_bag + volume <= volume_of_bag {
                filled_volume_of_bag += volume
                print("Добавлен груз, объёмом \(volume)")
            }
            else{
                print("Объект с объёмом \(volume),  превышает свободный объем равный \(volume_of_bag - filled_volume_of_bag)")
            }
        }
        
        mutating func Remove_from_bag(volume: Double){
            if filled_volume_of_bag - volume >= 0 {
                filled_volume_of_bag -= volume
                print("Произведена разгрузка груза, объемом \(volume)")
            }
            else{
                print("Объём груза \(volume),  превышает заполненный объем равный \(filled_volume_of_bag)")
            }
        }
        
        init(mark: String, year: Int, volume_of_bag: Double, engine_state: Engine_state, windows_state: Windows_state){
            self.mark = mark
            self.year = year
            self.volume_of_bag = volume_of_bag
            self.engine_state = engine_state
            self.windows_state = windows_state
        }
        
        
    }


var porsche = SportCar(mark: "911", year: 1991, volume_of_bag: 500.0, engine_state: .Stop, windows_state: .Close)


var kamaz = TrunkCar(mark: "118", year: 1997, volume_of_bag: 10000.0, engine_state: .Stop, windows_state: .Close)


porsche.engine_state = .Run
porsche.engine_state = .Stop
porsche.windows_state = .Open
porsche.Add_to_bag(volume: 50)
print("Объем груза \(porsche.filled_volume_of_bag)")

porsche.Remove_from_bag(volume: 30)
print("Объем груза \(porsche.filled_volume_of_bag)")



kamaz.engine_state = .Run
kamaz.engine_state = .Stop
kamaz.windows_state = .Open
kamaz.Add_to_bag(volume: 5000)
kamaz.Add_to_bag(volume: 50)
kamaz.Remove_from_bag(volume: 100)
print("Объем груза \(kamaz.filled_volume_of_bag)")
kamaz.Remove_from_bag(volume: 5000)
print("Объем груза \(kamaz.filled_volume_of_bag)")
kamaz.Add_to_bag(volume: 12000)
print("Объем груза \(kamaz.filled_volume_of_bag)")
kamaz.Remove_from_bag(volume: 5000)
print("Объем груза \(kamaz.filled_volume_of_bag)")
