
create table customer
(id int not null auto_increment primary key,
name varchar(30) not null,
address varchar(30) not null,
county varchar(30) not null, -- valde att inte ha county som egen tabell för den hör ihop med adress och postnr
area_code varchar(30) not null,
email varchar(30) not null,
created timestamp DEFAULT CURRENT_TIMESTAMP,
updated timestamp default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

create table brand
(id int not null auto_increment primary key,
name varchar(30) not null,
created timestamp default CURRENT_TIMESTAMP,
updated timestamp default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

create table color
(id int not null auto_increment primary key,
name varchar(30) not null,
created timestamp default CURRENT_TIMESTAMP,
updated timestamp default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

create table size
(id int not null auto_increment primary key,
name varchar(30) not null,
created timestamp default CURRENT_TIMESTAMP,
updated timestamp default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

create table product
(id int not null auto_increment primary key,
brand_id int,
color_id int,
size_id int,
price int unsigned,
quantity_in_stock int unsigned,
created timestamp default CURRENT_TIMESTAMP,
updated timestamp default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
foreign key (brand_id) references brand(id) on delete cascade, -- för att radera alla produkter från ett märke automatiskt
foreign key (color_id) references color(id) on delete set null, -- för att ha kvar produkten även om färg raderas
foreign key (size_id) references size(id) on delete set null); -- för att ha kvar produkten även om storlek raderas

create table category
(id int not null auto_increment primary key,
name varchar(30) not null,
created timestamp default CURRENT_TIMESTAMP,
updated timestamp default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

create table product_category
(id int not null auto_increment primary key,
category_id int not null,
product_id int not null,
created timestamp default CURRENT_TIMESTAMP,
updated timestamp default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
foreign key (category_id) references category(id) on delete cascade, -- radera raden/raderna ifall att en kategori inte längre finns
foreign key (product_id) references product(id) on delete cascade); -- radera raden/raderna ifall att en produkt inte längre finns

create table orders
(id int not null auto_increment primary key,
customer_id int,
created timestamp default CURRENT_TIMESTAMP,
updated timestamp default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
foreign key (customer_id) references customer(id) on delete set null); -- för att ha kvar ordern även om kunden raderar sitt konto

create table product_orders
(id int not null auto_increment primary key, -- får en syntetisk nyckel för att kunna lägga in flera av samma vara i en order
orders_id int not null,
product_id int,
product_quantity int,
created timestamp default CURRENT_TIMESTAMP,
updated timestamp default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
foreign key (orders_id) references orders(id) on delete cascade, -- raderna behövs inte om ordern raderas
foreign key (product_id) references product(id) on delete set null); -- för att ha kvar gamla ordrar med produkter som inte längre säljs


create index IX_sizeName on size(name); -- för man söker efter storlekar by name och det kan finnas massa olika typer (EU, US, UK, S/M/L, jeansstorlek, skostorlek osv)