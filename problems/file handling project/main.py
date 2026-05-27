from pathlib import Path #helps to take paths
import os #help to intract with os
import shutil  #help to delete the folders which are not empty

def create_folder():
    try:
        name = input('please tell your folder name:- ') #take folder name
        p = Path(name) #create currect path with folder name 
        p.mkdir()  #make path folder
        print(f'{name} folder created successfully')
    except Exception as err:
        print(f'sorry an error occured as {err}')

def read_file_folder():
    p = Path("") #"" empty string means current directory path, which means we can access present directory
    # we can give any path if we required to give
    items = list(p.rglob('*')) #rglob (recursive lob), which used to iterate all the folders and files in given path (here current directory)
    for i, v in enumerate(items):  #enumerate seperate two things (like in a list we get index for one and values for another)
        print(f'{i+1}:{v}')

def update_folder():   #update simply means changing the name of folder 
    try:
        read_file_folder() #to change the name of folder first we need to show available folders
        old_name = input('please tell which folder you want to update: ')
        p = Path(old_name)
        
        if p.exists() and p.is_dir:
            new_name = input('please enter your new name: ')
            new_p = Path(new_name) 
            p.rename(new_p)
            print('you folder name is updated')
        else:
            print('sorry no such folder exists')
    except Exception as err:
        print(f'an error occued as {err}')

def delete_folder():
    try:
        read_file_folder()
        name = input("please tell which folder you want to delete: ")
        p = Path(name)
        if p.exists() and p.is_dir:
            shutil.rmtree(p)
            print('folder deleted successfully')
        else:
            print('no such folder exists')
    except Exception as err:
        print(f'an error occured as {err}')

def create_file():
    try:
        read_file_folder()
        name = input("enter name of file: ")
        p = Path(name)
        if not p.exists():
            with open(name, 'w') as fs:
                data = input('write what you want to write in file: ')
                fs.write(data)
                print('file created successfully')
        else:
            print('sorry this file already exists')
       
    except Exception as err:
        print(f'error occured as {err}') 

def read_file():
    try:
        read_file_folder()
        name = input("enter the file name you want to read: ")
        p = Path(name)
        if p.exists() and p.is_file():
            with open(name, 'r') as fs:
                content = fs.read()
                print(f'file content is {content}')
        else:
            print('sorry no file exists')
    except Exception as err:
        print(f'error occured as {err}')


def update_file():
    try:
        read_file_folder()
        name = input('enter file name which you want to update: ')
        p = Path(name)
        
        if p.exists() and p.is_file():
            print('''options
                  1.for renaming file
                  2.appending something in file
                  3.for overwriting the file content''')
            choice = int(input("enter your choice: "))
            
            if choice == 1:
                new_name = input('tell your file name with extension: ')
                new_p = Path(new_name)
                if not new_p.exists():
                    p.rename(new_p)
                else:
                    print('sorry this name already exists')
            if choice == 2:
                with open(name,'a') as fs:
                    data = input("enter data which you want to add: ")
                    fs.write(" ",data)
                print('data appended successfully')
                
            elif choice == 3:
                with open(name, 'w') as fs:
                    data = input('enter new data which u want to overwrite: ')
                    fs.write(data)
                print('data changed')               
        else:
            print('sorry file not found')
    except Exception as err:
        print(f'error occured as {err}')

def delete_file():
    try:
        read_file_folder()
        name = input('enter file name with extention which you want to delete: ')
        p = Path(name)
        
        if p.exists() and p.is_file():
            p.unlink() #to unlink the path
            print('file deleted successfully')
        else:
            print('file not found')
    except Exception as err:
        print(f'error occured as {err}')
    
while True:    
    print('''Options:- 
        1.create a folder
        2.read files and folders
        3.update the folder
        4.delete the folder
        5.create a file
        6.read a file
        7.update a file
        8.delete a file
        0.Exit''')

    choice = int(input('please choose your option: '))


    if choice == 1:
        create_folder()

    elif choice == 2:
        read_file_folder()

    elif choice ==3:
        update_folder()    
    elif choice == 4:
        delete_folder()
        
    elif choice == 5:
        create_file()
        
    elif choice == 6:
        read_file()

    elif choice == 7:
        update_file()
    elif choice ==8:
        delete_file()
    elif choice == 0:
        exit()
        
    else:
        print('enter valid choice between 1-8: ')