insert into customer(name, address, county, area_code, email) values
('Person', 'Street 1', 'County1', '11111', 'person@email.com'),
('Person2', 'Street 2', 'County2', '22222', 'person2@email.com'),
('Person3', 'Street 3', 'County3', '33333', 'person3@email.com'),
('Person4', 'Street 4', 'County3', '33333', 'person4@email.com'),
('Person5', 'Street 5', 'County3', '33333', 'person5@email.com'),
('Person6', 'Street 6', 'County4', '44444', 'person6@mail.com'),
('Person7', 'Street 7', 'County1', '11111', 'person7@email.com');

insert into brand(name) values
('SweetPants'),
('Nordelle'),
('Velarix'),
('Stellero'),
('Lunar');

insert into color(name) values
('red'),
('blue'),
('green'),
('yellow'),
('pink'),
('purple'),
('white'),
('brown'),
('beige'),
('black'),
('multicolored');

insert into size(name) values
('EU34'),
('EU36'),
('EU38'),
('EU40'),
('EU42'),
('EU44'),
('EU46'),
('EU48');

insert into product(brand_id, color_id, size_id, price, quantity_in_stock) values
(1, 10, 3, 600, 1004),
(3, 8, 5, 400, 1230), 
(5, 4, 1, 500, 534),
(2, 1, 8, 300, 453),
(5, 3, 6, 500, 10),
(1, 10, 4, 600, 34),
(4, 4, 4, 200, 201),
(3, 1, 2, 300, 134);

insert into category(name) values
('shirt'),
('pants'),
('jacket'),
('skirt'),
('dress');

insert into product_category(product_id, category_id) values
(1, 2),
(2, 1),
(3, 3),
(4, 4),
(5, 5),
(6, 4),
(7, 3),
(8, 2);

insert into orders(customer_id) values
(1),
(1),
(1),
(2),
(2),
(3),
(4),
(4),
(6),
(7);

insert into product_orders(orders_id, product_id, product_quantity) values
(1, 1, 1),
(1, 1, 2),
(1, 4, 1),
(1, 5, 1),
(2, 8, 1),
(2, 3, 1),
(3, 5, 3),
(4, 6, 1),
(4, 5, 1),
(4, 4, 1),
(4, 3, 1),
(5, 1, 1),
(5, 2, 1),
(5, 3, 1),
(6, 2, 1),
(6, 3, 2),
(7, 3, 2),
(7, 8, 1),
(7, 7, 1),
(8, 1, 1),
(8, 5, 1),
(8, 4, 1),
(8, 6, 1),
(9, 3, 1),
(10,1, 1);