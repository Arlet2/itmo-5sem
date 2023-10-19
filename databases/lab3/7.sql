SELECT * FROM Н_ЛЮДИ
LEFT JOIN Н_УЧЕНИКИ ON Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
WHERE Н_УЧЕНИКИ.ИД IS NULL;