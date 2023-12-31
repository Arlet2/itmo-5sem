SELECT COUNT(*) > 0 AS ANSWER FROM Н_ЛЮДИ
JOIN Н_УЧЕНИКИ ON Н_ЛЮДИ.ИД = Н_УЧЕНИКИ.ЧЛВК_ИД
JOIN Н_ПЛАНЫ ON Н_УЧЕНИКИ.ПЛАН_ИД = Н_ПЛАНЫ.ИД
JOIN Н_ОТДЕЛЫ ON Н_ПЛАНЫ.ОТД_ИД = Н_ОТДЕЛЫ.ИД
WHERE Н_ОТДЕЛЫ.КОРОТКОЕ_ИМЯ='КТиУ' AND date_part('year', age(Н_ЛЮДИ.ДАТА_РОЖДЕНИЯ)) < 20;
