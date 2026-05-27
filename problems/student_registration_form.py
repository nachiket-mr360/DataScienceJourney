#make a student regestration system ask for name, age, number and blood group
#and regester 3 student

class Regestration:
    
    def __init__(self, name, age, number, blood_group):
        self.name = name
        self.age = age
        self.number = number
        self.blood_group = blood_group
        
            
    def info(self):
        print(f'''given details are :
              name :{self.name}
              age: {self.age}
              number : {self.number}
              blood group : {self.blood_group}''')
        

student1 = Regestration('nachiket',21,821720000,'b+')
student2 = Regestration('aksh',21,3848384343,'0-')
student3 = Regestration('xyz',23,8484394839485,'a+')

print(student1.info(),student2.info(),student3.info())