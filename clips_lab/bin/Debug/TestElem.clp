(deftemplate Elem
        (multislot Name)
)

(defrule noComb 
        (declare (salience 1))
        ?fc <- (thatall)
        => 
        (assert(appendmessage "Комбинаций больше нет! Добавьте что-нибудь еще!"))
        (retract ?fc)
)

(defrule showFactsText
        (declare (salience 31))
        (элементы)
        =>
        (assert(appendmessage "На данный момент были получены: "))
)

(defrule showFacts
        (declare (salience 30))
        (элементы) (Elem (Name ?fc))
        =>
        (assert(appendmessage ?fc))
)

(defrule removeShowFacts
        (declare (salience 29))
        ?fc <- (элементы)
        =>
        (retract ?fc)
)

(defrule Rule1 (declare (salience 20)) (Elem (Name Земля)) (Elem (Name Воздух)) 
=> 
(assert(appendmessage "Соединяем: Земля + Воздух Cоздан новый элемент: Пыль" ))
(assert (Elem (Name Пыль))))

(defrule Rule2 (declare (salience 20)) (Elem (Name Воздух)) (Elem (Name Огонь)) 
=> 

(assert(appendmessage "Соединяем: Воздух + Огонь Cоздан новый элемент: Энергия" ))
(assert (Elem (Name Энергия))))



(defrule Rule3 (declare (salience 20)) (Elem (Name Земля)) (Elem (Name Огонь)) 
=> 
(assert(appendmessage "Соединяем: Земля + Огонь  Cоздан новый элемент: Лава" ))
(assert (Elem (Name Лава))))

(defrule Rule4 (declare (salience 20)) (Elem (Name Вода)) (Elem (Name Земля)) 
=> 
(assert(appendmessage "Соединяем: Вода + Земля  Cоздан новый элемент: Грязь" ))
(assert (Elem (Name Грязь))))

(defrule Rule5 (declare (salience 20)) (Elem (Name Земля)) (Elem (Name Земля)) 
=> 
(assert(appendmessage "Соединяем: Земля + Земля  Cоздан новый элемент: Давление" ))
(assert (Elem (Name Давление))))

(defrule Rule6 (declare (salience 20)) (Elem (Name Вода)) (Elem (Name Воздух)) 
=> 
(assert(appendmessage "Соединяем: Вода + Воздух Cоздан новый элемент: Дождь" ))
(assert (Elem (Name Дождь))))

(defrule Rule7 (declare (salience 20)) (Elem (Name Вода)) (Elem (Name Вода)) 
=> 
(assert(appendmessage "Соединяем: Вода + Вода Cоздан новый элемент: Море" ))
(assert (Elem (Name Море))))

(defrule Rule8 (declare (salience 20)) (Elem (Name Вода)) (Elem (Name Огонь)) 
=> 
(assert(appendmessage "Соединяем: Вода + Огонь Cоздан новый элемент: Пар" ))
(assert (Elem (Name Пар))))

(defrule Rule9 (declare (salience 20)) (Elem (Name Вода)) (Elem (Name Энергия)) 
=> 
(assert(appendmessage "Соединяем: Вода + Энергия Cоздан новый элемент: Энергия" ))
(assert (Elem (Name Пар))))


(defrule Rule10 (declare (salience 20)) (Elem (Name Воздух)) (Elem (Name Давление)) 
=> 
(assert(appendmessage "Соединяем: Воздух + Давление Cоздан новый элемент: Давление" ))
(assert (Elem (Name Давление))))

(defrule Rule11 (declare (salience 20)) (Elem (Name Грязь)) (Elem (Name Огонь)) 
=> 
(assert(appendmessage "Соединяем: Грязь + Огонь Cоздан новый элемент: Кирпич" ))
(assert (Elem (Name Кирпич))))

(defrule Rule11 (declare (salience 20)) (Elem (Name Воздух)) (Elem (Name Пар)) 
=> 
(assert(appendmessage "Соединяем: Воздух + Пар Cоздан новый элемент: Облако" ))
(assert (Elem (Name Облако))))

(defrule Rule12 (declare (salience 20)) (Elem (Name Земля)) (Elem (Name Энергия)) 
=> 
(assert(appendmessage "Соединяем: Земля + Энергия Cоздан новый элемент: Землетрясение" ))
(assert (Elem (Name Землетрясение))))


(defrule Rule13 (declare (salience 20)) (Elem (Name Дождь)) (Elem (Name Дождь)) 
=> 
(assert(appendmessage "Соединяем: Дождь + Дождь Cоздан новый элемент: Наводнение" ))
(assert (Elem (Name Наводнение))))

(defrule Rule14 (declare (salience 20)) (Elem (Name Пар)) (Elem (Name Земля)) 
=> 
(assert(appendmessage "Соединяем: Пар + Земля Cоздан новый элемент: Гейзер" ))
(assert (Elem (Name Гейзер))))


(defrule Rule15 (declare (salience 20)) (Elem (Name Лава)) (Elem (Name Давление)) 
=> 
(assert(appendmessage "Соединяем: Лава + Давление Cоздан новый элемент: Гранит" ))
(assert (Elem (Name Гранит))))


(defrule Rule16 (declare (salience 20)) (Elem (Name Огонь)) (Elem (Name Пыль)) 
=> 
(assert(appendmessage "Соединяем: Огонь + Пыль Cоздан новый элемент: Порох" ))
(assert (Elem (Name Порох))))

(defrule Rule17 (declare (salience 20)) (Elem (Name Лава)) (Elem (Name Вода)) 
=> 
(assert(appendmessage "Соединяем: Лава + Вода Cоздан новый элемент: Обсидиан" ))
(assert (Elem (Name Обсидиан))))

(defrule Rule18 (declare (salience 20)) (Elem (Name Вода)) (Elem (Name Море)) 
=> 
(assert(appendmessage "Соединяем: Вода + Море Cоздан новый элемент: Океан" ))
(assert (Elem (Name Океан))))

(defrule Rule19 (declare (salience 20)) (Elem (Name Море)) (Elem (Name Море)) 
=> 
(assert(appendmessage "Соединяем: Море + Море Cоздан новый элемент: Океан" ))
(assert (Elem (Name Океан))))

(defrule Rule20 (declare (salience 20)) (Elem (Name Земля)) (Elem (Name Дождь)) 
=> 
(assert(appendmessage "Соединяем: Земля + Дождь Cоздан новый элемент: Растение" ))
(assert (Elem (Name Растение))))


(defrule Rule21 (declare (salience 20)) (Elem (Name Море)) (Elem (Name Огонь)) 
=> 
(assert(appendmessage "Соединяем: Море + Огонь Cоздан новый элемент: Соль" ))
(assert (Elem (Name Соль))))


(defrule Rule22 (declare (salience 20)) (Elem (Name Океан)) (Elem (Name Огонь)) 
=> 
(assert(appendmessage "Соединяем: Океан + Огонь Cоздан новый элемент: Соль" ))
(assert (Elem (Name Соль))))


(defrule Rule23 (declare (salience 20)) (Elem (Name Воздух)) (Elem (Name Лава)) 
=> 
(assert(appendmessage "Соединяем: Воздух + Лава Cоздан новый элемент: Камень" ))
(assert (Elem (Name Камень))))


(defrule Rule24 (declare (salience 20)) (Elem (Name Лава)) (Elem (Name Земля)) 
=> 
(assert(appendmessage "Соединяем: Лава + Земля Cоздан новый элемент: Вулкан" ))
(assert (Elem (Name Вулкан))))


(defrule Rule25 (declare (salience 20)) (Elem (Name Воздух)) (Elem (Name Давление)) 
=> 
(assert(appendmessage "Соединяем: Воздух + Давление Cоздан новый элемент: Ветер" ))
(assert (Elem (Name Ветер))))

(defrule Rule26 (declare (salience 20)) (Elem (Name Воздух)) (Elem (Name Энергия)) 
=> 
(assert(appendmessage "Соединяем: Воздух + Энергия Cоздан новый элемент: Ветер" ))
(assert (Elem (Name Ветер))))

(defrule Rule27 (declare (salience 20)) (Elem (Name Вода)) (Elem (Name Растение)) 
=> 
(assert(appendmessage "Соединяем: Вода + Растение Cоздан новый элемент: Водоросли" ))
(assert (Elem (Name Водоросли))))

(defrule Rule28 (declare (salience 20)) (Elem (Name Море)) (Elem (Name Растение)) 
=> 
(assert(appendmessage "Соединяем: Море + Растение Cоздан новый элемент: Водоросли" ))
(assert (Elem (Name Водоросли))))

(defrule Rule29 (declare (salience 20)) (Elem (Name Океан)) (Elem (Name Растение)) 
=> 
(assert(appendmessage "Соединяем: Океан + Растение Cоздан новый элемент: Водоросли" ))
(assert (Elem (Name Водоросли))))

(defrule Rule30 (declare (salience 20)) (Elem (Name Вулкан)) (Elem (Name Энергия)) 
=> 
(assert(appendmessage "Соединяем: Вулкан + Энергия Cоздан новый элемент: Пепел" ))
(assert (Elem (Name Пепел))))

(defrule Rule31 (declare (salience 20)) (Elem (Name Давление)) (Elem (Name Растение)) 
=> 
(assert(appendmessage "Соединяем: Давление + Растение Cоздан новый элемент: Уголь" ))
(assert (Elem (Name Уголь))))

(defrule Rule32 (declare (salience 20)) (Elem (Name Растение)) (Elem (Name Облако)) 
=> 
(assert(appendmessage "Соединяем: Растение + Облако Cоздан новый элемент: Хлопок" ))
(assert (Elem (Name Хлопок))))

(defrule Rule33 (declare (salience 20)) (Elem (Name Вулкан)) (Elem (Name Энергия)) 
=> 
(assert(appendmessage "Соединяем: Вулкан + Энергия Cоздан новый элемент: Извержение" ))
(assert (Elem (Name Извержение))))

(defrule Rule34 (declare (salience 20)) (Elem (Name Порох)) (Elem (Name Огонь)) 
=> 
(assert(appendmessage "Соединяем: Порох + Огонь Cоздан новый элемент: Взрыв" ))
(assert (Elem (Name Взрыв))))


(defrule Rule35 (declare (salience 20)) (Elem (Name Земля)) (Elem (Name Облако)) 
=> 
(assert(appendmessage "Соединяем: Земля + Облако Cоздан новый элемент: Туман" ))
(assert (Elem (Name Туман))))


(defrule Rule36 (declare (salience 20)) (Elem (Name Растение)) (Elem (Name Растение)) 
=> 
(assert(appendmessage "Соединяем: Растение + Растение Cоздан новый элемент: Сад" ))
(assert (Elem (Name Сад))))


(defrule Rule37 (declare (salience 20)) (Elem (Name Растение)) (Elem (Name Растение)) 
=> 
(assert(appendmessage "Соединяем: Растение + Растение Cоздан новый элемент: Сад" ))
(assert (Elem (Name Сад))))


(defrule Rule38 (declare (salience 20)) (Elem (Name Растение)) (Elem (Name Земля)) 
=> 
(assert(appendmessage "Соединяем: Растение + Растение Cоздан новый элемент: Трава" ))
(assert (Elem (Name Трава))))

(defrule Rule39 (declare (salience 20)) (Elem (Name Ветер)) (Elem (Name Энергия)) 
=> 
(assert(appendmessage "Соединяем: Ветер + Энергия Cоздан новый элемент: Ураган" ))
(assert (Elem (Name Ураган))))

(defrule Rule40 (declare (salience 20)) (Elem (Name Море)) (Elem (Name Вулкан)) 
=> 
(assert(appendmessage "Соединяем: Море + Вулкан Cоздан новый элемент: Остров" ))
(assert (Elem (Name Остров))))

(defrule Rule41 (declare (salience 20)) (Elem (Name Океан)) (Elem (Name Вулкан)) 
=> 
(assert(appendmessage "Соединяем: Океан + Вулкан Cоздан новый элемент: Остров" ))
(assert (Elem (Name Остров))))

(defrule Rule42 (declare (salience 20)) (Elem (Name Огонь)) (Elem (Name Камень)) 
=> 
(assert(appendmessage "Соединяем: Огонь + Камень Cоздан новый элемент: Металлические" ))
(assert (Elem (Name Металлические))))


(defrule Rule43 (declare (salience 20)) (Elem (Name Камень)) (Elem (Name Растение)) 
=> 
(assert(appendmessage "Соединяем: Камень + Растение Cоздан новый элемент: Мосс" ))
(assert (Elem (Name Мосс))))

(defrule Rule44 (declare (salience 20)) (Elem (Name Камень)) (Elem (Name Водоросли)) 
=> 
(assert(appendmessage "Соединяем: Камень + Водоросли Cоздан новый элемент: Мосс" ))
(assert (Elem (Name Мосс))))

(defrule Rule45 (declare (salience 20)) (Elem (Name Землетрясение)) (Elem (Name Земля)) 
=> 
(assert(appendmessage "Соединяем: Землетрясение + Земля Cоздан новый элемент: Гора" ))
(assert (Elem (Name Гора))))

(defrule Rule46 (declare (salience 20)) (Elem (Name Камень)) (Elem (Name Воздух)) 
=> 
(assert(appendmessage "Соединяем: Камень + Воздух Cоздан новый элемент: Песок" ))
(assert (Elem (Name Песок))))

(defrule Rule47 (declare (salience 20)) (Elem (Name Камень)) (Elem (Name Ветер)) 
=> 
(assert(appendmessage "Соединяем: Камень + Ветер Cоздан новый элемент: Песок" ))
(assert (Elem (Name Мосс))))

(defrule Rule48 (declare (salience 20)) (Elem (Name Растение)) (Elem (Name Море)) 
=> 
(assert(appendmessage "Соединяем: Растение + Море Cоздан новый элемент: Водоросли" ))
(assert (Elem (Name Водоросли))))

(defrule Rule49 (declare (salience 20)) (Elem (Name Растение)) (Elem (Name Океан)) 
=> 
(assert(appendmessage "Соединяем: Растение + Океан Cоздан новый элемент: Водоросли" ))
(assert (Elem (Name Водоросли))))

(defrule Rule50 (declare (salience 20)) (Elem (Name Воздух)) (Elem (Name Облако)) 
=> 
(assert(appendmessage "Соединяем: Воздух + Облако Cоздан новый элемент: Небо" ))
(assert (Elem (Name Небо))))

(defrule Rule51 (declare (salience 20)) (Elem (Name Облако)) (Elem (Name Электричество)) 
=> 
(assert(appendmessage "Соединяем: Облако + Электричество Cоздан новый элемент: Шторм" ))
(assert (Elem (Name Шторм))))

(defrule Rule52 (declare (salience 20)) (Elem (Name Облако)) (Elem (Name Энергия)) 
=> 
(assert(appendmessage "Соединяем: Облако + Энергия Cоздан новый элемент: Шторм" ))
(assert (Elem (Name Шторм))))

(defrule Rule53 (declare (salience 20)) (Elem (Name Грязь)) (Elem (Name Растение)) 
=> 
(assert(appendmessage "Соединяем: Грязь + Растение Cоздан новый элемент: Болото" ))
(assert (Elem (Name Болото))))

(defrule Rule54 (declare (salience 20)) (Elem (Name Грязь)) (Elem (Name Трава)) 
=> 
(assert(appendmessage "Соединяем: Грязь + Трава Cоздан новый элемент: Болото" ))
(assert (Elem (Name Болото))))

(defrule Rule55 (declare (salience 20)) (Elem (Name Растение)) (Elem (Name Огонь)) 
=> 
(assert(appendmessage "Соединяем: Растение + Огонь Cоздан новый элемент: Табак" ))
(assert (Elem (Name Табак))))

(defrule Rule56 (declare (salience 20)) (Elem (Name Море)) (Elem (Name Землетрясение)) 
=> 
(assert(appendmessage "Соединяем: Море + Землетрясение Cоздан новый элемент: Цунами" ))
(assert (Elem (Name Цунами))))

(defrule Rule57 (declare (salience 20)) (Elem (Name Океан)) (Elem (Name Землетрясение)) 
=> 
(assert(appendmessage "Соединяем: Океан + Землетрясение Cоздан новый элемент: Цунами" ))
(assert (Elem (Name Цунами))))

(defrule Rule58 (declare (salience 20)) (Elem (Name Кирпич)) (Elem (Name Кирпич)) 
=> 
(assert(appendmessage "Соединяем: Кирпич + Кирпич Cоздан новый элемент: Стена" ))
(assert (Elem (Name Кирпич))))

(defrule Rule59 (declare (salience 20)) (Elem (Name Остров)) (Elem (Name Остров)) 
=> 
(assert(appendmessage "Соединяем: Остров + Остров Cоздан новый элемент: Архипелаг" ))
(assert (Elem (Name Архипелаг))))

(defrule Rule60 (declare (salience 20)) (Elem (Name Энергия)) (Elem (Name Взрыв)) 
=> 
(assert(appendmessage "Соединяем: Энергия + Взрыв Cоздан новый элемент: Атомная бомба" ))
(assert (Elem (Name Атомная бомба))))

(defrule Rule61 (declare (salience 20)) (Elem (Name Вода)) (Elem (Name Песок)) 
=> 
(assert(appendmessage "Соединяем: Вода + Песок Cоздан новый элемент: Пляж" ))
(assert (Elem (Name Пляж))))

(defrule Rule62 (declare (salience 20)) (Elem (Name Море)) (Elem (Name Песок)) 
=> 
(assert(appendmessage "Соединяем: Море + Песок Cоздан новый элемент: Пляж" ))
(assert (Elem (Name Пляж))))

(defrule Rule63 (declare (salience 20)) (Elem (Name Океан)) (Elem (Name Песок)) 
=> 
(assert(appendmessage "Соединяем: Океан + Песок Cоздан новый элемент: Пляж" ))
(assert (Elem (Name Пляж))))

(defrule Rule64 (declare (salience 20)) (Elem (Name Металлические)) (Elem (Name Камень)) 
=> 
(assert(appendmessage "Соединяем: Металлические + Камень Cоздан новый элемент: Лезвие" ))
(assert (Elem (Name Лезвие))))


(defrule Rule65 (declare (salience 20)) (Elem (Name Металлические)) (Elem (Name Камень)) 
=> 
(assert(appendmessage "Соединяем: Металлические + Камень Cоздан новый элемент: Лезвие" ))
(assert (Elem (Name Лезвие))))

(defrule Rule66 (declare (salience 20)) (Elem (Name Пар)) (Elem (Name Металлические)) 
=> 
(assert(appendmessage "Соединяем: Пар + Металлические Cоздан новый элемент: Котел" ))
(assert (Elem (Name Котел))))

(defrule Rule67 (declare (salience 20)) (Elem (Name Порох)) (Elem (Name Металлические)) 
=> 
(assert(appendmessage "Соединяем: Порох + Металлические Cоздан новый элемент: Пуля" ))
(assert (Elem (Name Пуля))))

(defrule Rule68 (declare (salience 20)) (Elem (Name Песок)) (Elem (Name Растение)) 
=> 
(assert(appendmessage "Соединяем: Песок + Растение Cоздан новый элемент: Кактус" ))
(assert (Elem (Name Кактус))))

(defrule Rule69 (declare (salience 20)) (Elem (Name Пустыня)) (Elem (Name Растение)) 
=> 
(assert(appendmessage "Соединяем: Пустыня + Растение Cоздан новый элемент: Кактус" ))
(assert (Elem (Name Кактус))))

(defrule Rule70 (declare (salience 20)) (Elem (Name Песок)) (Elem (Name Грязь)) 
=> 
(assert(appendmessage "Соединяем: Песок + Грязь Cоздан новый элемент: Глина" ))
(assert (Elem (Name Глина))))

(defrule Rule71 (declare (salience 20)) (Elem (Name Песок)) (Elem (Name Песок)) 
=> 
(assert(appendmessage "Соединяем: Песок + Песок Cоздан новый элемент: Пустыня" ))
(assert (Elem (Name Пустыня))))


(defrule Rule72 (declare (salience 20)) (Elem (Name Песок)) (Elem (Name Кактус)) 
=> 
(assert(appendmessage "Соединяем: Песок + Кактус Cоздан новый элемент: Пустыня" ))
(assert (Elem (Name Пустыня))))

(defrule Rule73 (declare (salience 20)) (Elem (Name Туман)) (Elem (Name Трава)) 
=> 
(assert(appendmessage "Соединяем: Туман + Трава Cоздан новый элемент: Роса" ))
(assert (Elem (Name Роса))))

(defrule Rule74 (declare (salience 20)) (Elem (Name Вода)) (Elem (Name Трава)) 
=> 
(assert(appendmessage "Соединяем: Вода + Трава Cоздан новый элемент: Роса" ))
(assert (Elem (Name Роса))))

(defrule Rule75 (declare (salience 20)) (Elem (Name Уголь)) (Elem (Name Давление)) 
=> 
(assert(appendmessage "Соединяем: Уголь + Давление Cоздан новый элемент: Алмаз" ))
(assert (Elem (Name Уголь))))

(defrule Rule76 (declare (salience 20)) (Elem (Name Песок)) (Elem (Name Ветер)) 
=> 
(assert(appendmessage "Соединяем: Песок + Ветер Cоздан новый элемент: Дюны" ))
(assert (Elem (Name Дюны))))

(defrule Rule77 (declare (salience 20)) (Elem (Name Пустыня)) (Elem (Name Ветер)) 
=> 
(assert(appendmessage "Соединяем: Пустыня + Ветер Cоздан новый элемент: Дюны" ))
(assert (Elem (Name Дюны))))

(defrule Rule78 (declare (salience 20)) (Elem (Name Металлические)) (Elem (Name Энергия)) 
=> 
(assert(appendmessage "Соединяем: Металлические + Энергия Cоздан новый элемент: Электричество" ))
(assert (Elem (Name Электричество))))

(defrule Rule79 (declare (salience 20)) (Elem (Name Взрыв)) (Elem (Name Небо)) 
=> 
(assert(appendmessage "Соединяем: Взрыв + Небо Cоздан новый элемент: Фейерверк" ))
(assert (Elem (Name Фейерверк))))

(defrule Rule80 (declare (salience 20)) (Elem (Name Растение)) (Elem (Name Сад)) 
=> 
(assert(appendmessage "Соединяем: Растение + Сад Cоздан новый элемент: Цветок" ))
(assert (Elem (Name Цветок))))

(defrule Rule81 (declare (salience 20)) (Elem (Name Огонь)) (Elem (Name Песок)) 
=> 
(assert(appendmessage "Соединяем: Огонь + Песок Cоздан новый элемент: Стекло" ))
(assert (Elem (Name Стекло))))


(defrule Rule82 (declare (salience 20)) (Elem (Name Песок)) (Elem (Name Электричество)) 
=> 
(assert(appendmessage "Соединяем: Песок + Электричество Cоздан новый элемент: Стекло" ))
(assert (Elem (Name Стекло))))

(defrule Rule83 (declare (salience 20)) (Elem (Name Взрыв)) (Elem (Name Металлические)) 
=> 
(assert(appendmessage "Соединяем: Взрыв + Металлические Cоздан новый элемент: Граната" ))
(assert (Elem (Name Граната))))

(defrule Rule84 (declare (salience 20)) (Elem (Name Земля)) (Elem (Name Небо)) 
=> 
(assert(appendmessage "Соединяем: Земля + Небо Cоздан новый элемент: Горизонт" ))
(assert (Elem (Name Горизонт))))

(defrule Rule85 (declare (salience 20)) (Elem (Name Море)) (Elem (Name Небо)) 
=> 
(assert(appendmessage "Соединяем: Море + Небо Cоздан новый элемент: Горизонт" ))
(assert (Elem (Name Горизонт))))

(defrule Rule86 (declare (salience 20)) (Elem (Name Стена)) (Elem (Name Стена)) 
=> 
(assert(appendmessage "Соединяем: Стена + Стена Cоздан новый элемент: Дом" ))
(assert (Elem (Name Дом))))


(defrule Rule87 (declare (salience 20)) (Elem (Name Растение)) (Elem (Name Стена)) 
=> 
(assert(appendmessage "Соединяем: Растение + Стена Cоздан новый элемент: Айви" ))
(assert (Elem (Name Айви))))

(defrule Rule88 (declare (salience 20)) (Elem (Name Болото)) (Elem (Name Энергия)) 
=> 
(assert(appendmessage "Соединяем: Болото + Энергия Cоздан новый элемент: Жизнь" ))
(assert (Elem (Name Жизнь))))

(defrule Rule89 (declare (salience 20)) (Elem (Name Небо)) (Elem (Name Камень)) 
=> 
(assert(appendmessage "Соединяем: Небо + Камень Cоздан новый элемент: Луна" ))
(assert (Elem (Name Луна))))


(defrule Rule90 (declare (salience 20)) (Elem (Name Гора)) (Elem (Name Гора)) 
=> 
(assert(appendmessage "Соединяем: Гора + Гора Cоздан новый элемент: Горный хребет" ))
(assert (Elem (Name Горный хребет))))

(defrule Rule91 (declare (salience 20)) (Elem (Name Вода)) (Elem (Name Сад)) 
=> 
(assert(appendmessage "Соединяем: Вода + Сад Cоздан новый элемент: Пруд" ))
(assert (Elem (Name Пруд))))

(defrule Rule92 (declare (salience 20)) (Elem (Name Песок)) (Elem (Name Болото)) 
=> 
(assert(appendmessage "Соединяем: Песок + Болото Cоздан новый элемент: Зыбучие пески" ))
(assert (Elem (Name Зыбучие пески))))

(defrule Rule93 (declare (salience 20)) (Elem (Name Гора)) (Elem (Name Вода)) 
=> 
(assert(appendmessage "Соединяем: Гора + Вода Cоздан новый элемент: Река" ))
(assert (Elem (Name Река))))

(defrule Rule94 (declare (salience 20)) (Elem (Name Гора)) (Elem (Name Дождь)) 
=> 
(assert(appendmessage "Соединяем: Гора + Дождь Cоздан новый элемент: Река" ))
(assert (Elem (Name Река))))

(defrule Rule95 (declare (salience 20)) (Elem (Name Воздух)) (Elem (Name Металлические)) 
=> 
(assert(appendmessage "Соединяем: Воздух + Металлические Cоздан новый элемент: Ржавчина" ))
(assert (Elem (Name Ржавчина))))


(defrule Rule96 (declare (salience 20)) (Elem (Name Камень)) (Elem (Name Песок)) 
=> 
(assert(appendmessage "Соединяем: Камень + Песок Cоздан новый элемент: Песчаник" ))
(assert (Elem (Name Песчаник))))

(defrule Rule97 (declare (salience 20)) (Elem (Name Песок)) (Elem (Name Энергия)) 
=> 
(assert(appendmessage "Соединяем: Песок + Энергия Cоздан новый элемент: Песчаная буря" ))
(assert (Elem (Name Песчаная буря))))

(defrule Rule98 (declare (salience 20)) (Elem (Name Воздух)) (Elem (Name Волна)) 
=> 
(assert(appendmessage "Соединяем: Воздух + Волна Cоздан новый элемент: Звук" ))
(assert (Elem (Name Звук))))

(defrule Rule99 (declare (salience 20)) (Elem (Name Металлические)) (Elem (Name Уголь)) 
=> 
(assert(appendmessage "Соединяем: Металлические + Уголь Cоздан новый элемент: Сталь" ))
(assert (Elem (Name Сталь))))

(defrule Rule100 (declare (salience 20)) (Elem (Name Огонь)) (Elem (Name Небо)) 
=> 
(assert(appendmessage "Соединяем: Огонь + Небо Cоздан новый элемент: Солнце" ))
(assert (Elem (Name Солнце))))

(defrule Rule101 (declare (salience 20)) (Elem (Name Вода)) (Elem (Name Стекло)) 
=> 
(assert(appendmessage "Соединяем: Вода + Стекло Cоздан новый элемент: Аквариум" ))
(assert (Elem (Name Аквариум))))

(defrule Rule102 (declare (salience 20)) (Elem (Name Болото)) (Elem (Name Жизнь)) 
=> 
(assert(appendmessage "Соединяем: Болото + Жизнь Cоздан новый элемент: Бактерии" ))
(assert (Elem (Name Бактерии))))

(defrule Rule103 (declare (salience 20)) (Elem (Name Жизнь)) (Elem (Name Небо)) 
=> 
(assert(appendmessage "Соединяем: Жизнь + Небо Cоздан новый элемент: Птица" ))
(assert (Elem (Name Птица))))

(defrule Rule104 (declare (salience 20)) (Elem (Name Стекло)) (Elem (Name Лезвие)) 
=> 
(assert(appendmessage "Соединяем: Стекло + Лезвие Cоздан новый элемент: Блендер" ))
(assert (Elem (Name Блендер))))

(defrule Rule105 (declare (salience 20)) (Elem (Name Река)) (Elem (Name Сталь)) 
=> 
(assert(appendmessage "Соединяем: Река + Сталь Cоздан новый элемент: Мост" ))
(assert (Elem (Name Мост))))

(defrule Rule106 (declare (salience 20)) (Elem (Name Стена)) (Elem (Name Река)) 
=> 
(assert(appendmessage "Соединяем: Стена + Река Cоздан новый элемент: Дам" ))
(assert (Elem (Name Дам))))


(defrule Rule107 (declare (salience 20)) (Elem (Name Небо)) (Elem (Name Солнце)) 
=> 
(assert(appendmessage "Соединяем: Небо + Солнце Cоздан новый элемент: День" ))
(assert (Elem (Name День))))


(defrule Rule108 (declare (salience 20)) (Elem (Name Солнце)) (Elem (Name Луна)) 
=> 
(assert(appendmessage "Соединяем: Солнце + Луна Cоздан новый элемент: Затмение" ))
(assert (Elem (Name Затмение))))

(defrule Rule109 (declare (salience 20)) (Elem (Name Жизнь)) (Elem (Name Камень)) 
=> 
(assert(appendmessage "Соединяем: Жизнь + Камень Cоздан новый элемент: Яйцо" ))
(assert (Elem (Name Яйцо))))

(defrule Rule110 (declare (salience 20)) (Elem (Name Стекло)) (Elem (Name Металлические)) 
=> 
(assert(appendmessage "Соединяем: Стекло + Металлические Cоздан новый элемент: Очки" ))
(assert (Elem (Name Очки))))

(defrule Rule111 (declare (salience 20)) (Elem (Name Металлические)) (Elem (Name Солнце)) 
=> 
(assert(appendmessage "Соединяем: Металлические + Солнце Cоздан новый элемент: Золото" ))
(assert (Elem (Name Золото))))



(defrule Rule112 (declare (salience 20)) (Elem (Name Глина)) (Elem (Name Жизнь)) 
=> 
(assert(appendmessage "Соединяем: Глина + Жизнь Cоздан новый элемент: Жизнь" ))
(assert (Elem (Name Жизнь))))

(defrule Rule113 (declare (salience 20)) (Elem (Name Растение)) (Elem (Name Стекло)) 
=> 
(assert(appendmessage "Соединяем: Растение + Стекло Cоздан новый элемент: Теплица" ))
(assert (Elem (Name Теплица))))

(defrule Rule114 (declare (salience 20)) (Elem (Name Металлические)) (Elem (Name Пуля)) 
=> 
(assert(appendmessage "Соединяем: Металлические + Пуля Cоздан новый элемент: Пистолет" ))
(assert (Elem (Name Пистолет))))

(defrule Rule115 (declare (salience 20)) (Elem (Name Трава)) (Elem (Name Солнце)) 
=> 
(assert(appendmessage "Соединяем: Трава + Солнце Cоздан новый элемент: Хэй" ))
(assert (Elem (Name Хэй))))

(defrule Rule116 (declare (salience 20)) (Elem (Name Песок)) (Elem (Name Стекло)) 
=> 
(assert(appendmessage "Соединяем: Песок + Стекло Cоздан новый элемент: Песочные часы" ))
(assert (Elem (Name Песочные часы))))

(defrule Rule117 (declare (salience 20)) (Elem (Name Земля)) (Elem (Name Жизнь)) 
=> 
(assert(appendmessage "Соединяем: Земля + Жизнь Cоздан новый элемент: Человек" ))
(assert (Elem (Name Человек))))

(defrule Rule118 (declare (salience 20)) (Elem (Name Вода)) (Elem (Name Пруд)) 
=> 
(assert(appendmessage "Соединяем: Вода + Пруд Cоздан новый элемент: Озеро" ))
(assert (Elem (Name Озеро))))

(defrule Rule119 (declare (salience 20)) (Elem (Name Электричество)) (Elem (Name Стекло)) 
=> 
(assert(appendmessage "Соединяем: Электричество + Стекло Cоздан новый элемент: Лампочка" ))
(assert (Elem (Name Лампочка))))

(defrule Rule120 (declare (salience 20)) (Elem (Name Стекло)) (Elem (Name Металлические)) 
=> 
(assert(appendmessage "Соединяем: Стекло + Металлические Cоздан новый элемент: Зеркало" ))
(assert (Elem (Name Зеркало))))

(defrule Rule121 (declare (salience 20)) (Elem (Name Небо)) (Elem (Name Луна)) 
=> 
(assert(appendmessage "Соединяем: Небо + Луна Cоздан новый элемент: Ночь" ))
(assert (Elem (Name Ночь))))

(defrule Rule122 (declare (salience 20)) (Elem (Name Пустыня)) (Elem (Name Вода)) 
=> 
(assert(appendmessage "Соединяем: Пустыня + Вода Cоздан новый элемент: Оазис" ))
(assert (Elem (Name Оазис))))

(defrule Rule123 (declare (salience 20)) (Elem (Name Растение)) (Elem (Name Солнце)) 
=> 
(assert(appendmessage "Соединяем: Растение + Солнце Cоздан новый элемент: Кислород" ))
(assert (Elem (Name Кислород))))

(defrule Rule124 (declare (salience 20)) (Elem (Name Пар)) (Elem (Name Цветок)) 
=> 
(assert(appendmessage "Соединяем: Пар + Цветок Cоздан новый элемент: Духи" ))
(assert (Elem (Name Духи))))

(defrule Rule125 (declare (salience 20)) (Elem (Name Вода)) (Elem (Name Жизнь)) 
=> 
(assert(appendmessage "Соединяем: Вода + Жизнь Cоздан новый элемент: Планктон" ))
(assert (Elem (Name Планктон))))

(defrule Rule125 (declare (salience 20)) (Elem (Name Вода)) (Elem (Name Жизнь)) 
=> 
(assert(appendmessage "Соединяем: Вода + Жизнь Cоздан новый элемент: Планктон" ))
(assert (Elem (Name Планктон))))

(defrule Rule126 (declare (salience 20)) (Elem (Name Огонь)) (Elem (Name Глина)) 
=> 
(assert(appendmessage "Соединяем: Огонь + Глина Cоздан новый элемент: Керамика" ))
(assert (Elem (Name Керамика))))


(defrule Rule127 (declare (salience 20)) (Elem (Name Пустыня)) (Elem (Name Камень)) 
=> 
(assert(appendmessage "Соединяем: Пустыня + Камень Cоздан новый элемент: Пирамида" ))
(assert (Elem (Name Пирамида))))

(defrule Rule128 (declare (salience 20)) (Elem (Name Дождь)) (Elem (Name Солнце)) 
=> 
(assert(appendmessage "Соединяем: Дождь + Солнце Cоздан новый элемент: Радуга" ))
(assert (Elem (Name Радуга))))

(defrule Rule129 (declare (salience 20)) (Elem (Name Алмаз)) (Elem (Name Металлические)) 
=> 
(assert(appendmessage "Соединяем: Алмаз + Металлические Cоздан новый элемент: Кольцо" ))
(assert (Elem (Name Кольцо))))

(defrule Rule130 (declare (salience 20)) (Elem (Name Металлические)) (Elem (Name Жизнь)) 
=> 
(assert(appendmessage "Соединяем: Металлические + Жизнь Cоздан новый элемент: Робот" ))
(assert (Elem (Name Робот))))

(defrule Rule131 (declare (salience 20)) (Elem (Name Лезвие)) (Elem (Name Лезвие)) 
=> 
(assert(appendmessage "Соединяем: Лезвие + Лезвие Cоздан новый элемент: Ножницы" ))
(assert (Elem (Name Ножницы))))


(defrule Rule132 (declare (salience 20)) (Elem (Name Лезвие)) (Elem (Name Трава)) 
=> 
(assert(appendmessage "Соединяем: Лезвие + ТраваCоздан новый элемент: Коса" ))
(assert (Elem (Name Коса))))

(defrule Rule133 (declare (salience 20)) (Elem (Name Дом)) (Elem (Name Небо)) 
=> 
(assert(appendmessage "Соединяем: Дом + Небо Cоздан новый элемент: Небоскреб" ))
(assert (Elem (Name Небоскреб))))

(defrule Rule134 (declare (salience 20)) (Elem (Name Солнце)) (Elem (Name Растение)) 
=> 
(assert(appendmessage "Соединяем: Солнце + Растение Cоздан новый элемент: Подсолнух" ))
(assert (Elem (Name Подсолнух))))

(defrule Rule135 (declare (salience 20)) (Elem (Name Лезвие)) (Elem (Name Металлические)) 
=> 
(assert(appendmessage "Соединяем: Лезвие + Металлические Cоздан новый элемент: Меч" ))
(assert (Elem (Name Меч))))

(defrule Rule136 (declare (salience 20)) (Elem (Name Стекло)) (Elem (Name Небо)) 
=> 
(assert(appendmessage "Соединяем: Стекло + Небо Cоздан новый элемент: Телескоп" ))
(assert (Elem (Name Телескоп))))


(defrule Rule137 (declare (salience 20)) (Elem (Name Луна)) (Elem (Name Море)) 
=> 
(assert(appendmessage "Соединяем: Луна + Море Cоздан новый элемент: Прилив" ))
(assert (Elem (Name Прилив))))


(defrule Rule138 (declare (salience 20)) (Elem (Name Песок)) (Elem (Name Стекло)) 
=> 
(assert(appendmessage "Соединяем: Песок + Стекло Cоздан новый элемент: Время" ))
(assert (Elem (Name Время))))


(defrule Rule139 (declare (salience 20)) (Elem (Name Дом)) (Elem (Name Дом)) 
=> 
(assert(appendmessage "Соединяем: Дом + Дом Cоздан новый элемент: Деревня" ))
(assert (Elem (Name Деревня))))

(defrule Rule140 (declare (salience 20)) (Elem (Name Цветок)) (Elem (Name Пруд)) 
=> 
(assert(appendmessage "Соединяем: Цветок + Пруд Cоздан новый элемент: Водяная лилия" ))
(assert (Elem (Name Водяная лилия))))

(defrule Rule141 (declare (salience 20)) (Elem (Name Гора)) (Elem (Name Река)) 
=> 
(assert(appendmessage "Соединяем: Гора + Река Cоздан новый элемент: Водопад" ))
(assert (Elem (Name Водопад))))

(defrule Rule142 (declare (salience 20)) (Elem (Name Дом)) (Elem (Name Ветер)) 
=> 
(assert(appendmessage "Соединяем: Дом + Ветер Cоздан новый элемент: Ветряная мельница" ))
(assert (Elem (Name Ветряная мельница))))

(defrule Rule143 (declare (salience 20)) (Elem (Name Стекло)) (Elem (Name Дом)) 
=> 
(assert(appendmessage "Соединяем: Стекло + Дом Cоздан новый элемент: Окно" ))
(assert (Elem (Name Окно))))

(defrule Rule144 (declare (salience 20)) (Elem (Name Электричество)) (Elem (Name Металлические)) 
=> 
(assert(appendmessage "Соединяем: Электричество + Металлические Cоздан новый элемент: Окно" ))
(assert (Elem (Name Проволка))))






























