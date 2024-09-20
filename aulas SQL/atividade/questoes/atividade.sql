1. Quais pedidos tiveram a  quantidade de ingredientes alterado pelo cliente?

SELECT DISTINCT ip.pedido_id
FROM ingrediente_item_pedido ip
JOIN pedido p ON ip.pedido_id = p.pedido_id
WHERE ip.quantidade_ingrediente IS NOT NULL;

2. Quantos pedidos tiveram troca de mesa?

SELECT COUNT(DISTINCT pedido_id) AS pedidos_troca_mesa
FROM mesa;

3. Qual a porcentagem de pedidos via delivery entre 16/03/2020 até a data de hoje?

SELECT 
  (total_pedidos_delivery * 100.0 / total_pedidos) AS porcentagem_delivery
FROM (
  SELECT 
    (SELECT COUNT(*) 
     FROM pedidos 
     WHERE tipo_pedido = 'delivery' 
     AND data_pedido BETWEEN '2020-03-16' AND CURRENT_DATE) AS total_pedidos_delivery,
    (SELECT COUNT(*) 
     FROM pedidos 
     WHERE data_pedido BETWEEN '2020-03-16' AND CURRENT_DATE) AS total_pedidos
) AS subquery;


4. Quantos pedidos atendidos pelo cozinheiro 'João Paulo' que tenha 'Peixe' como ingrediente?

SELECT COUNT(DISTINCT p.id_pedido) AS total_pedidos
FROM pedidos p
JOIN itens_pedido ip ON p.id_pedido = ip.id_pedido
JOIN ingredientes_itens ii ON ip.id_item = ii.id_item
WHERE p.cozinheiro = 'João Paulo'
AND ii.ingrediente = 'Peixe';
