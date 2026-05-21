while True:
    n = int(input('''please select the operation
          1.addition
          2.substaction
          3.multiplication
          4.dividition
          5.exit\n'''))
    if n == 1:
        numbers = list(map(float, input('enter numbers which you want to add seperated by space').split()))
        total = 0
        for i in range(len(numbers)):
            total += numbers[i]
        print(total)
    elif n==2:
        numbers = list(map(float, input('enter numbers which you want to substract seperated by space').split()))
        sub = numbers[0]
        for i in numbers[1:]:
            sub -= i
        print(sub)
    elif n==3:
        numbers = list(map(float, input('enter numbers which you want to mul seperated by space').split()))
        mul = 1
        for i in range(len(numbers)):
            mul *= numbers[i]
        print(mul)
    elif n==4:
        num1 = float(input("enter numerator: "))
        num2 = float(input("enter denominator(>0): "))
        if num2 ==0:
            print("can't divide number by 0")   
        else:
            print(num1/num2)
    elif n == 5:
        break
    else:
        print('please enter a valid number between (1-5): ')
       
        