//
//  main.swift
//  2l_LomtevAA
//
//  Created by Александр Ломтев on 07.07.2021.
//

import Foundation

//1. Написать функцию, которая определяет, четное число или нет.

func is_even(target: Double) -> Bool {
    let even = target.truncatingRemainder(dividingBy: 2) == 0 ? true : false
    return even
}

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func div_on_three(target: Double) -> Bool {
    let without_a_remainder = target.truncatingRemainder(dividingBy: 3) == 0 ? true : false
    return without_a_remainder
}

//3. Создать возрастающий массив из 100 чисел.

var mas: Array<Int> = []
for  i in 0 ..< 100 {
    mas.append(i)
}
print(mas)
//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for element in mas {
    if is_even(target: Double(element)) || div_on_three(target: Double(element)) {
        let index = mas.firstIndex(of: element)
        mas.remove(at: index!)
    }
}
print(mas)

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.

func append_fibanachi_in_array(array: inout [Int], count: Int) {
    for _ in 0 ..< count {
    array.append((array[array.count-2]) + (array[array.count-3]))
    }
}

append_fibanachi_in_array(array: &mas, count: 50)
print(mas)
