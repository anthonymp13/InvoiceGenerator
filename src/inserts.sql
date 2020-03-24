delete from item;
delete from product;
delete from invoice;
delete from customer;


insert into customer (id, firstName, lastName, street, postalCode, city, countryId) values ('1', 'Tim', 'Weisman', '5222 Milwaukee Street', '53704', 'Madison', 'BE');
insert into invoice (id, customerId, invoiceDate) values ('1', '1', '2020-2-26');
insert into product (id, name, price, vat) values ('1', 'Remove oak tree', '1500', '20');
insert into item (id, item, productId, invoiceId, quantity, cost) values ('1', '1', '1', '1', '2', '1500');

