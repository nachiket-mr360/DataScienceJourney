import random #this help us to generated random numbers

num = random.randint(1,100) #generate random number between 1 to 100
tries = 0 #to get count of tries

while True:
    tries +=1
    guessed = int(input("guess the number: "))
    if guessed == num :
        print(f"congratulations you found the number with {tries} tries")
        break
    elif guessed > num:
        print('your guess is higher the actual number guess again with lower number')
    elif guessed < num:
        print('your guessed number is lower then actual guess again with higher value')
