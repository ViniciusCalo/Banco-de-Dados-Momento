USE momento;
SELECT * FROM funcionarios WHERE funcionario_id = 207;

update funcionarios 
set salario = 8000
where funcionario_id = 207;

/*Contando a quantidade total de funcionarios*/
SELECT COUNT(`funcionario_id`) FROM funcionarios;

/*Contando a quatidade de funcionarios no departamento de finanças*/
SELECT COUNT(`funcionario_id`) FROM funcionarios
WHERE departamento_id = 10;

/*Vendo a média salarial dos funcionarios do departamento de tecnologia*/
SELECT AVG(`salario`) FROM funcionarios WHERE departamento_id = 6; 

/*Vendo os gastos com salario do departamento de transporte*/
SELECT SUM(`salario`) FROM funcionarios WHERE departamento_id = 5;

/*media do salario dos departamentos de finanças e adminstração*/
SELECT AVG(`salario`) FROM funcionarios WHERE departamento_id = '1' and '10';

/*Regiões que a empresa atua e seus respectivos países*/
SELECT paises.pais_name AS Pais, regiao.regiao_name FROM paises INNER JOIN regiao WHERE paises.regiao_id = regiao.regiao_id;

/*Checando os dependentes*/

/*primeira busca*/
SELECT dependentes.primeiro_nome, funcionarios.primeiro_nome FROM dependentes
INNER JOIN funcionarios ON dependentes.funcionario_id = funcionarios.funcionario_id
WHERE dependentes.primeiro_nome = 'Joe'; /*Joe é filho do Ismael*/

/*Segunda busca*/
SELECT dependentes.primeiro_nome, funcionarios.primeiro_nome, dependentes.parentesco FROM dependentes
INNER JOIN funcionarios ON dependentes.funcionario_id = funcionarios.funcionario_id
WHERE dependentes.funcionario_id = 112; /*Jose Manuel possui filho, e se chama Christian*/

/*Qual regiao possui mais países*/
SELECT regiao.regiao_name, COUNT(paises.regiao_id) FROM paises INNER JOIN regiao WHERE regiao.regiao_id = paises.regiao_id GROUP BY regiao.regiao_name;

/*exibindo funcionaros e seus dependentes*/
SELECT funcionarios.primeiro_nome, dependentes.primeiro_nome FROM funcionarios INNER JOIN dependentes WHERE funcionarios.funcionario_id = dependentes.funcionario_id;

/*Karen Partners possui um conjuge?*/
SELECT dependentes.primeiro_nome, funcionarios.primeiro_nome, dependentes.parentesco FROM dependentes
INNER JOIN funcionarios ON dependentes.funcionario_id = funcionarios.funcionario_id
WHERE dependentes.funcionario_id = 146;
