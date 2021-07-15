//
//  main.swift
//  3l_LomtevAA
//
//  Created by Александр Ломтев on 13.07.2021.
//

import Foundation

/*1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
 */
struct SportCar {
    var mark: String
    var year: Int
    var volume_of_bag: Double
    enum Engine_state {
        case Run
        case Stop
    }
    var engine_state: Engine_state{
        willSet{
            if newValue == .Run {
                print("Двигатель запущен")
            }
            else {
                print("Двигатель остановлен")
            }
        }
    }
    init(mark: String, year: Int, volume_of_bag: Double, engine_state: Engine_state){
        self.mark = mark
        self.year = year
        self.volume_of_bag = volume_of_bag
        self.engine_state = engine_state
    }
    
    
}

struct TrunkCar {
    
    
    
}
var porche = SportCar(mark: "911", year: 1991, volume_of_bag: 23.12, engine_state: .Run)
porche.engine_state = .Run
porche.engine_state = .Stop
