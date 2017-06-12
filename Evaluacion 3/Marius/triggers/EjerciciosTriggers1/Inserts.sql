#Prueba ejercicio a

INSERT INTO departamentos (dept_no, dnombre, localidad) VALUES (2,"asdas","sdadas");

INSERT INTO `practicatriggers`.`departamentos`
(`dept_no`,
`dnombre`,
`localidad`)
VALUES
(3,
"asdas",
"asdasda");

DELETE FROM `practicatriggers`.`departamentos`
WHERE dept_no = 3;


UPDATE `practicatriggers`.`departamentos`
SET
`dept_no` = 6,
`dnombre` = 'nombrecambiado'

WHERE `dept_no` = 3;

