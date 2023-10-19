SELECT * FROM (
    SELECT Н_УЧЕНИКИ.ГРУППА, AVG(date_part('year', age(Н_ЛЮДИ.ДАТА_РОЖДЕНИЯ))) AS avg_age
    FROM Н_УЧЕНИКИ
    JOIN Н_ЛЮДИ ON Н_ЛЮДИ.ИД = Н_УЧЕНИКИ.ЧЛВК_ИД
    GROUP BY Н_УЧЕНИКИ.ГРУППА
) as ages
WHERE avg_age > (
    SELECT AVG(date_part('year', age(Н_ЛЮДИ.ДАТА_РОЖДЕНИЯ))) AS avg_age
    FROM Н_УЧЕНИКИ
    JOIN Н_ЛЮДИ ON Н_ЛЮДИ.ИД = Н_УЧЕНИКИ.ЧЛВК_ИД
    WHERE Н_УЧЕНИКИ.ГРУППА = '1100'
);