import Foundation
//Решить квадратное уравнение. ax^2 + bx + c = 0
//Обьявляем переменные
let a: Double = 2.0
let b: Double = 10.0
let c: Double = 2.0
// Вычисление дискриминанта D = b^2 − 4*a*c.
var d = b*b - (4 * a * c)
print("Дискриминант равен \(d)")
//если D < 0, корней нет;
//если D = 0, есть один корень;
//если D > 0, есть два различных корня.
var x1: Double?
var x2: Double?
var x3: Double
if d < 0 {
    print("Уравнение не имеет корней в поле действительных чисел")
}
else if d > 0 {
    print("Уравнение имеет два различных корня")
    x1 = (-b+sqrt(d))/(2*a)
    x2 = (-b-sqrt(d))/(2*a)
    print("X1 равен \(x1!)")
    print("X2 равен \(x2!)")
    
}
else{
    print("Есть один корень")
    x1 = (-b/(2*a))
    print("X1 равен \(x1!)")
    print("X2 равен \(x1!)")
}
//Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника
print("Введите катет a: ")
var cat_a = readLine();
print("Введите катет b: ")
var cat_b = readLine();
var gip: Double = 0.0

gip = sqrt(pow(Double(cat_a!)!, 2) + pow(Double(cat_b!)!, 2))
let perimetr: Double = gip + Double(cat_a!)! + Double(cat_b!)!
print("Катет прямоугольного треугольника равен: \(gip)")
print("Периметр прямоугольного треугольника равен: \(perimetr)")

//Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет
print("Введите сумму первоначально депозита: ")
let first_deposit = readLine()
print("Введите годовой процент по вкладу: ")
let procent = readLine()
let srok_vklada: Double = 365 * 5
var final_deposit: Double = Double(first_deposit!)! * (1 + srok_vklada * ((Double(procent!)!)/(100*365)))
print("К выплате с учетом начисленных процентов \(round((final_deposit-Double(first_deposit!)!)*100)/100) рублей подлежит: ")
print("\(round(final_deposit*100)/100) рублей")
