drop table product;
drop table item;
drop table invoice;
drop table user_role;
drop table user;
drop table customer;
drop table company;

create table company
(
    id          int auto_increment
        primary key,
    companyName varchar(32) not null,
    address     varchar(32) null,
    city        varchar(32) null,
    state       varchar(32) null,
    zip         int         null,
    phoneNumber varchar(32) null
);

create table customer
(
    id          int auto_increment
        primary key,
    firstName   varchar(32) not null,
    lastName    varchar(32) not null,
    street      varchar(32) not null,
    postalCode  int         not null,
    city        varchar(32) not null,
    countryId   varchar(32) not null,
    state       varchar(32) not null,
    phoneNumber varchar(32) null,
    email       varchar(32) null,
    companyId   int         not null,
    constraint customer_company_id_fk
        foreign key (companyId) references company (id)
);

create table invoice
(
    id          int auto_increment
        primary key,
    customerId  int         not null,
    invoiceDate date        not null,
    terms       varchar(32) not null,
    total       double      null,
    constraint invoice_customer_id_fk
        foreign key (customerId) references customer (id)
);

create table product
(
    id    int         not null,
    name  varchar(32) not null,
    price int         not null,
    vat   int         not null,
    constraint Product_id_uindex
        unique (id)
);

alter table product
    add primary key (id);

create table item
(
    id        int auto_increment
        primary key,
    item      int    not null,
    productId int    not null,
    invoiceId int    not null,
    quantity  int    not null,
    cost      double null,
    constraint item_invoice_id_fk
        foreign key (invoiceId) references invoice (id),
    constraint item_product_id_fk
        foreign key (productId) references product (id)
);

create table user
(
    id        int auto_increment
        primary key,
    userName  varchar(32) not null,
    password  varchar(32) not null,
    firstName varchar(32) not null,
    lastName  varchar(32) not null,
    companyId int         not null,
    constraint user_company_id_fk
        foreign key (companyId) references company (id)
            on delete cascade
);

create table user_role
(
    id        int auto_increment
        primary key,
    userName  varchar(32) not null,
    role_name varchar(32) not null,
    userId    int         not null,
    constraint user_role_user_id_fk
        foreign key (userId) references user (id)
            on delete cascade
);



INSERT INTO itextinvoice.company (id, companyName, address, city, state, zip, phoneNumber) VALUES (1, 'Hauser Tree Care', '741 ruskin st', 'Madison', 'Wisconsin', 53704, '608-598-9342');
INSERT INTO itextinvoice.customer (id, firstName, lastName, street, postalCode, city, countryId, state, phoneNumber, email, companyId) VALUES (1, 'Tim', 'Weisman', '5222 Milwaukee Street', 53704, 'Madison', 'BE', 'Wisconsin', null, null, 1);
INSERT INTO itextinvoice.invoice (id, customerId, invoiceDate, terms, total) VALUES (1, 1, '2020-02-26', 'Due upon receipt', 1500);
INSERT INTO itextinvoice.item (id, item, productId, invoiceId, quantity, cost) VALUES (1, 1, 1, 1, 2, 1500);
INSERT INTO itextinvoice.product (id, name, price, vat) VALUES (1, 'Remove oak tree', 1500, 20);
INSERT INTO itextinvoice.user (id, userName, password, firstName, lastName, companyId) VALUES (1, 'anthonyp', 'giggity', 'Anthony', 'Poleski', 1);
INSERT INTO itextinvoice.user (id, userName, password, firstName, lastName, companyId) VALUES (2, 'thomast', 'thomastp', 'Thomas', 'Thomas', 1);
INSERT INTO itextinvoice.user_role (id, userName, role_name, userId) VALUES (1, 'anthonyp', 'admin', 1);
INSERT INTO itextinvoice.user_role (id, userName, role_name, userId) VALUES (2, 'thomast', 'basic', 2);