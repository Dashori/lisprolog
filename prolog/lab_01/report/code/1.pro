DOMAINS   
  surname = string
  phone = string   
  city, street = string   
  house, flat = integer      
  address = addr(city, street, house, flat)  
   
  mark = string   
  color = string   
  price = integer
  numbercar = string   
    
PREDICATES   
  person(surname, phone, address)   
  car(surname, mark, color, price, numbercar)
  man_car(mark, color, surname, city, phone)   
  
CLAUSES   
  person("Chepigo", "+77777777777", addr("Moscow",
  "Lenina", 2, 2)).
  person("Shabanova", "+70000000000", addr("Moscow",
  "Andronievskaya", 6, 15)). 
  person("Egorova", "+71112223333", addr("Chelyabinsk",
   "Pobedy", 3, 41)).   
  person("Sapojkov", "+76666633333", addr("Voronezh",
   "Voronezhskaya", 4, 9)).   
  person("Frolova", "+73245234923", addr("Snezhinsk",
   "Revolutrsii", 54, 62)).   
  person("Romanov", "+78134913573", addr("Moscow",
   "Kalyannaya", 1, 1)).   
  
  car("Chepigo", "bmw", "black", 300000, "M704XC790"). 
  car("Shabanova", "cherry", "white", 200000, "H982FN846").   
  car("Egorova", "mercedes", "grey", 250000, "P777AA774").   
  car("Sapojkov", "audi", "red", 230000, "S042GB562").   
  car("Frolova", "ferrari", "white", 400000, "F001VS148").     
  car("Romanov", "bmw", "black", 300000, "M704XC790").
  
  man_car(Mark, Color, Surname, City, Phone) :-       
    car(Surname, Mark, Color, _, _),       
    person(Surname, Phone, addr(City, _, _, _)).  
    
GOAL         
  %2 результата
  %man_car("bmw", Color, Surname, City, Phone).    
  %3 результата
  %person(Surname, Phone, addr("Moscow", Street, House, Flat)). 
  %2 результата
  car(Surname, Mark, "white", Price, Numbercar).
