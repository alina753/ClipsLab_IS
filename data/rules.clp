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
  (slot CF (type FLOAT) (range -1.0 +1.0))
)


(defrule offerChoice
  (declare (salience 1))
  (elem (name ?n) (CF ?cf))
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
  (elem (name Земля) (CF ?c1))
  (elem (name Воздух) (CF ?c2))
=>
  (assert (appendmessage "Земля + Воздух = Пыль;  "))
  (assert (elem (name Пыль) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule2 ""
  (declare (salience 20))
  (elem (name Огонь) (CF ?c1))
  (elem (name Воздух) (CF ?c2))
=>
  (assert (appendmessage "Огонь + Воздух = Энергия;  "))
  (assert (elem (name Энергия) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule3 ""
  (declare (salience 20))
  (elem (name Земля) (CF ?c1))
  (elem (name Огонь) (CF ?c2))
=>
  (assert (appendmessage "Земля + Огонь = Лава;  "))
  (assert (elem (name Лава) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule4 ""
  (declare (salience 20))
  (elem (name Вода) (CF ?c1))
  (elem (name Земля) (CF ?c2))
=>
  (assert (appendmessage "Вода + Земля = Грязь;  "))
  (assert (elem (name Грязь) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule5 ""
  (declare (salience 20))
  (elem (name Земля) (CF ?c1))
  (elem (name Земля) (CF ?c2))
=>
  (assert (appendmessage "Земля + Земля = Давление;  "))
  (assert (elem (name Давление) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule6 ""
  (declare (salience 20))
  (elem (name Воздух) (CF ?c1))
  (elem (name Воздух) (CF ?c2))
=>
  (assert (appendmessage "Воздух + Воздух = Давление;  "))
  (assert (elem (name Давление) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule7 ""
  (declare (salience 20))
  (elem (name Вода) (CF ?c1))
  (elem (name Воздух) (CF ?c2))
=>
  (assert (appendmessage "Вода + Воздух = Дождь;  "))
  (assert (elem (name Дождь) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule8 ""
  (declare (salience 20))
  (elem (name Вода) (CF ?c1))
  (elem (name Вода) (CF ?c2))
=>
  (assert (appendmessage "Вода + Вода = Море;  "))
  (assert (elem (name Море) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule9 ""
  (declare (salience 20))
  (elem (name Вода) (CF ?c1))
  (elem (name Огонь) (CF ?c2))
=>
  (assert (appendmessage "Вода + Огонь = Пар;  "))
  (assert (elem (name Пар) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule10 ""
  (declare (salience 20))
  (elem (name Вода) (CF ?c1))
  (elem (name Энергия) (CF ?c2))
=>
  (assert (appendmessage "Вода + Энергия = Пар;  "))
  (assert (elem (name Пар) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule11 ""
  (declare (salience 20))
  (elem (name Воздух) (CF ?c1))
  (elem (name Давление) (CF ?c2))
=>
  (assert (appendmessage "Воздух + Давление = Атмосфера;  "))
  (assert (elem (name Атмосфера) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule12 ""
  (declare (salience 20))
  (elem (name Грязь) (CF ?c1))
  (elem (name Огонь) (CF ?c2))
=>
  (assert (appendmessage "Грязь + Огонь = Кирпич;  "))
  (assert (elem (name Кирпич) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule13 ""
  (declare (salience 20))
  (elem (name Воздух) (CF ?c1))
  (elem (name Пар) (CF ?c2))
=>
  (assert (appendmessage "Воздух + Пар = Облако;  "))
  (assert (elem (name Облако) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule14 ""
  (declare (salience 20))
  (elem (name Земля) (CF ?c1))
  (elem (name Энергия) (CF ?c2))
=>
  (assert (appendmessage "Земля + Энергия = Землетрясение;  "))
  (assert (elem (name Землетрясение) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule15 ""
  (declare (salience 20))
  (elem (name Дождь) (CF ?c1))
  (elem (name Дождь) (CF ?c2))
=>
  (assert (appendmessage "Дождь + Дождь = Наводнение;  "))
  (assert (elem (name Наводнение) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule16 ""
  (declare (salience 20))
  (elem (name Пар) (CF ?c1))
  (elem (name Земля) (CF ?c2))
=>
  (assert (appendmessage "Пар + Земля = Гейзер;  "))
  (assert (elem (name Гейзер) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule17 ""
  (declare (salience 20))
  (elem (name Лава) (CF ?c1))
  (elem (name Давление) (CF ?c2))
=>
  (assert (appendmessage "Лава + Давление = Гранит;  "))
  (assert (elem (name Гранит) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule18 ""
  (declare (salience 20))
  (elem (name Огонь) (CF ?c1))
  (elem (name Пыль) (CF ?c2))
=>
  (assert (appendmessage "Огонь + Пыль = Порох;  "))
  (assert (elem (name Порох) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule19 ""
  (declare (salience 20))
  (elem (name Лава) (CF ?c1))
  (elem (name Вода) (CF ?c2))
=>
  (assert (appendmessage "Лава + Вода = Обсидиан;  "))
  (assert (elem (name Обсидиан) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule20 ""
  (declare (salience 20))
  (elem (name Вода) (CF ?c1))
  (elem (name Море) (CF ?c2))
=>
  (assert (appendmessage "Вода + Море = Океан;  "))
  (assert (elem (name Океан) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule21 ""
  (declare (salience 20))
  (elem (name Земля) (CF ?c1))
  (elem (name Дождь) (CF ?c2))
=>
  (assert (appendmessage "Земля + Дождь = Растение;  "))
  (assert (elem (name Растение) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule22 ""
  (declare (salience 20))
  (elem (name Море) (CF ?c1))
  (elem (name Огонь) (CF ?c2))
=>
  (assert (appendmessage "Море + Огонь = Соль;  "))
  (assert (elem (name Соль) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule23 ""
  (declare (salience 20))
  (elem (name Океан) (CF ?c1))
  (elem (name Огонь) (CF ?c2))
=>
  (assert (appendmessage "Океан + Огонь = Соль;  "))
  (assert (elem (name Соль) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule24 ""
  (declare (salience 20))
  (elem (name Воздух) (CF ?c1))
  (elem (name Лава) (CF ?c2))
=>
  (assert (appendmessage "Воздух + Лава = Камень;  "))
  (assert (elem (name Камень) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule25 ""
  (declare (salience 20))
  (elem (name Земля) (CF ?c1))
  (elem (name Лава) (CF ?c2))
=>
  (assert (appendmessage "Земля + Лава = Вулкан;  "))
  (assert (elem (name Вулкан) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule26 ""
  (declare (salience 20))
  (elem (name Воздух) (CF ?c1))
  (elem (name Давление) (CF ?c2))
=>
  (assert (appendmessage "Воздух + Давление = Ветер;  "))
  (assert (elem (name Ветер) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule27 ""
  (declare (salience 20))
  (elem (name Воздух) (CF ?c1))
  (elem (name Энергия) (CF ?c2))
=>
  (assert (appendmessage "Воздух + Энергия = Ветер;  "))
  (assert (elem (name Ветер) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule28 ""
  (declare (salience 20))
  (elem (name Вода) (CF ?c1))
  (elem (name Растение) (CF ?c2))
=>
  (assert (appendmessage "Вода + Растение = Водоросли;  "))
  (assert (elem (name Водоросли) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule29 ""
  (declare (salience 20))
  (elem (name Океан) (CF ?c1))
  (elem (name Растение) (CF ?c2))
=>
  (assert (appendmessage "Океан + Растение = Водоросли;  "))
  (assert (elem (name Водоросли) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule30 ""
  (declare (salience 20))
  (elem (name Море) (CF ?c1))
  (elem (name Растение) (CF ?c2))
=>
  (assert (appendmessage "Море + Растение = Водоросли;  "))
  (assert (elem (name Водоросли) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule31 ""
  (declare (salience 20))
  (elem (name Вулкан) (CF ?c1))
  (elem (name Энергия) (CF ?c2))
=>
  (assert (appendmessage "Вулкан + Энергия = Пепел;  "))
  (assert (elem (name Пепел) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule32 ""
  (declare (salience 20))
  (elem (name Давление) (CF ?c1))
  (elem (name Растение) (CF ?c2))
=>
  (assert (appendmessage "Давление + Растение = Уголь;  "))
  (assert (elem (name Уголь) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule33 ""
  (declare (salience 20))
  (elem (name Растение) (CF ?c1))
  (elem (name Облако) (CF ?c2))
=>
  (assert (appendmessage "Растение + Облако = Хлопок;  "))
  (assert (elem (name Хлопок) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule34 ""
  (declare (salience 20))
  (elem (name Вулкан) (CF ?c1))
  (elem (name Энергия) (CF ?c2))
=>
  (assert (appendmessage "Вулкан + Энергия = Извержение;  "))
  (assert (elem (name Извержение) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule35 ""
  (declare (salience 20))
  (elem (name Огонь) (CF ?c1))
  (elem (name Порох) (CF ?c2))
=>
  (assert (appendmessage "Огонь + Порох = Взрыв;  "))
  (assert (elem (name Взрыв) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule36 ""
  (declare (salience 20))
  (elem (name Земля) (CF ?c1))
  (elem (name Облако) (CF ?c2))
=>
  (assert (appendmessage "Земля + Облако = Туман;  "))
  (assert (elem (name Туман) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule37 ""
  (declare (salience 20))
  (elem (name Растение) (CF ?c1))
  (elem (name Растение) (CF ?c2))
=>
  (assert (appendmessage "Растение + Растение = Сад;  "))
  (assert (elem (name Сад) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule38 ""
  (declare (salience 20))
  (elem (name Земля) (CF ?c1))
  (elem (name Растение) (CF ?c2))
=>
  (assert (appendmessage "Земля + Растение = Трава;  "))
  (assert (elem (name Трава) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule39 ""
  (declare (salience 20))
  (elem (name Ветер) (CF ?c1))
  (elem (name Энергия) (CF ?c2))
=>
  (assert (appendmessage "Ветер + Энергия = Ураган;  "))
  (assert (elem (name Ураган) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule40 ""
  (declare (salience 20))
  (elem (name Море) (CF ?c1))
  (elem (name Вулкан) (CF ?c2))
=>
  (assert (appendmessage "Море + Вулкан = Остров;  "))
  (assert (elem (name Остров) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule41 ""
  (declare (salience 20))
  (elem (name Океан) (CF ?c1))
  (elem (name Вулкан) (CF ?c2))
=>
  (assert (appendmessage "Океан + Вулкан = Остров;  "))
  (assert (elem (name Остров) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule42 ""
  (declare (salience 20))
  (elem (name Земля) (CF ?c1))
  (elem (name Камень) (CF ?c2))
=>
  (assert (appendmessage "Земля + Камень = Металлические;  "))
  (assert (elem (name Металлические) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule43 ""
  (declare (salience 20))
  (elem (name Камень) (CF ?c1))
  (elem (name Растение) (CF ?c2))
=>
  (assert (appendmessage "Камень + Растение = Мосс;  "))
  (assert (elem (name Мосс) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule44 ""
  (declare (salience 20))
  (elem (name Камень) (CF ?c1))
  (elem (name Водоросли) (CF ?c2))
=>
  (assert (appendmessage "Камень + Водоросли = Мосс;  "))
  (assert (elem (name Мосс) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule45 ""
  (declare (salience 20))
  (elem (name Землетрясение) (CF ?c1))
  (elem (name Земля) (CF ?c2))
=>
  (assert (appendmessage "Землетрясение + Земля = Гора;  "))
  (assert (elem (name Гора) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule46 ""
  (declare (salience 20))
  (elem (name Камень) (CF ?c1))
  (elem (name Воздух) (CF ?c2))
=>
  (assert (appendmessage "Камень + Воздух = Песок;  "))
  (assert (elem (name Песок) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule47 ""
  (declare (salience 20))
  (elem (name Камень) (CF ?c1))
  (elem (name Ветер) (CF ?c2))
=>
  (assert (appendmessage "Камень + Ветер = Песок;  "))
  (assert (elem (name Песок) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule48 ""
  (declare (salience 20))
  (elem (name Воздух) (CF ?c1))
  (elem (name Облако) (CF ?c2))
=>
  (assert (appendmessage "Воздух + Облако = Небо;  "))
  (assert (elem (name Небо) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule49 ""
  (declare (salience 20))
  (elem (name Облако) (CF ?c1))
  (elem (name Энергия) (CF ?c2))
=>
  (assert (appendmessage "Облако + Энергия = Шторм;  "))
  (assert (elem (name Шторм) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule50 ""
  (declare (salience 20))
  (elem (name Грязь) (CF ?c1))
  (elem (name Растение) (CF ?c2))
=>
  (assert (appendmessage "Грязь + Растение = Болото;  "))
  (assert (elem (name Болото) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule51 ""
  (declare (salience 20))
  (elem (name Грязь) (CF ?c1))
  (elem (name Трава) (CF ?c2))
=>
  (assert (appendmessage "Грязь + Трава = Болото;  "))
  (assert (elem (name Болото) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule52 ""
  (declare (salience 20))
  (elem (name Растение) (CF ?c1))
  (elem (name Землетрясение) (CF ?c2))
=>
  (assert (appendmessage "Растение + Землетрясение = Табак;  "))
  (assert (elem (name Табак) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule53 ""
  (declare (salience 20))
  (elem (name Море) (CF ?c1))
  (elem (name Землетрясение) (CF ?c2))
=>
  (assert (appendmessage "Море + Землетрясение = Цунами;  "))
  (assert (elem (name Цунами) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule54 ""
  (declare (salience 20))
  (elem (name Кирпич) (CF ?c1))
  (elem (name Кирпич) (CF ?c2))
=>
  (assert (appendmessage "Кирпич + Кирпич = Стена;  "))
  (assert (elem (name Стена) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule55 ""
  (declare (salience 20))
  (elem (name Море) (CF ?c1))
  (elem (name Ветер) (CF ?c2))
=>
  (assert (appendmessage "Море + Ветер = Волна;  "))
  (assert (elem (name Волна) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule56 ""
  (declare (salience 20))
  (elem (name Океан) (CF ?c1))
  (elem (name Ветер) (CF ?c2))
=>
  (assert (appendmessage "Океан + Ветер = Волна;  "))
  (assert (elem (name Волна) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule57 ""
  (declare (salience 20))
  (elem (name Остров) (CF ?c1))
  (elem (name Остров) (CF ?c2))
=>
  (assert (appendmessage "Остров + Остров = Архипелаг;  "))
  (assert (elem (name Архипелаг) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule58 ""
  (declare (salience 20))
  (elem (name Энергия) (CF ?c1))
  (elem (name Взрыв) (CF ?c2))
=>
  (assert (appendmessage "Энергия + Взрыв = Атомная бомба;  "))
  (assert (elem (name Атомная бомба) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule59 ""
  (declare (salience 20))
  (elem (name Вода) (CF ?c1))
  (elem (name Песок) (CF ?c2))
=>
  (assert (appendmessage "Вода + Песок = Пляж;  "))
  (assert (elem (name Пляж) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule60 ""
  (declare (salience 20))
  (elem (name Море) (CF ?c1))
  (elem (name Песок) (CF ?c2))
=>
  (assert (appendmessage "Море + Песок = Пляж;  "))
  (assert (elem (name Пляж) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule61 ""
  (declare (salience 20))
  (elem (name Океан) (CF ?c1))
  (elem (name Песок) (CF ?c2))
=>
  (assert (appendmessage "Океан + Песок = Пляж;  "))
  (assert (elem (name Пляж) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule62 ""
  (declare (salience 20))
  (elem (name Металлические) (CF ?c1))
  (elem (name Камень) (CF ?c2))
=>
  (assert (appendmessage "Металлические + Камень = Лезвие;  "))
  (assert (elem (name Лезвие) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule63 ""
  (declare (salience 20))
  (elem (name Пар) (CF ?c1))
  (elem (name Металлические) (CF ?c2))
=>
  (assert (appendmessage "Пар + Металлические = Котел;  "))
  (assert (elem (name Котел) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule64 ""
  (declare (salience 20))
  (elem (name Порох) (CF ?c1))
  (elem (name Металлические) (CF ?c2))
=>
  (assert (appendmessage "Порох + Металлические = Пуля;  "))
  (assert (elem (name Пуля) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule65 ""
  (declare (salience 20))
  (elem (name Песок) (CF ?c1))
  (elem (name Растение) (CF ?c2))
=>
  (assert (appendmessage "Песок + Растение = Кактус;  "))
  (assert (elem (name Кактус) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule66 ""
  (declare (salience 20))
  (elem (name Песок) (CF ?c1))
  (elem (name Грязь) (CF ?c2))
=>
  (assert (appendmessage "Песок + Грязь = Глина;  "))
  (assert (elem (name Глина) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule67 ""
  (declare (salience 20))
  (elem (name Песок) (CF ?c1))
  (elem (name Песок) (CF ?c2))
=>
  (assert (appendmessage "Песок + Песок = Пустыня;  "))
  (assert (elem (name Пустыня) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule68 ""
  (declare (salience 20))
  (elem (name Песок) (CF ?c1))
  (elem (name Кактус) (CF ?c2))
=>
  (assert (appendmessage "Песок + Кактус = Пустыня;  "))
  (assert (elem (name Пустыня) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule69 ""
  (declare (salience 20))
  (elem (name Туман) (CF ?c1))
  (elem (name Трава) (CF ?c2))
=>
  (assert (appendmessage "Туман + Трава = Роса;  "))
  (assert (elem (name Роса) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule70 ""
  (declare (salience 20))
  (elem (name Вода) (CF ?c1))
  (elem (name Трава) (CF ?c2))
=>
  (assert (appendmessage "Вода + Трава = Роса;  "))
  (assert (elem (name Роса) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule71 ""
  (declare (salience 20))
  (elem (name Уголь) (CF ?c1))
  (elem (name Давление) (CF ?c2))
=>
  (assert (appendmessage "Уголь + Давление = Алмаз;  "))
  (assert (elem (name Алмаз) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule72 ""
  (declare (salience 20))
  (elem (name Песок) (CF ?c1))
  (elem (name Ветер) (CF ?c2))
=>
  (assert (appendmessage "Песок + Ветер = Дюны;  "))
  (assert (elem (name Дюны) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule73 ""
  (declare (salience 20))
  (elem (name Пляж) (CF ?c1))
  (elem (name Ветер) (CF ?c2))
=>
  (assert (appendmessage "Пляж + Ветер = Дюны;  "))
  (assert (elem (name Дюны) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule74 ""
  (declare (salience 20))
  (elem (name Пустыня) (CF ?c1))
  (elem (name Ветер) (CF ?c2))
=>
  (assert (appendmessage "Пустыня + Ветер = Дюны;  "))
  (assert (elem (name Дюны) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule75 ""
  (declare (salience 20))
  (elem (name Металлические) (CF ?c1))
  (elem (name Энергия) (CF ?c2))
=>
  (assert (appendmessage "Металлические + Энергия = Электричество;  "))
  (assert (elem (name Электричество) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule76 ""
  (declare (salience 20))
  (elem (name Взрыв) (CF ?c1))
  (elem (name Небо) (CF ?c2))
=>
  (assert (appendmessage "Взрыв + Небо = Фейерверк;  "))
  (assert (elem (name Фейерверк) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule77 ""
  (declare (salience 20))
  (elem (name Растение) (CF ?c1))
  (elem (name Сад) (CF ?c2))
=>
  (assert (appendmessage "Растение + Сад = Цветок;  "))
  (assert (elem (name Цветок) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule78 ""
  (declare (salience 20))
  (elem (name Огонь) (CF ?c1))
  (elem (name Песок) (CF ?c2))
=>
  (assert (appendmessage "Огонь + Песок = Стекло;  "))
  (assert (elem (name Стекло) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule79 ""
  (declare (salience 20))
  (elem (name Взрыв) (CF ?c1))
  (elem (name Металлические) (CF ?c2))
=>
  (assert (appendmessage "Взрыв + Металлические = Граната;  "))
  (assert (elem (name Граната) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule80 ""
  (declare (salience 20))
  (elem (name Земля) (CF ?c1))
  (elem (name Небо) (CF ?c2))
=>
  (assert (appendmessage "Земля + Небо = Горизонт;  "))
  (assert (elem (name Горизонт) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule81 ""
  (declare (salience 20))
  (elem (name Море) (CF ?c1))
  (elem (name Небо) (CF ?c2))
=>
  (assert (appendmessage "Море + Небо = Горизонт;  "))
  (assert (elem (name Горизонт) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule82 ""
  (declare (salience 20))
  (elem (name Океан) (CF ?c1))
  (elem (name Небо) (CF ?c2))
=>
  (assert (appendmessage "Океан + Небо = Горизонт;  "))
  (assert (elem (name Горизонт) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule83 ""
  (declare (salience 20))
  (elem (name Стена) (CF ?c1))
  (elem (name Стена) (CF ?c2))
=>
  (assert (appendmessage "Стена + Стена = Дом;  "))
  (assert (elem (name Дом) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule84 ""
  (declare (salience 20))
  (elem (name Растение) (CF ?c1))
  (elem (name Стена) (CF ?c2))
=>
  (assert (appendmessage "Растение + Стена = Айви;  "))
  (assert (elem (name Айви) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule85 ""
  (declare (salience 20))
  (elem (name Болото) (CF ?c1))
  (elem (name Энергия) (CF ?c2))
=>
  (assert (appendmessage "Болото + Энергия = Жизнь;  "))
  (assert (elem (name Жизнь) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule86 ""
  (declare (salience 20))
  (elem (name Камень) (CF ?c1))
  (elem (name Небо) (CF ?c2))
=>
  (assert (appendmessage "Камень + Небо = Луна;  "))
  (assert (elem (name Луна) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule87 ""
  (declare (salience 20))
  (elem (name Гора) (CF ?c1))
  (elem (name Гора) (CF ?c2))
=>
  (assert (appendmessage "Гора + Гора = Горный хребет;  "))
  (assert (elem (name Горный хребет) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule88 ""
  (declare (salience 20))
  (elem (name Вода) (CF ?c1))
  (elem (name Сад) (CF ?c2))
=>
  (assert (appendmessage "Вода + Сад = Пруд;  "))
  (assert (elem (name Пруд) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule89 ""
  (declare (salience 20))
  (elem (name Песок) (CF ?c1))
  (elem (name Болото) (CF ?c2))
=>
  (assert (appendmessage "Песок + Болото = Зыбучие пески;  "))
  (assert (elem (name Зыбучие пески) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule90 ""
  (declare (salience 20))
  (elem (name Вода) (CF ?c1))
  (elem (name Гора) (CF ?c2))
=>
  (assert (appendmessage "Вода + Гора = Река;  "))
  (assert (elem (name Река) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule91 ""
  (declare (salience 20))
  (elem (name Металлические) (CF ?c1))
  (elem (name Воздух) (CF ?c2))
=>
  (assert (appendmessage "Металлические + Воздух = Ржавчина;  "))
  (assert (elem (name Ржавчина) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule92 ""
  (declare (salience 20))
  (elem (name Камень) (CF ?c1))
  (elem (name Песок) (CF ?c2))
=>
  (assert (appendmessage "Камень + Песок = Песчаник;  "))
  (assert (elem (name Песчаник) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule93 ""
  (declare (salience 20))
  (elem (name Песок) (CF ?c1))
  (elem (name Шторм) (CF ?c2))
=>
  (assert (appendmessage "Песок + Шторм = Песчаная буря;  "))
  (assert (elem (name Песчаная буря) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule94 ""
  (declare (salience 20))
  (elem (name Воздух) (CF ?c1))
  (elem (name Волна) (CF ?c2))
=>
  (assert (appendmessage "Воздух + Волна = Звук;  "))
  (assert (elem (name Звук) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule95 ""
  (declare (salience 20))
  (elem (name Металлические) (CF ?c1))
  (elem (name Уголь) (CF ?c2))
=>
  (assert (appendmessage "Металлические + Уголь = Сталь;  "))
  (assert (elem (name Сталь) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule96 ""
  (declare (salience 20))
  (elem (name Огонь) (CF ?c1))
  (elem (name Небо) (CF ?c2))
=>
  (assert (appendmessage "Огонь + Небо = Солнце;  "))
  (assert (elem (name Солнце) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule97 ""
  (declare (salience 20))
  (elem (name Вода) (CF ?c1))
  (elem (name Стекло) (CF ?c2))
=>
  (assert (appendmessage "Вода + Стекло = Аквариум;  "))
  (assert (elem (name Аквариум) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule98 ""
  (declare (salience 20))
  (elem (name Болото) (CF ?c1))
  (elem (name Жизнь) (CF ?c2))
=>
  (assert (appendmessage "Болото + Жизнь = Бактерии;  "))
  (assert (elem (name Бактерии) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule99 ""
  (declare (salience 20))
  (elem (name Жизнь) (CF ?c1))
  (elem (name Небо) (CF ?c2))
=>
  (assert (appendmessage "Жизнь + Небо = Птица;  "))
  (assert (elem (name Птица) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule100 ""
  (declare (salience 20))
  (elem (name Стекло) (CF ?c1))
  (elem (name Лезвие) (CF ?c2))
=>
  (assert (appendmessage "Стекло + Лезвие = Блендер;  "))
  (assert (elem (name Блендер) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule101 ""
  (declare (salience 20))
  (elem (name Река) (CF ?c1))
  (elem (name Металлические) (CF ?c2))
=>
  (assert (appendmessage "Река + Металлические = Мост;  "))
  (assert (elem (name Мост) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule102 ""
  (declare (salience 20))
  (elem (name Стена) (CF ?c1))
  (elem (name Река) (CF ?c2))
=>
  (assert (appendmessage "Стена + Река = Дам;  "))
  (assert (elem (name Дам) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule103 ""
  (declare (salience 20))
  (elem (name Небо) (CF ?c1))
  (elem (name Солнце) (CF ?c2))
=>
  (assert (appendmessage "Небо + Солнце = День;  "))
  (assert (elem (name День) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule104 ""
  (declare (salience 20))
  (elem (name Солнце) (CF ?c1))
  (elem (name Луна) (CF ?c2))
=>
  (assert (appendmessage "Солнце + Луна = Затмение;  "))
  (assert (elem (name Затмение) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule105 ""
  (declare (salience 20))
  (elem (name Жизнь) (CF ?c1))
  (elem (name Камень) (CF ?c2))
=>
  (assert (appendmessage "Жизнь + Камень = Яйцо;  "))
  (assert (elem (name Яйцо) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule106 ""
  (declare (salience 20))
  (elem (name Стекло) (CF ?c1))
  (elem (name Металлические) (CF ?c2))
=>
  (assert (appendmessage "Стекло + Металлические = Очки;  "))
  (assert (elem (name Очки) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule107 ""
  (declare (salience 20))
  (elem (name Металлические) (CF ?c1))
  (elem (name Солнце) (CF ?c2))
=>
  (assert (appendmessage "Металлические + Солнце = Золото;  "))
  (assert (elem (name Золото) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule108 ""
  (declare (salience 20))
  (elem (name Глина) (CF ?c1))
  (elem (name Жизнь) (CF ?c2))
=>
  (assert (appendmessage "Глина + Жизнь = Голем;  "))
  (assert (elem (name Голем) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule109 ""
  (declare (salience 20))
  (elem (name Растение) (CF ?c1))
  (elem (name Стекло) (CF ?c2))
=>
  (assert (appendmessage "Растение + Стекло = Теплица;  "))
  (assert (elem (name Теплица) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule110 ""
  (declare (salience 20))
  (elem (name Металлические) (CF ?c1))
  (elem (name Пуля) (CF ?c2))
=>
  (assert (appendmessage "Металлические + Пуля = Пистолет;  "))
  (assert (elem (name Пистолет) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule111 ""
  (declare (salience 20))
  (elem (name Трава) (CF ?c1))
  (elem (name Солнце) (CF ?c2))
=>
  (assert (appendmessage "Трава + Солнце = Хэй;  "))
  (assert (elem (name Хэй) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule112 ""
  (declare (salience 20))
  (elem (name Песок) (CF ?c1))
  (elem (name Стекло) (CF ?c2))
=>
  (assert (appendmessage "Песок + Стекло = Песочные часы;  "))
  (assert (elem (name Песочные часы) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule113 ""
  (declare (salience 20))
  (elem (name Земля) (CF ?c1))
  (elem (name Жизнь) (CF ?c2))
=>
  (assert (appendmessage "Земля + Жизнь = Человек;  "))
  (assert (elem (name Человек) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule114 ""
  (declare (salience 20))
  (elem (name Вода) (CF ?c1))
  (elem (name Пруд) (CF ?c2))
=>
  (assert (appendmessage "Вода + Пруд = Озеро;  "))
  (assert (elem (name Озеро) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule115 ""
  (declare (salience 20))
  (elem (name Электричество) (CF ?c1))
  (elem (name Стекло) (CF ?c2))
=>
  (assert (appendmessage "Электричество + Стекло = Лампочка;  "))
  (assert (elem (name Лампочка) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule116 ""
  (declare (salience 20))
  (elem (name Стекло) (CF ?c1))
  (elem (name Стена) (CF ?c2))
=>
  (assert (appendmessage "Стекло + Стена = Зеркало;  "))
  (assert (elem (name Зеркало) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule117 ""
  (declare (salience 20))
  (elem (name Небо) (CF ?c1))
  (elem (name Луна) (CF ?c2))
=>
  (assert (appendmessage "Небо + Луна = Ночь;  "))
  (assert (elem (name Ночь) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule118 ""
  (declare (salience 20))
  (elem (name Пустыня) (CF ?c1))
  (elem (name Вода) (CF ?c2))
=>
  (assert (appendmessage "Пустыня + Вода = Оазис;  "))
  (assert (elem (name Оазис) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule119 ""
  (declare (salience 20))
  (elem (name Растение) (CF ?c1))
  (elem (name Солнце) (CF ?c2))
=>
  (assert (appendmessage "Растение + Солнце = Кислород;  "))
  (assert (elem (name Кислород) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule120 ""
  (declare (salience 20))
  (elem (name Вода) (CF ?c1))
  (elem (name Цветок) (CF ?c2))
=>
  (assert (appendmessage "Вода + Цветок = Духи;  "))
  (assert (elem (name Духи) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule121 ""
  (declare (salience 20))
  (elem (name Вода) (CF ?c1))
  (elem (name Жизнь) (CF ?c2))
=>
  (assert (appendmessage "Вода + Жизнь = Планктон;  "))
  (assert (elem (name Планктон) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule122 ""
  (declare (salience 20))
  (elem (name Огонь) (CF ?c1))
  (elem (name Глина) (CF ?c2))
=>
  (assert (appendmessage "Огонь + Глина = Керамика;  "))
  (assert (elem (name Керамика) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule123 ""
  (declare (salience 20))
  (elem (name Пустыня) (CF ?c1))
  (elem (name Камень) (CF ?c2))
=>
  (assert (appendmessage "Пустыня + Камень = Пирамида;  "))
  (assert (elem (name Пирамида) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule124 ""
  (declare (salience 20))
  (elem (name Дождь) (CF ?c1))
  (elem (name Солнце) (CF ?c2))
=>
  (assert (appendmessage "Дождь + Солнце = Радуга;  "))
  (assert (elem (name Радуга) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule125 ""
  (declare (salience 20))
  (elem (name Алмаз) (CF ?c1))
  (elem (name Металлические) (CF ?c2))
=>
  (assert (appendmessage "Алмаз + Металлические = Кольцо;  "))
  (assert (elem (name Кольцо) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule126 ""
  (declare (salience 20))
  (elem (name Металлические) (CF ?c1))
  (elem (name Жизнь) (CF ?c2))
=>
  (assert (appendmessage "Металлические + Жизнь = Робот;  "))
  (assert (elem (name Робот) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule127 ""
  (declare (salience 20))
  (elem (name Лезвие) (CF ?c1))
  (elem (name Лезвие) (CF ?c2))
=>
  (assert (appendmessage "Лезвие + Лезвие = Ножницы;  "))
  (assert (elem (name Ножницы) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule128 ""
  (declare (salience 20))
  (elem (name Лезвие) (CF ?c1))
  (elem (name Трава) (CF ?c2))
=>
  (assert (appendmessage "Лезвие + Трава = Коса;  "))
  (assert (elem (name Коса) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule129 ""
  (declare (salience 20))
  (elem (name Дом) (CF ?c1))
  (elem (name Небо) (CF ?c2))
=>
  (assert (appendmessage "Дом + Небо = Небоскреб;  "))
  (assert (elem (name Небоскреб) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule130 ""
  (declare (salience 20))
  (elem (name Солнце) (CF ?c1))
  (elem (name Растение) (CF ?c2))
=>
  (assert (appendmessage "Солнце + Растение = Подсолнух;  "))
  (assert (elem (name Подсолнух) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule131 ""
  (declare (salience 20))
  (elem (name Лезвие) (CF ?c1))
  (elem (name Металлические) (CF ?c2))
=>
  (assert (appendmessage "Лезвие + Металлические = Меч;  "))
  (assert (elem (name Меч) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule132 ""
  (declare (salience 20))
  (elem (name Стекло) (CF ?c1))
  (elem (name Небо) (CF ?c2))
=>
  (assert (appendmessage "Стекло + Небо = Телескоп;  "))
  (assert (elem (name Телескоп) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule133 ""
  (declare (salience 20))
  (elem (name Луна) (CF ?c1))
  (elem (name Море) (CF ?c2))
=>
  (assert (appendmessage "Луна + Море = Прилив;  "))
  (assert (elem (name Прилив) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule134 ""
  (declare (salience 20))
  (elem (name Луна) (CF ?c1))
  (elem (name Океан) (CF ?c2))
=>
  (assert (appendmessage "Луна + Океан = Прилив;  "))
  (assert (elem (name Прилив) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule135 ""
  (declare (salience 20))
  (elem (name Песок) (CF ?c1))
  (elem (name Стекло) (CF ?c2))
=>
  (assert (appendmessage "Песок + Стекло = Время;  "))
  (assert (elem (name Время) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule136 ""
  (declare (salience 20))
  (elem (name Дом) (CF ?c1))
  (elem (name Дом) (CF ?c2))
=>
  (assert (appendmessage "Дом + Дом = Деревня;  "))
  (assert (elem (name Деревня) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule137 ""
  (declare (salience 20))
  (elem (name Цветок) (CF ?c1))
  (elem (name Пруд) (CF ?c2))
=>
  (assert (appendmessage "Цветок + Пруд = Водяная лилия;  "))
  (assert (elem (name Водяная лилия) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule138 ""
  (declare (salience 20))
  (elem (name Гора) (CF ?c1))
  (elem (name Река) (CF ?c2))
=>
  (assert (appendmessage "Гора + Река = Водопад;  "))
  (assert (elem (name Водопад) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule139 ""
  (declare (salience 20))
  (elem (name Дом) (CF ?c1))
  (elem (name Ветер) (CF ?c2))
=>
  (assert (appendmessage "Дом + Ветер = Ветреная мельница;  "))
  (assert (elem (name Ветреная мельница) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule140 ""
  (declare (salience 20))
  (elem (name Стекло) (CF ?c1))
  (elem (name Дом) (CF ?c2))
=>
  (assert (appendmessage "Стекло + Дом = Окно;  "))
  (assert (elem (name Окно) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

(defrule Rule141 ""
  (declare (salience 20))
  (elem (name Электричество) (CF ?c1))
  (elem (name Металлические) (CF ?c2))
=>
  (assert (appendmessage "Электричество + Металлические = Проволока;  "))
  (assert (elem (name Проволока) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))
)

