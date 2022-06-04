create database db_foodapp;
use db_foodapp;

create table users(
	id int auto_increment,
    user_name varchar(255),
    user_password varchar(28),
    type_login varchar(50),
    
    primary key(id)
);

create table state(
	id int auto_increment,
    state_name varchar(255),
    
    primary key(id)
);

create table city(
	id int auto_increment,
    city_name varchar(255),
    id_state int,
    
    primary key(id),
    foreign key(id_state) references state(id)
);

create table users_detail(
	id_user int,
    fullname varchar(255),
    phone varchar(13),
    id_state int,
    id_city int,
    street varchar(255),
    
    primary key (id_user),
    foreign key(id_user) references users(id),
    foreign key(id_state) references state(id),
    foreign key(id_city) references city(id)
);

create table category(
	id int auto_increment,
    category_name varchar(255),
    url_image varchar(255),
    
    primary key(id)
);

create table restaurant (
	id int auto_increment,
    restaurant_name varchar(255),
    url_image varchar(255),
    
    primary key(id)
);

create table menu(
	id int auto_increment,
    menu_name varchar(255),
    menu_description varchar(255),
    url_image varchar(255),
    rating int,
    price decimal,
    id_restaurant int,
    id_category int,
    
    primary key(id),
    foreign key(id_restaurant) references restaurant(id),
    foreign key(id_category) references category(id)
);

create table submenu(
	id int auto_increment,
    submenu_name varchar(255),
    price decimal,
    id_restaurant int,
    
    primary key(id),
    foreign key(id_restaurant) references restaurant(id)
);

create table menu_detail(
	id int auto_increment,
    id_menu int,
    id_submenu int,
    
    primary key(id),
    foreign key(id_menu) references menu(id),
    foreign key(id_submenu) references submenu(id)
);

create table orders_status(
	id int auto_increment,
    status_name varchar(255),
    
    primary key(id)
);

create table orders(
	id int auto_increment,
    start_date date,
    end_date date,
    id_status int,
    
    primary key(id),
    foreign key(id_status) references orders_status(id)
);

create table orders_detail(
	id_orders int,
    id_menu int,
    id_user int,
    price decimal,
    
    foreign key(id_orders) references orders(id),
    foreign key(id_menu) references menu(id),
    foreign key(id_user) references users(id)
);

create table review(
	id int auto_increment,
    comments varchar(255),
    rating int,
    id_restaurant int,
    
    primary key(id),
    foreign key(id_restaurant) references restaurant(id) 
);

create table promo(
	id int auto_increment,
    promo_name varchar(255),
    discount decimal,
    expired_date date,
    
    primary key(id)
);

create table menu_promo(
	id_menu int,
    id_promo int,
    
    foreign key(id_menu) references menu(id),
    foreign key(id_promo) references promo(id)
);