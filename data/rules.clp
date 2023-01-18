(deftemplate ioproxy
	(multislot messages)
	(multislot answers) 
  (slot reaction)	; возможные ответы пользователя
	(slot value)  	; выбор пользователя
)

(deffacts proxy-fact
	(ioproxy
		(messages)
		(answers)
    (value none) ; значение пустое
	)
)

(defrule append-output-and-proceed
	(declare (salience  99))
	?current-message <- (appendmessage  ?new-msg) ; достает из списка текущую модель
	?proxy <- (ioproxy (messages $?msg-list)) ; кладет в прокси
	=>
	(printout t "Message appended : " ?new-msg " ... proceed ..." crlf)
	(modify ?proxy (messages $?msg-list ?new-msg)) ; модифицирует прокси список
	(printout t " current-message \n " ?current-message)
	(retract ?current-message) ; удаляем полученное сообщение 
)

(defrule append-answer-and-proceed
	(declare (salience 99))
	?current-answer <- (appendanswer ?new-ans)
	?proxy <- (ioproxy (answers $?ans-list))
	=>
	(printout t "Answer appended : " ?new-ans " ... proceed ... " crlf)
	(modify ?proxy (answers $?ans-list ?new-ans))
	(retract ?current-answer)
)

;----------------------------------------------------------------------------------------------------------------------------------------------------------------

(deftemplate elem
  (multislot name)
)


(defrule offerChoice
  (declare (salience 1))
  (elem (name ?n))
  =>
  

  (bind ?l (str-compare ?n Земля))
  (if (!= ?l 0) then
    (assert (appendanswer "Земля"))
  )

  (bind ?l (str-compare ?n Вода))
  (if (!= ?l 0) then
    (assert (appendanswer "Вода"))
  )

  (bind ?l (str-compare ?n Огонь))
  (if (!= ?l 0) then
    (assert (appendanswer "Огонь"))
  )

  (bind ?l (str-compare ?n Воздух))
  (if (!= ?l 0) then
    (assert (appendanswer "Воздух"))
  )

  (assert (appendanswer "Подходящих комбинаций не найдено.
Выберите, пожалуйста, еще элемент.
Например:
"))

  (assert (appendmessagehalt "#ask_elem"))
)


;-----------------------------------------------------------------------------------------------------------------------------------------------------------------

(defrule Rule1 ""
  (declare (salience 20))
  (elem (name Земля))
  (elem (name Воздух))
=>
  (assert (appendmessage  "Земля + Воздух = Пыль;  "))
  (assert (elem (name Пыль)))
)

(defrule Rule2 ""
  (declare (salience 20))
  (elem (name Огонь))
  (elem (name Воздух))
=>
  (assert (appendmessage  "Огонь + Воздух = Энергия;  "))
  (assert (elem (name Энергия)))
)

(defrule Rule3 ""
  (declare (salience 20))
  (elem (name Земля))
  (elem (name Огонь))
=>
  (assert (appendmessage  "Земля + Огонь = Лава;  "))
  (assert (elem (name Лава)))
)

(defrule Rule4 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Земля))
=>
  (assert (appendmessage  "Вода + Земля = Грязь;  "))
  (assert (elem (name Грязь)))
)

(defrule Rule5 ""
  (declare (salience 20))
  (elem (name Земля))
  (elem (name Земля))
=>
  (assert (appendmessage  "Земля + Земля = Давление;  "))
  (assert (elem (name Давление)))
)

(defrule Rule6 ""
  (declare (salience 20))
  (elem (name Воздух))
  (elem (name Воздух))
=>
  (assert (appendmessage  "Воздух + Воздух = Давление;  "))
  (assert (elem (name Давление)))
)

(defrule Rule7 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Воздух))
=>
  (assert (appendmessage  "Вода + Воздух = Дождь;  "))
  (assert (elem (name Дождь)))
)

(defrule Rule8 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Вода))
=>
  (assert (appendmessage  "Вода + Вода = Море;  "))
  (assert (elem (name Море)))
)

(defrule Rule9 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Огонь))
=>
  (assert (appendmessage  "Вода + Огонь = Пар;  "))
  (assert (elem (name Пар)))
)

(defrule Rule10 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Энергия))
=>
  (assert (appendmessage  "Вода + Энергия = Пар;  "))
  (assert (elem (name Пар)))
)

(defrule Rule11 ""
  (declare (salience 20))
  (elem (name Воздух))
  (elem (name Давление))
=>
  (assert (appendmessage  "Воздух + Давление = Атмосфера;  "))
  (assert (elem (name Атмосфера)))
)

(defrule Rule12 ""
  (declare (salience 20))
  (elem (name Грязь))
  (elem (name Огонь))
=>
  (assert (appendmessage  "Грязь + Огонь = Кирпич;  "))
  (assert (elem (name Кирпич)))
)

(defrule Rule13 ""
  (declare (salience 20))
  (elem (name Воздух))
  (elem (name Пар))
=>
  (assert (appendmessage  "Воздух + Пар = Облако;  "))
  (assert (elem (name Облако)))
)

(defrule Rule14 ""
  (declare (salience 20))
  (elem (name Земля))
  (elem (name Энергия))
=>
  (assert (appendmessage  "Земля + Энергия = Землетрясение;  "))
  (assert (elem (name Землетрясение)))
)

(defrule Rule15 ""
  (declare (salience 20))
  (elem (name Дождь))
  (elem (name Дождь))
=>
  (assert (appendmessage  "Дождь + Дождь = Наводнение;  "))
  (assert (elem (name Наводнение)))
)

(defrule Rule16 ""
  (declare (salience 20))
  (elem (name Пар))
  (elem (name Земля))
=>
  (assert (appendmessage  "Пар + Земля = Гейзер;  "))
  (assert (elem (name Гейзер)))
)

(defrule Rule17 ""
  (declare (salience 20))
  (elem (name Лава))
  (elem (name Давление))
=>
  (assert (appendmessage  "Лава + Давление = Гранит;  "))
  (assert (elem (name Гранит)))
)

(defrule Rule18 ""
  (declare (salience 20))
  (elem (name Огонь))
  (elem (name Пыль))
=>
  (assert (appendmessage  "Огонь + Пыль = Порох;  "))
  (assert (elem (name Порох)))
)

(defrule Rule19 ""
  (declare (salience 20))
  (elem (name Лава))
  (elem (name Вода))
=>
  (assert (appendmessage  "Лава + Вода = Обсидиан;  "))
  (assert (elem (name Обсидиан)))
)

(defrule Rule20 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Море))
=>
  (assert (appendmessage  "Вода + Море = Океан;  "))
  (assert (elem (name Океан)))
)

(defrule Rule21 ""
  (declare (salience 20))
  (elem (name Земля))
  (elem (name Дождь))
=>
  (assert (appendmessage  "Земля + Дождь = Растение;  "))
  (assert (elem (name Растение)))
)

(defrule Rule22 ""
  (declare (salience 20))
  (elem (name Море))
  (elem (name Огонь))
=>
  (assert (appendmessage  "Море + Огонь = Соль;  "))
  (assert (elem (name Соль)))
)

(defrule Rule23 ""
  (declare (salience 20))
  (elem (name Океан))
  (elem (name Огонь))
=>
  (assert (appendmessage  "Океан + Огонь = Соль;  "))
  (assert (elem (name Соль)))
)

(defrule Rule24 ""
  (declare (salience 20))
  (elem (name Воздух))
  (elem (name Лава))
=>
  (assert (appendmessage  "Воздух + Лава = Камень;  "))
  (assert (elem (name Камень)))
)

(defrule Rule25 ""
  (declare (salience 20))
  (elem (name Земля))
  (elem (name Лава))
=>
  (assert (appendmessage  "Земля + Лава = Вулкан;  "))
  (assert (elem (name Вулкан)))
)

(defrule Rule26 ""
  (declare (salience 20))
  (elem (name Воздух))
  (elem (name Давление))
=>
  (assert (appendmessage  "Воздух + Давление = Ветер;  "))
  (assert (elem (name Ветер)))
)

(defrule Rule27 ""
  (declare (salience 20))
  (elem (name Воздух))
  (elem (name Энергия))
=>
  (assert (appendmessage  "Воздух + Энергия = Ветер;  "))
  (assert (elem (name Ветер)))
)

(defrule Rule28 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Растение))
=>
  (assert (appendmessage  "Вода + Растение = Водоросли;  "))
  (assert (elem (name Водоросли)))
)

(defrule Rule29 ""
  (declare (salience 20))
  (elem (name Океан))
  (elem (name Растение))
=>
  (assert (appendmessage  "Океан + Растение = Водоросли;  "))
  (assert (elem (name Водоросли)))
)

(defrule Rule30 ""
  (declare (salience 20))
  (elem (name Море))
  (elem (name Растение))
=>
  (assert (appendmessage  "Море + Растение = Водоросли;  "))
  (assert (elem (name Водоросли)))
)

(defrule Rule31 ""
  (declare (salience 20))
  (elem (name Вулкан))
  (elem (name Энергия))
=>
  (assert (appendmessage  "Вулкан + Энергия = Пепел;  "))
  (assert (elem (name Пепел)))
)

(defrule Rule32 ""
  (declare (salience 20))
  (elem (name Давление))
  (elem (name Растение))
=>
  (assert (appendmessage  "Давление + Растение = Уголь;  "))
  (assert (elem (name Уголь)))
)

(defrule Rule33 ""
  (declare (salience 20))
  (elem (name Растение))
  (elem (name Облако))
=>
  (assert (appendmessage  "Растение + Облако = Хлопок;  "))
  (assert (elem (name Хлопок)))
)

(defrule Rule34 ""
  (declare (salience 20))
  (elem (name Вулкан))
  (elem (name Энергия))
=>
  (assert (appendmessage  "Вулкан + Энергия = Извержение;  "))
  (assert (elem (name Извержение)))
)

(defrule Rule35 ""
  (declare (salience 20))
  (elem (name Огонь))
  (elem (name Порох))
=>
  (assert (appendmessage  "Огонь + Порох = Взрыв;  "))
  (assert (elem (name Взрыв)))
)

(defrule Rule36 ""
  (declare (salience 20))
  (elem (name Земля))
  (elem (name Облако))
=>
  (assert (appendmessage  "Земля + Облако = Туман;  "))
  (assert (elem (name Туман)))
)

(defrule Rule37 ""
  (declare (salience 20))
  (elem (name Растение))
  (elem (name Растение))
=>
  (assert (appendmessage  "Растение + Растение = Сад;  "))
  (assert (elem (name Сад)))
)

(defrule Rule38 ""
  (declare (salience 20))
  (elem (name Земля))
  (elem (name Растение))
=>
  (assert (appendmessage  "Земля + Растение = Трава;  "))
  (assert (elem (name Трава)))
)

(defrule Rule39 ""
  (declare (salience 20))
  (elem (name Ветер))
  (elem (name Энергия))
=>
  (assert (appendmessage  "Ветер + Энергия = Ураган;  "))
  (assert (elem (name Ураган)))
)

(defrule Rule40 ""
  (declare (salience 20))
  (elem (name Море))
  (elem (name Вулкан))
=>
  (assert (appendmessage  "Море + Вулкан = Остров;  "))
  (assert (elem (name Остров)))
)

(defrule Rule41 ""
  (declare (salience 20))
  (elem (name Океан))
  (elem (name Вулкан))
=>
  (assert (appendmessage  "Океан + Вулкан = Остров;  "))
  (assert (elem (name Остров)))
)

(defrule Rule42 ""
  (declare (salience 20))
  (elem (name Земля))
  (elem (name Камень))
=>
  (assert (appendmessage  "Земля + Камень = Металлические;  "))
  (assert (elem (name Металлические)))
)

(defrule Rule43 ""
  (declare (salience 20))
  (elem (name Камень))
  (elem (name Растение))
=>
  (assert (appendmessage  "Камень + Растение = Мосс;  "))
  (assert (elem (name Мосс)))
)

(defrule Rule44 ""
  (declare (salience 20))
  (elem (name Камень))
  (elem (name Водоросли))
=>
  (assert (appendmessage  "Камень + Водоросли = Мосс;  "))
  (assert (elem (name Мосс)))
)

(defrule Rule45 ""
  (declare (salience 20))
  (elem (name Землетрясение))
  (elem (name Земля))
=>
  (assert (appendmessage  "Землетрясение + Земля = Гора;  "))
  (assert (elem (name Гора)))
)

(defrule Rule46 ""
  (declare (salience 20))
  (elem (name Камень))
  (elem (name Воздух))
=>
  (assert (appendmessage  "Камень + Воздух = Песок;  "))
  (assert (elem (name Песок)))
)

(defrule Rule47 ""
  (declare (salience 20))
  (elem (name Камень))
  (elem (name Ветер))
=>
  (assert (appendmessage  "Камень + Ветер = Песок;  "))
  (assert (elem (name Песок)))
)

(defrule Rule48 ""
  (declare (salience 20))
  (elem (name Воздух))
  (elem (name Облако))
=>
  (assert (appendmessage  "Воздух + Облако = Небо;  "))
  (assert (elem (name Небо)))
)

(defrule Rule49 ""
  (declare (salience 20))
  (elem (name Облако))
  (elem (name Энергия))
=>
  (assert (appendmessage  "Облако + Энергия = Шторм;  "))
  (assert (elem (name Шторм)))
)

(defrule Rule50 ""
  (declare (salience 20))
  (elem (name Грязь))
  (elem (name Растение))
=>
  (assert (appendmessage  "Грязь + Растение = Болото;  "))
  (assert (elem (name Болото)))
)

(defrule Rule51 ""
  (declare (salience 20))
  (elem (name Грязь))
  (elem (name Трава))
=>
  (assert (appendmessage  "Грязь + Трава = Болото;  "))
  (assert (elem (name Болото)))
)

(defrule Rule52 ""
  (declare (salience 20))
  (elem (name Растение))
  (elem (name Землетрясение))
=>
  (assert (appendmessage  "Растение + Землетрясение = Табак;  "))
  (assert (elem (name Табак)))
)

(defrule Rule53 ""
  (declare (salience 20))
  (elem (name Море))
  (elem (name Землетрясение))
=>
  (assert (appendmessage  "Море + Землетрясение = Цунами;  "))
  (assert (elem (name Цунами)))
)

(defrule Rule54 ""
  (declare (salience 20))
  (elem (name Кирпич))
  (elem (name Кирпич))
=>
  (assert (appendmessage  "Кирпич + Кирпич = Стена;  "))
  (assert (elem (name Стена)))
)

(defrule Rule55 ""
  (declare (salience 20))
  (elem (name Море))
  (elem (name Ветер))
=>
  (assert (appendmessage  "Море + Ветер = Волна;  "))
  (assert (elem (name Волна)))
)

(defrule Rule56 ""
  (declare (salience 20))
  (elem (name Океан))
  (elem (name Ветер))
=>
  (assert (appendmessage  "Океан + Ветер = Волна;  "))
  (assert (elem (name Волна)))
)

(defrule Rule57 ""
  (declare (salience 20))
  (elem (name Остров))
  (elem (name Остров))
=>
  (assert (appendmessage  "Остров + Остров = Архипелаг;  "))
  (assert (elem (name Архипелаг)))
)

(defrule Rule58 ""
  (declare (salience 20))
  (elem (name Энергия))
  (elem (name Взрыв))
=>
  (assert (appendmessage  "Энергия + Взрыв = Атомная бомба;  "))
  (assert (elem (name Атомная бомба)))
)

(defrule Rule59 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Песок))
=>
  (assert (appendmessage  "Вода + Песок = Пляж;  "))
  (assert (elem (name Пляж)))
)

(defrule Rule60 ""
  (declare (salience 20))
  (elem (name Море))
  (elem (name Песок))
=>
  (assert (appendmessage  "Море + Песок = Пляж;  "))
  (assert (elem (name Пляж)))
)

(defrule Rule61 ""
  (declare (salience 20))
  (elem (name Океан))
  (elem (name Песок))
=>
  (assert (appendmessage  "Океан + Песок = Пляж;  "))
  (assert (elem (name Пляж)))
)

(defrule Rule62 ""
  (declare (salience 20))
  (elem (name Металлические))
  (elem (name Камень))
=>
  (assert (appendmessage  "Металлические + Камень = Лезвие;  "))
  (assert (elem (name Лезвие)))
)

(defrule Rule63 ""
  (declare (salience 20))
  (elem (name Пар))
  (elem (name Металлические))
=>
  (assert (appendmessage  "Пар + Металлические = Котел;  "))
  (assert (elem (name Котел)))
)

(defrule Rule64 ""
  (declare (salience 20))
  (elem (name Порох))
  (elem (name Металлические))
=>
  (assert (appendmessage  "Порох + Металлические = Пуля;  "))
  (assert (elem (name Пуля)))
)

(defrule Rule65 ""
  (declare (salience 20))
  (elem (name Песок))
  (elem (name Растение))
=>
  (assert (appendmessage  "Песок + Растение = Кактус;  "))
  (assert (elem (name Кактус)))
)

(defrule Rule66 ""
  (declare (salience 20))
  (elem (name Песок))
  (elem (name Грязь))
=>
  (assert (appendmessage  "Песок + Грязь = Глина;  "))
  (assert (elem (name Глина)))
)

(defrule Rule67 ""
  (declare (salience 20))
  (elem (name Песок))
  (elem (name Песок))
=>
  (assert (appendmessage  "Песок + Песок = Пустыня;  "))
  (assert (elem (name Пустыня)))
)

(defrule Rule68 ""
  (declare (salience 20))
  (elem (name Песок))
  (elem (name Кактус))
=>
  (assert (appendmessage  "Песок + Кактус = Пустыня;  "))
  (assert (elem (name Пустыня)))
)

(defrule Rule69 ""
  (declare (salience 20))
  (elem (name Туман))
  (elem (name Трава))
=>
  (assert (appendmessage  "Туман + Трава = Роса;  "))
  (assert (elem (name Роса)))
)

(defrule Rule70 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Трава))
=>
  (assert (appendmessage  "Вода + Трава = Роса;  "))
  (assert (elem (name Роса)))
)

(defrule Rule71 ""
  (declare (salience 20))
  (elem (name Уголь))
  (elem (name Давление))
=>
  (assert (appendmessage  "Уголь + Давление = Алмаз;  "))
  (assert (elem (name Алмаз)))
)

(defrule Rule72 ""
  (declare (salience 20))
  (elem (name Песок))
  (elem (name Ветер))
=>
  (assert (appendmessage  "Песок + Ветер = Дюны;  "))
  (assert (elem (name Дюны)))
)

(defrule Rule73 ""
  (declare (salience 20))
  (elem (name Пляж))
  (elem (name Ветер))
=>
  (assert (appendmessage  "Пляж + Ветер = Дюны;  "))
  (assert (elem (name Дюны)))
)

(defrule Rule74 ""
  (declare (salience 20))
  (elem (name Пустыня))
  (elem (name Ветер))
=>
  (assert (appendmessage  "Пустыня + Ветер = Дюны;  "))
  (assert (elem (name Дюны)))
)

(defrule Rule75 ""
  (declare (salience 20))
  (elem (name Металлические))
  (elem (name Энергия))
=>
  (assert (appendmessage  "Металлические + Энергия = Электричество;  "))
  (assert (elem (name Электричество)))
)

(defrule Rule76 ""
  (declare (salience 20))
  (elem (name Взрыв))
  (elem (name Небо))
=>
  (assert (appendmessage  "Взрыв + Небо = Фейерверк;  "))
  (assert (elem (name Фейерверк)))
)

(defrule Rule77 ""
  (declare (salience 20))
  (elem (name Растение))
  (elem (name Сад))
=>
  (assert (appendmessage  "Растение + Сад = Цветок;  "))
  (assert (elem (name Цветок)))
)

(defrule Rule78 ""
  (declare (salience 20))
  (elem (name Огонь))
  (elem (name Песок))
=>
  (assert (appendmessage  "Огонь + Песок = Стекло;  "))
  (assert (elem (name Стекло)))
)

(defrule Rule79 ""
  (declare (salience 20))
  (elem (name Взрыв))
  (elem (name Металлические))
=>
  (assert (appendmessage  "Взрыв + Металлические = Граната;  "))
  (assert (elem (name Граната)))
)

(defrule Rule80 ""
  (declare (salience 20))
  (elem (name Земля))
  (elem (name Небо))
=>
  (assert (appendmessage  "Земля + Небо = Горизонт;  "))
  (assert (elem (name Горизонт)))
)

(defrule Rule81 ""
  (declare (salience 20))
  (elem (name Море))
  (elem (name Небо))
=>
  (assert (appendmessage  "Море + Небо = Горизонт;  "))
  (assert (elem (name Горизонт)))
)

(defrule Rule82 ""
  (declare (salience 20))
  (elem (name Океан))
  (elem (name Небо))
=>
  (assert (appendmessage  "Океан + Небо = Горизонт;  "))
  (assert (elem (name Горизонт)))
)

(defrule Rule83 ""
  (declare (salience 20))
  (elem (name Стена))
  (elem (name Стена))
=>
  (assert (appendmessage  "Стена + Стена = Дом;  "))
  (assert (elem (name Дом)))
)

(defrule Rule84 ""
  (declare (salience 20))
  (elem (name Растение))
  (elem (name Стена))
=>
  (assert (appendmessage  "Растение + Стена = Айви;  "))
  (assert (elem (name Айви)))
)

(defrule Rule85 ""
  (declare (salience 20))
  (elem (name Болото))
  (elem (name Энергия))
=>
  (assert (appendmessage  "Болото + Энергия = Жизнь;  "))
  (assert (elem (name Жизнь)))
)

(defrule Rule86 ""
  (declare (salience 20))
  (elem (name Камень))
  (elem (name Небо))
=>
  (assert (appendmessage  "Камень + Небо = Луна;  "))
  (assert (elem (name Луна)))
)

(defrule Rule87 ""
  (declare (salience 20))
  (elem (name Гора))
  (elem (name Гора))
=>
  (assert (appendmessage  "Гора + Гора = Горный хребет;  "))
  (assert (elem (name Горный хребет)))
)

(defrule Rule88 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Сад))
=>
  (assert (appendmessage  "Вода + Сад = Пруд;  "))
  (assert (elem (name Пруд)))
)

(defrule Rule89 ""
  (declare (salience 20))
  (elem (name Песок))
  (elem (name Болото))
=>
  (assert (appendmessage  "Песок + Болото = Зыбучие пески;  "))
  (assert (elem (name Зыбучие пески)))
)

(defrule Rule90 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Гора))
=>
  (assert (appendmessage  "Вода + Гора = Река;  "))
  (assert (elem (name Река)))
)

(defrule Rule91 ""
  (declare (salience 20))
  (elem (name Металлические))
  (elem (name Воздух))
=>
  (assert (appendmessage  "Металлические + Воздух = Ржавчина;  "))
  (assert (elem (name Ржавчина)))
)

(defrule Rule92 ""
  (declare (salience 20))
  (elem (name Камень))
  (elem (name Песок))
=>
  (assert (appendmessage  "Камень + Песок = Песчаник;  "))
  (assert (elem (name Песчаник)))
)

(defrule Rule93 ""
  (declare (salience 20))
  (elem (name Песок))
  (elem (name Шторм))
=>
  (assert (appendmessage  "Песок + Шторм = Песчаная буря;  "))
  (assert (elem (name Песчаная буря)))
)

(defrule Rule94 ""
  (declare (salience 20))
  (elem (name Воздух))
  (elem (name Волна))
=>
  (assert (appendmessage  "Воздух + Волна = Звук;  "))
  (assert (elem (name Звук)))
)

(defrule Rule95 ""
  (declare (salience 20))
  (elem (name Металлические))
  (elem (name Уголь))
=>
  (assert (appendmessage  "Металлические + Уголь = Сталь;  "))
  (assert (elem (name Сталь)))
)

(defrule Rule96 ""
  (declare (salience 20))
  (elem (name Огонь))
  (elem (name Небо))
=>
  (assert (appendmessage  "Огонь + Небо = Солнце;  "))
  (assert (elem (name Солнце)))
)

(defrule Rule97 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Стекло))
=>
  (assert (appendmessage  "Вода + Стекло = Аквариум;  "))
  (assert (elem (name Аквариум)))
)

(defrule Rule98 ""
  (declare (salience 20))
  (elem (name Болото))
  (elem (name Жизнь))
=>
  (assert (appendmessage  "Болото + Жизнь = Бактерии;  "))
  (assert (elem (name Бактерии)))
)

(defrule Rule99 ""
  (declare (salience 20))
  (elem (name Жизнь))
  (elem (name Небо))
=>
  (assert (appendmessage  "Жизнь + Небо = Птица;  "))
  (assert (elem (name Птица)))
)

(defrule Rule100 ""
  (declare (salience 20))
  (elem (name Стекло))
  (elem (name Лезвие))
=>
  (assert (appendmessage  "Стекло + Лезвие = Блендер;  "))
  (assert (elem (name Блендер)))
)

(defrule Rule101 ""
  (declare (salience 20))
  (elem (name Река))
  (elem (name Металлические))
=>
  (assert (appendmessage  "Река + Металлические = Мост;  "))
  (assert (elem (name Мост)))
)

(defrule Rule102 ""
  (declare (salience 20))
  (elem (name Стена))
  (elem (name Река))
=>
  (assert (appendmessage  "Стена + Река = Дам;  "))
  (assert (elem (name Дам)))
)

(defrule Rule103 ""
  (declare (salience 20))
  (elem (name Небо))
  (elem (name Солнце))
=>
  (assert (appendmessage  "Небо + Солнце = День;  "))
  (assert (elem (name День)))
)

(defrule Rule104 ""
  (declare (salience 20))
  (elem (name Солнце))
  (elem (name Луна))
=>
  (assert (appendmessage  "Солнце + Луна = Затмение;  "))
  (assert (elem (name Затмение)))
)

(defrule Rule105 ""
  (declare (salience 20))
  (elem (name Жизнь))
  (elem (name Камень))
=>
  (assert (appendmessage  "Жизнь + Камень = Яйцо;  "))
  (assert (elem (name Яйцо)))
)

(defrule Rule106 ""
  (declare (salience 20))
  (elem (name Стекло))
  (elem (name Металлические))
=>
  (assert (appendmessage  "Стекло + Металлические = Очки;  "))
  (assert (elem (name Очки)))
)

(defrule Rule107 ""
  (declare (salience 20))
  (elem (name Металлические))
  (elem (name Солнце))
=>
  (assert (appendmessage  "Металлические + Солнце = Золото;  "))
  (assert (elem (name Золото)))
)

(defrule Rule108 ""
  (declare (salience 20))
  (elem (name Глина))
  (elem (name Жизнь))
=>
  (assert (appendmessage  "Глина + Жизнь = Голем;  "))
  (assert (elem (name Голем)))
)

(defrule Rule109 ""
  (declare (salience 20))
  (elem (name Растение))
  (elem (name Стекло))
=>
  (assert (appendmessage  "Растение + Стекло = Теплица;  "))
  (assert (elem (name Теплица)))
)

(defrule Rule110 ""
  (declare (salience 20))
  (elem (name Металлические))
  (elem (name Пуля))
=>
  (assert (appendmessage  "Металлические + Пуля = Пистолет;  "))
  (assert (elem (name Пистолет)))
)

(defrule Rule111 ""
  (declare (salience 20))
  (elem (name Трава))
  (elem (name Солнце))
=>
  (assert (appendmessage  "Трава + Солнце = Хэй;  "))
  (assert (elem (name Хэй)))
)

(defrule Rule112 ""
  (declare (salience 20))
  (elem (name Песок))
  (elem (name Стекло))
=>
  (assert (appendmessage  "Песок + Стекло = Песочные часы;  "))
  (assert (elem (name Песочные часы)))
)

(defrule Rule113 ""
  (declare (salience 20))
  (elem (name Земля))
  (elem (name Жизнь))
=>
  (assert (appendmessage  "Земля + Жизнь = Человек;  "))
  (assert (elem (name Человек)))
)

(defrule Rule114 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Пруд))
=>
  (assert (appendmessage  "Вода + Пруд = Озеро;  "))
  (assert (elem (name Озеро)))
)

(defrule Rule115 ""
  (declare (salience 20))
  (elem (name Электричество))
  (elem (name Стекло))
=>
  (assert (appendmessage  "Электричество + Стекло = Лампочка;  "))
  (assert (elem (name Лампочка)))
)

(defrule Rule116 ""
  (declare (salience 20))
  (elem (name Стекло))
  (elem (name Стена))
=>
  (assert (appendmessage  "Стекло + Стена = Зеркало;  "))
  (assert (elem (name Зеркало)))
)

(defrule Rule117 ""
  (declare (salience 20))
  (elem (name Небо))
  (elem (name Луна))
=>
  (assert (appendmessage  "Небо + Луна = Ночь;  "))
  (assert (elem (name Ночь)))
)

(defrule Rule118 ""
  (declare (salience 20))
  (elem (name Пустыня))
  (elem (name Вода))
=>
  (assert (appendmessage  "Пустыня + Вода = Оазис;  "))
  (assert (elem (name Оазис)))
)

(defrule Rule119 ""
  (declare (salience 20))
  (elem (name Растение))
  (elem (name Солнце))
=>
  (assert (appendmessage  "Растение + Солнце = Кислород;  "))
  (assert (elem (name Кислород)))
)

(defrule Rule120 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Цветок))
=>
  (assert (appendmessage  "Вода + Цветок = Духи;  "))
  (assert (elem (name Духи)))
)

(defrule Rule121 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Жизнь))
=>
  (assert (appendmessage  "Вода + Жизнь = Планктон;  "))
  (assert (elem (name Планктон)))
)

(defrule Rule122 ""
  (declare (salience 20))
  (elem (name Огонь))
  (elem (name Глина))
=>
  (assert (appendmessage  "Огонь + Глина = Керамика;  "))
  (assert (elem (name Керамика)))
)

(defrule Rule123 ""
  (declare (salience 20))
  (elem (name Пустыня))
  (elem (name Камень))
=>
  (assert (appendmessage  "Пустыня + Камень = Пирамида;  "))
  (assert (elem (name Пирамида)))
)

(defrule Rule124 ""
  (declare (salience 20))
  (elem (name Дождь))
  (elem (name Солнце))
=>
  (assert (appendmessage  "Дождь + Солнце = Радуга;  "))
  (assert (elem (name Радуга)))
)

(defrule Rule125 ""
  (declare (salience 20))
  (elem (name Алмаз))
  (elem (name Металлические))
=>
  (assert (appendmessage  "Алмаз + Металлические = Кольцо;  "))
  (assert (elem (name Кольцо)))
)

(defrule Rule126 ""
  (declare (salience 20))
  (elem (name Металлические))
  (elem (name Жизнь))
=>
  (assert (appendmessage  "Металлические + Жизнь = Робот;  "))
  (assert (elem (name Робот)))
)

(defrule Rule127 ""
  (declare (salience 20))
  (elem (name Лезвие))
  (elem (name Лезвие))
=>
  (assert (appendmessage  "Лезвие + Лезвие = Ножницы;  "))
  (assert (elem (name Ножницы)))
)

(defrule Rule128 ""
  (declare (salience 20))
  (elem (name Лезвие))
  (elem (name Трава))
=>
  (assert (appendmessage  "Лезвие + Трава = Коса;  "))
  (assert (elem (name Коса)))
)

(defrule Rule129 ""
  (declare (salience 20))
  (elem (name Дом))
  (elem (name Небо))
=>
  (assert (appendmessage  "Дом + Небо = Небоскреб;  "))
  (assert (elem (name Небоскреб)))
)

(defrule Rule130 ""
  (declare (salience 20))
  (elem (name Солнце))
  (elem (name Растение))
=>
  (assert (appendmessage  "Солнце + Растение = Подсолнух;  "))
  (assert (elem (name Подсолнух)))
)

(defrule Rule131 ""
  (declare (salience 20))
  (elem (name Лезвие))
  (elem (name Металлические))
=>
  (assert (appendmessage  "Лезвие + Металлические = Меч;  "))
  (assert (elem (name Меч)))
)

(defrule Rule132 ""
  (declare (salience 20))
  (elem (name Стекло))
  (elem (name Небо))
=>
  (assert (appendmessage  "Стекло + Небо = Телескоп;  "))
  (assert (elem (name Телескоп)))
)

(defrule Rule133 ""
  (declare (salience 20))
  (elem (name Луна))
  (elem (name Море))
=>
  (assert (appendmessage  "Луна + Море = Прилив;  "))
  (assert (elem (name Прилив)))
)

(defrule Rule134 ""
  (declare (salience 20))
  (elem (name Луна))
  (elem (name Океан))
=>
  (assert (appendmessage  "Луна + Океан = Прилив;  "))
  (assert (elem (name Прилив)))
)

(defrule Rule135 ""
  (declare (salience 20))
  (elem (name Песок))
  (elem (name Стекло))
=>
  (assert (appendmessage  "Песок + Стекло = Время;  "))
  (assert (elem (name Время)))
)

(defrule Rule136 ""
  (declare (salience 20))
  (elem (name Дом))
  (elem (name Дом))
=>
  (assert (appendmessage  "Дом + Дом = Деревня;  "))
  (assert (elem (name Деревня)))
)

(defrule Rule137 ""
  (declare (salience 20))
  (elem (name Цветок))
  (elem (name Пруд))
=>
  (assert (appendmessage  "Цветок + Пруд = Водяная лилия;  "))
  (assert (elem (name Водяная лилия)))
)

(defrule Rule138 ""
  (declare (salience 20))
  (elem (name Гора))
  (elem (name Река))
=>
  (assert (appendmessage  "Гора + Река = Водопад;  "))
  (assert (elem (name Водопад)))
)

(defrule Rule139 ""
  (declare (salience 20))
  (elem (name Дом))
  (elem (name Ветер))
=>
  (assert (appendmessage  "Дом + Ветер = Ветреная мельница;  "))
  (assert (elem (name Ветреная мельница)))
)

(defrule Rule140 ""
  (declare (salience 20))
  (elem (name Стекло))
  (elem (name Дом))
=>
  (assert (appendmessage  "Стекло + Дом = Окно;  "))
  (assert (elem (name Окно)))
)

(defrule Rule141 ""
  (declare (salience 20))
  (elem (name Электричество))
  (elem (name Металлические))
=>
  (assert (appendmessage  "Электричество + Металлические = Проволока;  "))
  (assert (elem (name Проволока)))
)

(defrule Rule1 ""
  (declare (salience 20))
  (elem (name Земля))
  (elem (name Воздух))
=>
  (assert (appendmessage  "Земля + Воздух = Пыль;  "))
  (assert (elem (name Пыль)))
)

(defrule Rule2 ""
  (declare (salience 20))
  (elem (name Огонь))
  (elem (name Воздух))
=>
  (assert (appendmessage  "Огонь + Воздух = Энергия;  "))
  (assert (elem (name Энергия)))
)

(defrule Rule3 ""
  (declare (salience 20))
  (elem (name Земля))
  (elem (name Огонь))
=>
  (assert (appendmessage  "Земля + Огонь = Лава;  "))
  (assert (elem (name Лава)))
)

(defrule Rule4 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Земля))
=>
  (assert (appendmessage  "Вода + Земля = Грязь;  "))
  (assert (elem (name Грязь)))
)

(defrule Rule5 ""
  (declare (salience 20))
  (elem (name Земля))
  (elem (name Земля))
=>
  (assert (appendmessage  "Земля + Земля = Давление;  "))
  (assert (elem (name Давление)))
)

(defrule Rule6 ""
  (declare (salience 20))
  (elem (name Воздух))
  (elem (name Воздух))
=>
  (assert (appendmessage  "Воздух + Воздух = Давление;  "))
  (assert (elem (name Давление)))
)

(defrule Rule7 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Воздух))
=>
  (assert (appendmessage  "Вода + Воздух = Дождь;  "))
  (assert (elem (name Дождь)))
)

(defrule Rule8 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Вода))
=>
  (assert (appendmessage  "Вода + Вода = Море;  "))
  (assert (elem (name Море)))
)

(defrule Rule9 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Огонь))
=>
  (assert (appendmessage  "Вода + Огонь = Пар;  "))
  (assert (elem (name Пар)))
)

(defrule Rule10 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Энергия))
=>
  (assert (appendmessage  "Вода + Энергия = Пар;  "))
  (assert (elem (name Пар)))
)

(defrule Rule11 ""
  (declare (salience 20))
  (elem (name Воздух))
  (elem (name Давление))
=>
  (assert (appendmessage  "Воздух + Давление = Атмосфера;  "))
  (assert (elem (name Атмосфера)))
)

(defrule Rule12 ""
  (declare (salience 20))
  (elem (name Грязь))
  (elem (name Огонь))
=>
  (assert (appendmessage  "Грязь + Огонь = Кирпич;  "))
  (assert (elem (name Кирпич)))
)

(defrule Rule13 ""
  (declare (salience 20))
  (elem (name Воздух))
  (elem (name Пар))
=>
  (assert (appendmessage  "Воздух + Пар = Облако;  "))
  (assert (elem (name Облако)))
)

(defrule Rule14 ""
  (declare (salience 20))
  (elem (name Земля))
  (elem (name Энергия))
=>
  (assert (appendmessage  "Земля + Энергия = Землетрясение;  "))
  (assert (elem (name Землетрясение)))
)

(defrule Rule15 ""
  (declare (salience 20))
  (elem (name Дождь))
  (elem (name Дождь))
=>
  (assert (appendmessage  "Дождь + Дождь = Наводнение;  "))
  (assert (elem (name Наводнение)))
)

(defrule Rule16 ""
  (declare (salience 20))
  (elem (name Пар))
  (elem (name Земля))
=>
  (assert (appendmessage  "Пар + Земля = Гейзер;  "))
  (assert (elem (name Гейзер)))
)

(defrule Rule17 ""
  (declare (salience 20))
  (elem (name Лава))
  (elem (name Давление))
=>
  (assert (appendmessage  "Лава + Давление = Гранит;  "))
  (assert (elem (name Гранит)))
)

(defrule Rule18 ""
  (declare (salience 20))
  (elem (name Огонь))
  (elem (name Пыль))
=>
  (assert (appendmessage  "Огонь + Пыль = Порох;  "))
  (assert (elem (name Порох)))
)

(defrule Rule19 ""
  (declare (salience 20))
  (elem (name Лава))
  (elem (name Вода))
=>
  (assert (appendmessage  "Лава + Вода = Обсидиан;  "))
  (assert (elem (name Обсидиан)))
)

(defrule Rule20 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Море))
=>
  (assert (appendmessage  "Вода + Море = Океан;  "))
  (assert (elem (name Океан)))
)

(defrule Rule21 ""
  (declare (salience 20))
  (elem (name Земля))
  (elem (name Дождь))
=>
  (assert (appendmessage  "Земля + Дождь = Растение;  "))
  (assert (elem (name Растение)))
)

(defrule Rule22 ""
  (declare (salience 20))
  (elem (name Море))
  (elem (name Огонь))
=>
  (assert (appendmessage  "Море + Огонь = Соль;  "))
  (assert (elem (name Соль)))
)

(defrule Rule23 ""
  (declare (salience 20))
  (elem (name Океан))
  (elem (name Огонь))
=>
  (assert (appendmessage  "Океан + Огонь = Соль;  "))
  (assert (elem (name Соль)))
)

(defrule Rule24 ""
  (declare (salience 20))
  (elem (name Воздух))
  (elem (name Лава))
=>
  (assert (appendmessage  "Воздух + Лава = Камень;  "))
  (assert (elem (name Камень)))
)

(defrule Rule25 ""
  (declare (salience 20))
  (elem (name Земля))
  (elem (name Лава))
=>
  (assert (appendmessage  "Земля + Лава = Вулкан;  "))
  (assert (elem (name Вулкан)))
)

(defrule Rule26 ""
  (declare (salience 20))
  (elem (name Воздух))
  (elem (name Давление))
=>
  (assert (appendmessage  "Воздух + Давление = Ветер;  "))
  (assert (elem (name Ветер)))
)

(defrule Rule27 ""
  (declare (salience 20))
  (elem (name Воздух))
  (elem (name Энергия))
=>
  (assert (appendmessage  "Воздух + Энергия = Ветер;  "))
  (assert (elem (name Ветер)))
)

(defrule Rule28 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Растение))
=>
  (assert (appendmessage  "Вода + Растение = Водоросли;  "))
  (assert (elem (name Водоросли)))
)

(defrule Rule29 ""
  (declare (salience 20))
  (elem (name Океан))
  (elem (name Растение))
=>
  (assert (appendmessage  "Океан + Растение = Водоросли;  "))
  (assert (elem (name Водоросли)))
)

(defrule Rule30 ""
  (declare (salience 20))
  (elem (name Море))
  (elem (name Растение))
=>
  (assert (appendmessage  "Море + Растение = Водоросли;  "))
  (assert (elem (name Водоросли)))
)

(defrule Rule31 ""
  (declare (salience 20))
  (elem (name Вулкан))
  (elem (name Энергия))
=>
  (assert (appendmessage  "Вулкан + Энергия = Пепел;  "))
  (assert (elem (name Пепел)))
)

(defrule Rule32 ""
  (declare (salience 20))
  (elem (name Давление))
  (elem (name Растение))
=>
  (assert (appendmessage  "Давление + Растение = Уголь;  "))
  (assert (elem (name Уголь)))
)

(defrule Rule33 ""
  (declare (salience 20))
  (elem (name Растение))
  (elem (name Облако))
=>
  (assert (appendmessage  "Растение + Облако = Хлопок;  "))
  (assert (elem (name Хлопок)))
)

(defrule Rule34 ""
  (declare (salience 20))
  (elem (name Вулкан))
  (elem (name Энергия))
=>
  (assert (appendmessage  "Вулкан + Энергия = Извержение;  "))
  (assert (elem (name Извержение)))
)

(defrule Rule35 ""
  (declare (salience 20))
  (elem (name Огонь))
  (elem (name Порох))
=>
  (assert (appendmessage  "Огонь + Порох = Взрыв;  "))
  (assert (elem (name Взрыв)))
)

(defrule Rule36 ""
  (declare (salience 20))
  (elem (name Земля))
  (elem (name Облако))
=>
  (assert (appendmessage  "Земля + Облако = Туман;  "))
  (assert (elem (name Туман)))
)

(defrule Rule37 ""
  (declare (salience 20))
  (elem (name Растение))
  (elem (name Растение))
=>
  (assert (appendmessage  "Растение + Растение = Сад;  "))
  (assert (elem (name Сад)))
)

(defrule Rule38 ""
  (declare (salience 20))
  (elem (name Земля))
  (elem (name Растение))
=>
  (assert (appendmessage  "Земля + Растение = Трава;  "))
  (assert (elem (name Трава)))
)

(defrule Rule39 ""
  (declare (salience 20))
  (elem (name Ветер))
  (elem (name Энергия))
=>
  (assert (appendmessage  "Ветер + Энергия = Ураган;  "))
  (assert (elem (name Ураган)))
)

(defrule Rule40 ""
  (declare (salience 20))
  (elem (name Море))
  (elem (name Вулкан))
=>
  (assert (appendmessage  "Море + Вулкан = Остров;  "))
  (assert (elem (name Остров)))
)

(defrule Rule41 ""
  (declare (salience 20))
  (elem (name Океан))
  (elem (name Вулкан))
=>
  (assert (appendmessage  "Океан + Вулкан = Остров;  "))
  (assert (elem (name Остров)))
)

(defrule Rule42 ""
  (declare (salience 20))
  (elem (name Земля))
  (elem (name Камень))
=>
  (assert (appendmessage  "Земля + Камень = Металлические;  "))
  (assert (elem (name Металлические)))
)

(defrule Rule43 ""
  (declare (salience 20))
  (elem (name Камень))
  (elem (name Растение))
=>
  (assert (appendmessage  "Камень + Растение = Мосс;  "))
  (assert (elem (name Мосс)))
)

(defrule Rule44 ""
  (declare (salience 20))
  (elem (name Камень))
  (elem (name Водоросли))
=>
  (assert (appendmessage  "Камень + Водоросли = Мосс;  "))
  (assert (elem (name Мосс)))
)

(defrule Rule45 ""
  (declare (salience 20))
  (elem (name Землетрясение))
  (elem (name Земля))
=>
  (assert (appendmessage  "Землетрясение + Земля = Гора;  "))
  (assert (elem (name Гора)))
)

(defrule Rule46 ""
  (declare (salience 20))
  (elem (name Камень))
  (elem (name Воздух))
=>
  (assert (appendmessage  "Камень + Воздух = Песок;  "))
  (assert (elem (name Песок)))
)

(defrule Rule47 ""
  (declare (salience 20))
  (elem (name Камень))
  (elem (name Ветер))
=>
  (assert (appendmessage  "Камень + Ветер = Песок;  "))
  (assert (elem (name Песок)))
)

(defrule Rule48 ""
  (declare (salience 20))
  (elem (name Воздух))
  (elem (name Облако))
=>
  (assert (appendmessage  "Воздух + Облако = Небо;  "))
  (assert (elem (name Небо)))
)

(defrule Rule49 ""
  (declare (salience 20))
  (elem (name Облако))
  (elem (name Энергия))
=>
  (assert (appendmessage  "Облако + Энергия = Шторм;  "))
  (assert (elem (name Шторм)))
)

(defrule Rule50 ""
  (declare (salience 20))
  (elem (name Грязь))
  (elem (name Растение))
=>
  (assert (appendmessage  "Грязь + Растение = Болото;  "))
  (assert (elem (name Болото)))
)

(defrule Rule51 ""
  (declare (salience 20))
  (elem (name Грязь))
  (elem (name Трава))
=>
  (assert (appendmessage  "Грязь + Трава = Болото;  "))
  (assert (elem (name Болото)))
)

(defrule Rule52 ""
  (declare (salience 20))
  (elem (name Растение))
  (elem (name Землетрясение))
=>
  (assert (appendmessage  "Растение + Землетрясение = Табак;  "))
  (assert (elem (name Табак)))
)

(defrule Rule53 ""
  (declare (salience 20))
  (elem (name Море))
  (elem (name Землетрясение))
=>
  (assert (appendmessage  "Море + Землетрясение = Цунами;  "))
  (assert (elem (name Цунами)))
)

(defrule Rule54 ""
  (declare (salience 20))
  (elem (name Кирпич))
  (elem (name Кирпич))
=>
  (assert (appendmessage  "Кирпич + Кирпич = Стена;  "))
  (assert (elem (name Стена)))
)

(defrule Rule55 ""
  (declare (salience 20))
  (elem (name Море))
  (elem (name Ветер))
=>
  (assert (appendmessage  "Море + Ветер = Волна;  "))
  (assert (elem (name Волна)))
)

(defrule Rule56 ""
  (declare (salience 20))
  (elem (name Океан))
  (elem (name Ветер))
=>
  (assert (appendmessage  "Океан + Ветер = Волна;  "))
  (assert (elem (name Волна)))
)

(defrule Rule57 ""
  (declare (salience 20))
  (elem (name Остров))
  (elem (name Остров))
=>
  (assert (appendmessage  "Остров + Остров = Архипелаг;  "))
  (assert (elem (name Архипелаг)))
)

(defrule Rule58 ""
  (declare (salience 20))
  (elem (name Энергия))
  (elem (name Взрыв))
=>
  (assert (appendmessage  "Энергия + Взрыв = Атомная бомба;  "))
  (assert (elem (name Атомная бомба)))
)

(defrule Rule59 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Песок))
=>
  (assert (appendmessage  "Вода + Песок = Пляж;  "))
  (assert (elem (name Пляж)))
)

(defrule Rule60 ""
  (declare (salience 20))
  (elem (name Море))
  (elem (name Песок))
=>
  (assert (appendmessage  "Море + Песок = Пляж;  "))
  (assert (elem (name Пляж)))
)

(defrule Rule61 ""
  (declare (salience 20))
  (elem (name Океан))
  (elem (name Песок))
=>
  (assert (appendmessage  "Океан + Песок = Пляж;  "))
  (assert (elem (name Пляж)))
)

(defrule Rule62 ""
  (declare (salience 20))
  (elem (name Металлические))
  (elem (name Камень))
=>
  (assert (appendmessage  "Металлические + Камень = Лезвие;  "))
  (assert (elem (name Лезвие)))
)

(defrule Rule63 ""
  (declare (salience 20))
  (elem (name Пар))
  (elem (name Металлические))
=>
  (assert (appendmessage  "Пар + Металлические = Котел;  "))
  (assert (elem (name Котел)))
)

(defrule Rule64 ""
  (declare (salience 20))
  (elem (name Порох))
  (elem (name Металлические))
=>
  (assert (appendmessage  "Порох + Металлические = Пуля;  "))
  (assert (elem (name Пуля)))
)

(defrule Rule65 ""
  (declare (salience 20))
  (elem (name Песок))
  (elem (name Растение))
=>
  (assert (appendmessage  "Песок + Растение = Кактус;  "))
  (assert (elem (name Кактус)))
)

(defrule Rule66 ""
  (declare (salience 20))
  (elem (name Песок))
  (elem (name Грязь))
=>
  (assert (appendmessage  "Песок + Грязь = Глина;  "))
  (assert (elem (name Глина)))
)

(defrule Rule67 ""
  (declare (salience 20))
  (elem (name Песок))
  (elem (name Песок))
=>
  (assert (appendmessage  "Песок + Песок = Пустыня;  "))
  (assert (elem (name Пустыня)))
)

(defrule Rule68 ""
  (declare (salience 20))
  (elem (name Песок))
  (elem (name Кактус))
=>
  (assert (appendmessage  "Песок + Кактус = Пустыня;  "))
  (assert (elem (name Пустыня)))
)

(defrule Rule69 ""
  (declare (salience 20))
  (elem (name Туман))
  (elem (name Трава))
=>
  (assert (appendmessage  "Туман + Трава = Роса;  "))
  (assert (elem (name Роса)))
)

(defrule Rule70 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Трава))
=>
  (assert (appendmessage  "Вода + Трава = Роса;  "))
  (assert (elem (name Роса)))
)

(defrule Rule71 ""
  (declare (salience 20))
  (elem (name Уголь))
  (elem (name Давление))
=>
  (assert (appendmessage  "Уголь + Давление = Алмаз;  "))
  (assert (elem (name Алмаз)))
)

(defrule Rule72 ""
  (declare (salience 20))
  (elem (name Песок))
  (elem (name Ветер))
=>
  (assert (appendmessage  "Песок + Ветер = Дюны;  "))
  (assert (elem (name Дюны)))
)

(defrule Rule73 ""
  (declare (salience 20))
  (elem (name Пляж))
  (elem (name Ветер))
=>
  (assert (appendmessage  "Пляж + Ветер = Дюны;  "))
  (assert (elem (name Дюны)))
)

(defrule Rule74 ""
  (declare (salience 20))
  (elem (name Пустыня))
  (elem (name Ветер))
=>
  (assert (appendmessage  "Пустыня + Ветер = Дюны;  "))
  (assert (elem (name Дюны)))
)

(defrule Rule75 ""
  (declare (salience 20))
  (elem (name Металлические))
  (elem (name Энергия))
=>
  (assert (appendmessage  "Металлические + Энергия = Электричество;  "))
  (assert (elem (name Электричество)))
)

(defrule Rule76 ""
  (declare (salience 20))
  (elem (name Взрыв))
  (elem (name Небо))
=>
  (assert (appendmessage  "Взрыв + Небо = Фейерверк;  "))
  (assert (elem (name Фейерверк)))
)

(defrule Rule77 ""
  (declare (salience 20))
  (elem (name Растение))
  (elem (name Сад))
=>
  (assert (appendmessage  "Растение + Сад = Цветок;  "))
  (assert (elem (name Цветок)))
)

(defrule Rule78 ""
  (declare (salience 20))
  (elem (name Огонь))
  (elem (name Песок))
=>
  (assert (appendmessage  "Огонь + Песок = Стекло;  "))
  (assert (elem (name Стекло)))
)

(defrule Rule79 ""
  (declare (salience 20))
  (elem (name Взрыв))
  (elem (name Металлические))
=>
  (assert (appendmessage  "Взрыв + Металлические = Граната;  "))
  (assert (elem (name Граната)))
)

(defrule Rule80 ""
  (declare (salience 20))
  (elem (name Земля))
  (elem (name Небо))
=>
  (assert (appendmessage  "Земля + Небо = Горизонт;  "))
  (assert (elem (name Горизонт)))
)

(defrule Rule81 ""
  (declare (salience 20))
  (elem (name Море))
  (elem (name Небо))
=>
  (assert (appendmessage  "Море + Небо = Горизонт;  "))
  (assert (elem (name Горизонт)))
)

(defrule Rule82 ""
  (declare (salience 20))
  (elem (name Океан))
  (elem (name Небо))
=>
  (assert (appendmessage  "Океан + Небо = Горизонт;  "))
  (assert (elem (name Горизонт)))
)

(defrule Rule83 ""
  (declare (salience 20))
  (elem (name Стена))
  (elem (name Стена))
=>
  (assert (appendmessage  "Стена + Стена = Дом;  "))
  (assert (elem (name Дом)))
)

(defrule Rule84 ""
  (declare (salience 20))
  (elem (name Растение))
  (elem (name Стена))
=>
  (assert (appendmessage  "Растение + Стена = Айви;  "))
  (assert (elem (name Айви)))
)

(defrule Rule85 ""
  (declare (salience 20))
  (elem (name Болото))
  (elem (name Энергия))
=>
  (assert (appendmessage  "Болото + Энергия = Жизнь;  "))
  (assert (elem (name Жизнь)))
)

(defrule Rule86 ""
  (declare (salience 20))
  (elem (name Камень))
  (elem (name Небо))
=>
  (assert (appendmessage  "Камень + Небо = Луна;  "))
  (assert (elem (name Луна)))
)

(defrule Rule87 ""
  (declare (salience 20))
  (elem (name Гора))
  (elem (name Гора))
=>
  (assert (appendmessage  "Гора + Гора = Горный хребет;  "))
  (assert (elem (name Горный хребет)))
)

(defrule Rule88 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Сад))
=>
  (assert (appendmessage  "Вода + Сад = Пруд;  "))
  (assert (elem (name Пруд)))
)

(defrule Rule89 ""
  (declare (salience 20))
  (elem (name Песок))
  (elem (name Болото))
=>
  (assert (appendmessage  "Песок + Болото = Зыбучие пески;  "))
  (assert (elem (name Зыбучие пески)))
)

(defrule Rule90 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Гора))
=>
  (assert (appendmessage  "Вода + Гора = Река;  "))
  (assert (elem (name Река)))
)

(defrule Rule91 ""
  (declare (salience 20))
  (elem (name Металлические))
  (elem (name Воздух))
=>
  (assert (appendmessage  "Металлические + Воздух = Ржавчина;  "))
  (assert (elem (name Ржавчина)))
)

(defrule Rule92 ""
  (declare (salience 20))
  (elem (name Камень))
  (elem (name Песок))
=>
  (assert (appendmessage  "Камень + Песок = Песчаник;  "))
  (assert (elem (name Песчаник)))
)

(defrule Rule93 ""
  (declare (salience 20))
  (elem (name Песок))
  (elem (name Шторм))
=>
  (assert (appendmessage  "Песок + Шторм = Песчаная буря;  "))
  (assert (elem (name Песчаная буря)))
)

(defrule Rule94 ""
  (declare (salience 20))
  (elem (name Воздух))
  (elem (name Волна))
=>
  (assert (appendmessage  "Воздух + Волна = Звук;  "))
  (assert (elem (name Звук)))
)

(defrule Rule95 ""
  (declare (salience 20))
  (elem (name Металлические))
  (elem (name Уголь))
=>
  (assert (appendmessage  "Металлические + Уголь = Сталь;  "))
  (assert (elem (name Сталь)))
)

(defrule Rule96 ""
  (declare (salience 20))
  (elem (name Огонь))
  (elem (name Небо))
=>
  (assert (appendmessage  "Огонь + Небо = Солнце;  "))
  (assert (elem (name Солнце)))
)

(defrule Rule97 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Стекло))
=>
  (assert (appendmessage  "Вода + Стекло = Аквариум;  "))
  (assert (elem (name Аквариум)))
)

(defrule Rule98 ""
  (declare (salience 20))
  (elem (name Болото))
  (elem (name Жизнь))
=>
  (assert (appendmessage  "Болото + Жизнь = Бактерии;  "))
  (assert (elem (name Бактерии)))
)

(defrule Rule99 ""
  (declare (salience 20))
  (elem (name Жизнь))
  (elem (name Небо))
=>
  (assert (appendmessage  "Жизнь + Небо = Птица;  "))
  (assert (elem (name Птица)))
)

(defrule Rule100 ""
  (declare (salience 20))
  (elem (name Стекло))
  (elem (name Лезвие))
=>
  (assert (appendmessage  "Стекло + Лезвие = Блендер;  "))
  (assert (elem (name Блендер)))
)

(defrule Rule101 ""
  (declare (salience 20))
  (elem (name Река))
  (elem (name Металлические))
=>
  (assert (appendmessage  "Река + Металлические = Мост;  "))
  (assert (elem (name Мост)))
)

(defrule Rule102 ""
  (declare (salience 20))
  (elem (name Стена))
  (elem (name Река))
=>
  (assert (appendmessage  "Стена + Река = Дам;  "))
  (assert (elem (name Дам)))
)

(defrule Rule103 ""
  (declare (salience 20))
  (elem (name Небо))
  (elem (name Солнце))
=>
  (assert (appendmessage  "Небо + Солнце = День;  "))
  (assert (elem (name День)))
)

(defrule Rule104 ""
  (declare (salience 20))
  (elem (name Солнце))
  (elem (name Луна))
=>
  (assert (appendmessage  "Солнце + Луна = Затмение;  "))
  (assert (elem (name Затмение)))
)

(defrule Rule105 ""
  (declare (salience 20))
  (elem (name Жизнь))
  (elem (name Камень))
=>
  (assert (appendmessage  "Жизнь + Камень = Яйцо;  "))
  (assert (elem (name Яйцо)))
)

(defrule Rule106 ""
  (declare (salience 20))
  (elem (name Стекло))
  (elem (name Металлические))
=>
  (assert (appendmessage  "Стекло + Металлические = Очки;  "))
  (assert (elem (name Очки)))
)

(defrule Rule107 ""
  (declare (salience 20))
  (elem (name Металлические))
  (elem (name Солнце))
=>
  (assert (appendmessage  "Металлические + Солнце = Золото;  "))
  (assert (elem (name Золото)))
)

(defrule Rule108 ""
  (declare (salience 20))
  (elem (name Глина))
  (elem (name Жизнь))
=>
  (assert (appendmessage  "Глина + Жизнь = Голем;  "))
  (assert (elem (name Голем)))
)

(defrule Rule109 ""
  (declare (salience 20))
  (elem (name Растение))
  (elem (name Стекло))
=>
  (assert (appendmessage  "Растение + Стекло = Теплица;  "))
  (assert (elem (name Теплица)))
)

(defrule Rule110 ""
  (declare (salience 20))
  (elem (name Металлические))
  (elem (name Пуля))
=>
  (assert (appendmessage  "Металлические + Пуля = Пистолет;  "))
  (assert (elem (name Пистолет)))
)

(defrule Rule111 ""
  (declare (salience 20))
  (elem (name Трава))
  (elem (name Солнце))
=>
  (assert (appendmessage  "Трава + Солнце = Хэй;  "))
  (assert (elem (name Хэй)))
)

(defrule Rule112 ""
  (declare (salience 20))
  (elem (name Песок))
  (elem (name Стекло))
=>
  (assert (appendmessage  "Песок + Стекло = Песочные часы;  "))
  (assert (elem (name Песочные часы)))
)

(defrule Rule113 ""
  (declare (salience 20))
  (elem (name Земля))
  (elem (name Жизнь))
=>
  (assert (appendmessage  "Земля + Жизнь = Человек;  "))
  (assert (elem (name Человек)))
)

(defrule Rule114 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Пруд))
=>
  (assert (appendmessage  "Вода + Пруд = Озеро;  "))
  (assert (elem (name Озеро)))
)

(defrule Rule115 ""
  (declare (salience 20))
  (elem (name Электричество))
  (elem (name Стекло))
=>
  (assert (appendmessage  "Электричество + Стекло = Лампочка;  "))
  (assert (elem (name Лампочка)))
)

(defrule Rule116 ""
  (declare (salience 20))
  (elem (name Стекло))
  (elem (name Стена))
=>
  (assert (appendmessage  "Стекло + Стена = Зеркало;  "))
  (assert (elem (name Зеркало)))
)

(defrule Rule117 ""
  (declare (salience 20))
  (elem (name Небо))
  (elem (name Луна))
=>
  (assert (appendmessage  "Небо + Луна = Ночь;  "))
  (assert (elem (name Ночь)))
)

(defrule Rule118 ""
  (declare (salience 20))
  (elem (name Пустыня))
  (elem (name Вода))
=>
  (assert (appendmessage  "Пустыня + Вода = Оазис;  "))
  (assert (elem (name Оазис)))
)

(defrule Rule119 ""
  (declare (salience 20))
  (elem (name Растение))
  (elem (name Солнце))
=>
  (assert (appendmessage  "Растение + Солнце = Кислород;  "))
  (assert (elem (name Кислород)))
)

(defrule Rule120 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Цветок))
=>
  (assert (appendmessage  "Вода + Цветок = Духи;  "))
  (assert (elem (name Духи)))
)

(defrule Rule121 ""
  (declare (salience 20))
  (elem (name Вода))
  (elem (name Жизнь))
=>
  (assert (appendmessage  "Вода + Жизнь = Планктон;  "))
  (assert (elem (name Планктон)))
)

(defrule Rule122 ""
  (declare (salience 20))
  (elem (name Огонь))
  (elem (name Глина))
=>
  (assert (appendmessage  "Огонь + Глина = Керамика;  "))
  (assert (elem (name Керамика)))
)

(defrule Rule123 ""
  (declare (salience 20))
  (elem (name Пустыня))
  (elem (name Камень))
=>
  (assert (appendmessage  "Пустыня + Камень = Пирамида;  "))
  (assert (elem (name Пирамида)))
)

(defrule Rule124 ""
  (declare (salience 20))
  (elem (name Дождь))
  (elem (name Солнце))
=>
  (assert (appendmessage  "Дождь + Солнце = Радуга;  "))
  (assert (elem (name Радуга)))
)

(defrule Rule125 ""
  (declare (salience 20))
  (elem (name Алмаз))
  (elem (name Металлические))
=>
  (assert (appendmessage  "Алмаз + Металлические = Кольцо;  "))
  (assert (elem (name Кольцо)))
)

(defrule Rule126 ""
  (declare (salience 20))
  (elem (name Металлические))
  (elem (name Жизнь))
=>
  (assert (appendmessage  "Металлические + Жизнь = Робот;  "))
  (assert (elem (name Робот)))
)

(defrule Rule127 ""
  (declare (salience 20))
  (elem (name Лезвие))
  (elem (name Лезвие))
=>
  (assert (appendmessage  "Лезвие + Лезвие = Ножницы;  "))
  (assert (elem (name Ножницы)))
)

(defrule Rule128 ""
  (declare (salience 20))
  (elem (name Лезвие))
  (elem (name Трава))
=>
  (assert (appendmessage  "Лезвие + Трава = Коса;  "))
  (assert (elem (name Коса)))
)

(defrule Rule129 ""
  (declare (salience 20))
  (elem (name Дом))
  (elem (name Небо))
=>
  (assert (appendmessage  "Дом + Небо = Небоскреб;  "))
  (assert (elem (name Небоскреб)))
)

(defrule Rule130 ""
  (declare (salience 20))
  (elem (name Солнце))
  (elem (name Растение))
=>
  (assert (appendmessage  "Солнце + Растение = Подсолнух;  "))
  (assert (elem (name Подсолнух)))
)

(defrule Rule131 ""
  (declare (salience 20))
  (elem (name Лезвие))
  (elem (name Металлические))
=>
  (assert (appendmessage  "Лезвие + Металлические = Меч;  "))
  (assert (elem (name Меч)))
)

(defrule Rule132 ""
  (declare (salience 20))
  (elem (name Стекло))
  (elem (name Небо))
=>
  (assert (appendmessage  "Стекло + Небо = Телескоп;  "))
  (assert (elem (name Телескоп)))
)

(defrule Rule133 ""
  (declare (salience 20))
  (elem (name Луна))
  (elem (name Море))
=>
  (assert (appendmessage  "Луна + Море = Прилив;  "))
  (assert (elem (name Прилив)))
)

(defrule Rule134 ""
  (declare (salience 20))
  (elem (name Луна))
  (elem (name Океан))
=>
  (assert (appendmessage  "Луна + Океан = Прилив;  "))
  (assert (elem (name Прилив)))
)

(defrule Rule135 ""
  (declare (salience 20))
  (elem (name Песок))
  (elem (name Стекло))
=>
  (assert (appendmessage  "Песок + Стекло = Время;  "))
  (assert (elem (name Время)))
)

(defrule Rule136 ""
  (declare (salience 20))
  (elem (name Дом))
  (elem (name Дом))
=>
  (assert (appendmessage  "Дом + Дом = Деревня;  "))
  (assert (elem (name Деревня)))
)

(defrule Rule137 ""
  (declare (salience 20))
  (elem (name Цветок))
  (elem (name Пруд))
=>
  (assert (appendmessage  "Цветок + Пруд = Водяная лилия;  "))
  (assert (elem (name Водяная лилия)))
)

(defrule Rule138 ""
  (declare (salience 20))
  (elem (name Гора))
  (elem (name Река))
=>
  (assert (appendmessage  "Гора + Река = Водопад;  "))
  (assert (elem (name Водопад)))
)

(defrule Rule139 ""
  (declare (salience 20))
  (elem (name Дом))
  (elem (name Ветер))
=>
  (assert (appendmessage  "Дом + Ветер = Ветреная мельница;  "))
  (assert (elem (name Ветреная мельница)))
)

(defrule Rule140 ""
  (declare (salience 20))
  (elem (name Стекло))
  (elem (name Дом))
=>
  (assert (appendmessage  "Стекло + Дом = Окно;  "))
  (assert (elem (name Окно)))
)

(defrule Rule141 ""
  (declare (salience 20))
  (elem (name Электричество))
  (elem (name Металлические))
=>
  (assert (appendmessage  "Электричество + Металлические = Проволока;  "))
  (assert (elem (name Проволока)))
)

