INSERT INTO `practicatriggers`.`empleados`
(`emp_num`,
`apellido`,
`oficio`,
`dir`,
`fecha_alt`,
`salario`,
`comision`,
`dept_no`)
VALUES
(2,
'Gonzáles',
'DEV',
1,
curdate(),
2500,
25,
6);


DELETE FROM `practicatriggers`.`empleados`
WHERE emp_num = 2;

UPDATE `practicatriggers`.`empleados`
SET
`emp_num` = 5,
`apellido` = 'nuevoape'

WHERE `emp_num` = 2;
