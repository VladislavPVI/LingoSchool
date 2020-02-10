# LingoSchool
Мультипользовательское web-приложение для языковой школы

Технологии: *Spring, Spring Boot, Spring Security, MySQL, Flyway, Hibernate, JMS, Bootstrap, FreeMarker, etc.*

Роли пользователей:
-	Администратор
-	Редактор
-	Учитель
-	Студент

## Архитектура приложения
Информационная система взаимодействует с базой данной, редактирует, добавляет, удаляет записи, а также имеет возможность выполнять параметризованные запросы. 
Приложение состоит из базы данных, серверной части и пользовательского интерфейса. Для реализации пользовательского интерфейса и серверной части приложения используется Spring Framework и FreeMarker. В качестве сервера приложений использовался Tomcat, встроенный по умолчанию в Spring Boot. 	

<img src="https://github.com/VladislavPVI/engschool/blob/master/docs/%D0%B0%D1%80%D1%85%D0%B8%D1%82%D0%B5%D0%BA%D1%82%D1%83%D1%80%D0%B0.jpg" width="240.375" height="266.25" />

### Структура базы данных
<img src="https://github.com/VladislavPVI/engschool/blob/master/docs/%D1%81%D1%85%D0%B5%D0%BC%D0%B0.png" />

## Интерфейс пользователя
### Страница авторизации
При открытии системы гость попадает на страницу авторизации, где ему предложено ввести логин и пароль, либо если пользователь ранее не был зарегистрирован в системе – есть возможность регистрации.

<img src="https://github.com/VladislavPVI/engschool/blob/master/docs/%D1%81%D1%82%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D0%B0%20%D0%B0%D0%B2%D1%82%D0%BE%D1%80%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B8.png" width="640" height="492" />
При вводе неверных данных появляется соответствующее сообщение об ошибке.

### Страница регистрации
Нажав на кнопку “Create your Account”, пользователь переходит на страницу регистрации, где ему предлагается ввести свои данные, такие как: Логин, Пароль, Полное имя, Дата рождения, Предпочтения, а также выбор уровня владения языком. При регистрации нового аккаунта, пользователь автоматически соглашается с политикой приватности.

<img src="https://github.com/VladislavPVI/engschool/blob/master/docs/%D1%81%D1%82%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D0%B0%20%D1%80%D0%B5%D0%B3%D0%B8%D1%81%D1%82%D1%80%D0%B0%D1%86%D0%B8%D0%B8.png"  width="640" height="492" />
Если окажется, что введенный пользователем логин уже существует в системе, появится соответствующее сообщение о существовании такого пользователя.

### Страница приветствия
После входа в систему, пользователь переходит в окно приветствия, где он может ознакомиться с системой. Сверху в зависимости от роли пользователя находятся различные кнопки навигации, позволяющие переходить между страницами.

<img src="https://github.com/VladislavPVI/engschool/blob/master/docs/%D0%BF%D1%80%D0%B8%D0%B2%D0%B5%D1%82.png" width="640" height="492" />

* Страница приветствия администратора имеет кнопки, позволяющие перейти на основную страницу, посмотреть банк заданий, увидеть всех пользователей, зарегистрированных в системе (включая редакторов, учителей и студентов), а также самостоятельно добавлять пользователей.
* Страница приветствия редактора имеет кнопки, позволяющие перейти на основную страницу, посмотреть список студентов или список заданий.
* Учитель имеет возможность перейти на основную страницу, в личный кабинет или посмотреть банк заданий.
* Студент обладает наименьшими возможностями и может перейти только на главную страницу или в личный кабинет.

### Список пользователей
Страница списка пользователей доступна только для администратора. Здесь можно увидеть логин каждого пользователя, его роль в системе и его статус. Существует возможность редактирования или удаления пользователя при нажатии на шестеренку или корзину соответственно.

<img src="https://github.com/VladislavPVI/engschool/blob/master/docs/%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%BE%20%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D0%B5%D0%B9.png" width="640" height="492" />

### Страница с заданиями
При нажатии на кнопку “Tasks” в шапке окна, администратор или редактор переходят на страницу с заданиями. Здесь находятся все задания, добавленные редактором или администратором. Есть возможность назначать студенту выбранное задание из списка, а также добавлять, редактировать или удалять задание.

<img src="https://github.com/VladislavPVI/engschool/blob/master/docs/%D1%81%D1%82%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D0%B0%20%D1%81%20%D0%B7%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D1%8F%D0%BC%D0%B8.png" width="640" height="492" />

**Реализована валидация данных при добавлении новых заданий**

<img src="https://github.com/VladislavPVI/engschool/blob/master/docs/%D0%B2%D0%B0%D0%BB%D0%B8%D0%B4%D0%B0%D1%86%D0%B8%D1%8F.png" />

### Личный кабинет учителя
Учитель, при нажатии на кнопку “Private Office”, попадает в личный кабинет. Здесь в левой части окна указаны его данные, средний балл, выставленный учениками за уроки, дата и время ближайшего занятия, а также напоминание о том, что ученики имеют возможность также выставлять учителю оценку.
В правой части окна находится список студентов и назначенные им в определенные даты занятия, а также оценки за занятия. Если к занятию было что-то задано, то напротив студента стоит галочка, в противном случае крестик. Есть возможность удалять или добавлять занятие, нажатием на корзинку или на кнопку “Добавить занятие” соответственно.

<img src="https://github.com/VladislavPVI/engschool/blob/master/docs/%D0%BB%D0%BA%20%D1%83%D1%87%D0%B8%D1%82%D0%B5%D0%BB%D1%8F.png" width="640" height="492" />

### Личный кабинет студента
Ученик, при нажатии на кнопку “Private Office”, попадает в личный кабинет. Здесь в левой части окна указаны его данные, средний балл, выставленный учителями за уроки, дата и время ближайшего занятия, а также напоминание о том, что важно не забывать ставить своему учителю оценку за каждое занятие.
Под данными ученика располагается список занятий содержащий дату каждого занятия, оценку учителя, а так же возможность нажав на поле “Mark” в выпадающем списке поставить оценку учителю.

<img src="https://github.com/VladislavPVI/engschool/blob/master/docs/%D0%BB%D0%BA%20%D1%81%D1%82%D1%83%D0%B4%D0%B5%D0%BD%D1%82%D0%B0.png" width="640" height="492" />