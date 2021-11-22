.read data.sql


CREATE TABLE average_prices AS
  SELECT category, AVG(MSRP) as average_price FROM products GROUP BY category;


CREATE TABLE lowest_prices AS
  SELECT store, item, MIN(price) as min_price FROM inventory GROUP BY item;


CREATE TABLE shopping_list AS
  SELECT p.name, l.store FROM products AS p, lowest_prices AS l
  WHERE  p.name = l.item GROUP BY p.category HAVING MIN(p.MSRP / p.rating);


CREATE TABLE total_bandwidth AS
  SELECT SUM(s.Mbs) FROM shopping_list AS l, stores AS s
  WHERE l.store = s.store;

