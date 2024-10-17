
/* 1 - Altere a tabela de débitos para corrigir o campo situacao_debito. Se o débito estiver
vencido e não for 'Negoiado' nem 'Pago', informe 'Atrasado'. */

UPDATE DEBITOS d 
	SET d.SITUACAO_DEBITO = 'Atrasado'
   WHERE DATAVENCIMENTO < CURRENT_DATE
  AND SITUACAO_DEBITO  NOT IN ('Negociado', 'Pago')
  
  
/* 2 - Altere a tabela de débitos para corrigir o campo situacao_debito.
Se o débito não estiver vencido e não for 'Pago', informe 'Pendente' */
  
UPDATE DEBITOS d 
	SET d.SITUACAO_DEBITO = 'Pendente'
   WHERE d.DATAVENCIMENTO > CURRENT_DATE
   AND d.SITUACAO_DEBITO NOT IN ('Pago')
 

/* 3 - Altere a tabela débitos para corrigir o campo data de vencimento, Se o débito
estiver com a situação  'Negociado', altere o ano da data de vencimento para ano -5 anos. */

UPDATE DEBITOS d 
	SET d.DATAVENCIMENTO = DATEADD(-5 YEAR TO DATAVENCIMENTO) 
   WHERE SITUACAO_DEBITO  NOT IN ('Negociado')

/* 4 - Selecione o nome, e-mail, e telefone de todas as pessoas. */

SELECT p.NOME, p.EMAIL, p.TELEFONE
	FROM PESSOA p
	

/* 5 - Liste os produtos com preço unitárito acima de R$ 100. */
	
SELECT p.NOME, p.PRECO_UNITARIO 
FROM PRODUTO p 
WHERE p.PRECO_UNITARIO > 100 


/* 6 - Retorne todas as vendas realizadas em uma determinada data. */

SELECT *
	FROM VENDA v 
   WHERE v.DATA_VENDA = '2022-11-14' 
   
   
/* 7 - Mostre o nome, a data de nascimento e a idade dos fornecedores que não têm produtos em estoque */

SELECT p.NOME, p.DATA_NASCIMENTO 
	FROM FORNECEDOR f
   LEFT JOIN PESSOA p ON p.ID_PESSOA = f.ID_PESSOA


/* 8 - Mostre o nome, a data de nascimento e a idade dos fornecedores que não têm produtos em estoque */







































