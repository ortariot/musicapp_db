# Домашнее задание к лекции «Проектирование БД. Связи. 3НФ»

## Задание 1

Развить схему для музыкального сервиса  (разработать схему написать SQL-скрипт описывающий схему):

+ Исполнители могут петь в разных жанрах, как и одному жанру могут принадлежать несколько исполнителей.
Альбом могут выпустить несколько исполнителей вместе. Как и исполнитель может принимать участие во множестве альбомов.
+ С треками ничего не меняем, все так же трек принадлежит строго одному альбому.
+ Но появилась новая сущность - сборник. Сборник имеет название и год выпуска. В него входят различные треки из разных альбомов.Обратите внимание: один и тот же трек может присутствовать в разных сборниках.

# 

## Схема базы данных musicapp

![схема базы данных](/img/musicapp.png)

SQL-скрипт содержится в файле [musicapp_hw.sql](/musicapp_hw.sql 'musicapp_hw.sql').

#
## Дополнительнео задание

Спроектировать отношение (или схему из нескольких отношений) "Сотрудник". У каждого сотрудника есть следующие параметры:

1. Имя
2. Отдел
3. Начальник (ссылка на начальника)
   
Примечание: начальник - тоже сотрудник. Отдел можно хранить строкой, можно идентификатором (не принципиально).

Необходимо написать SQL-запрос, создающий таблицу "Сотрудник", и прислать ссылку на файл с этим запросом.

#
## Схема базы данных DepartamentsStruct
![схема базы данных](/img/DepartamentsStruct.png)

SQL-скрипт содержится в файле [DepartamentsStruct_hw.sql](/DepartamentsStruct_hw.sql 'DepartamentsStruct_hw.sql')

Реализована связь между отношениями многие ко многим через вспомогательное отношение ```DepHead```. Однако следует отметить что для параметра ```dep_id``` устанолен атрибут ```UNIQUE```, что позволяет исключть возможность дублирования отделов, но в то же время оставляет возможность одному сотруднику возглавлять 2 отдела одновременно (в лучае подмены или соотвествующих должностных инструкций) 