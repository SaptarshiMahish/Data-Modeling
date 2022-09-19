create database vishal_mega_mart;
-- WORK STATION  ( BRANCH - DEPERTMENT - EMPLOYEE - SALARY )



create table Location (
loc_id int primary key auto_increment not null,
City char (50),
State char (50)
);
insert into Location (loc_id,City,State) 
values (51,'Kolkata','West Bengal'),
(52,'Bangalore','Karnataka'),
(53,'Hydrabad','Telangana'),
(54,'New Delhi','Delhi'),
(55,'Gurgaon','Haryana'),
(56,'Channei','TamilNadu');


create table Branch (
Brn_id int primary key auto_increment not null,
Loc_id int,
Brn_name varchar(50),
Foreign Key (Loc_id) references Location (Loc_id)
);
insert into Branch (Brn_id,Loc_id,Brn_name) 
values (101,51,'Esplanade'),
(102,55,'Dhundhera'),
(103,55,'Huda City Center'),
(104,54,'Sarojini Nagar');


create table Department (
Dep_id int primary key auto_increment not null,
Brn_id int,
Dep_name varchar(40) not null,
Sub_dep varchar(40),
FOREIGN KEY Department(Brn_id) REFERENCES Branch(Brn_id)

);
select * from Department;
insert into Department values 
(501,102,'Store Manager',''),
(502,102,'Admin','Inventory collector'),
(503,102,'Floor Manager','Team Leader'),
(504,102,'IT','Technician'),
(505,102,'Cashier','Helper'),
(506,102,'Garments',''),
(507,102,'Electronics',''),
(508,102,'Grocery',''),
(509,101,'Store Manager',''),
(510,101,'Admin','Inventory collector'),
(511,101,'Floor Manager','Team Leader'),
(512,101,'IT','Technician'),
(513,101,'Cashier','Helper'),
(514,101,'Garments',''),
(515,101,'Electronics',''),
(516,101,'Grocery',''),
(517,103,'Store Manager',''),
(518,103,'Admin','Inventory collector'),
(519,103,'Floor Manager','Team Leader'),
(520,103,'IT','Technician'),
(521,103,'Cashier','Helper'),
(522,103,'Garments',''),
(523,103,'Electronics',''),
(524,103,'Grocery',''),
(525,104,'Store Manager',''),
(526,104,'Admin','Inventory collector'),
(527,104,'Floor Manager','Team Leader'),
(528,104,'IT','Technician'),
(529,104,'Cashier','Helper'),
(530,104,'Garments',''),
(531,104,'Electronics',''),
(532,104,'Grocery','');


create table Employee (
    Emp_id int primary key auto_increment not null,
    Dep_id int,
    Brn_id int,
    Loc_id int,
    F_name varchar(50),
    L_name varchar(50),
    Email varchar(70),
    Ph_no varchar(15),
    Street varchar(200),
    Foreign key (Loc_id) References Location(Loc_id),
    FOREIGN KEY (Dep_id) REFERENCES Department(Dep_id),
    FOREIGN KEY (Brn_id) REFERENCES Branch(Brn_id)
    );
insert into Employee values
(1,501,102,51,'Tapi','Dutta','tapi@mega.com','+91 8234529374','cyber city'),
(2,502,102,51,'Tom','Holand','tom@mega.com','+91 9234729974','sector 20 lane'),
(3,503,102,51,'Raj','Dutta','raj@mega.com','+91 9534529374','cyber city'),
(4,504,102,51,'Sarah','Khan','sarah@mega.com','+91 7234579377','cyber city'),
(5,505,102,51,'Jack','Santi','sonal@mega.com','+91 9934889374','cyber city'),
(6,506,102,51,'Lopi','Billings','lopi@mega.com','+91 8234669374','cyber city'),
(7,507,102,51,'Subrata','Yadav','subrata@mega.com','+91 6234729874','sector 20 lane'),
(8,508,102,51,'Amit','Yadav','amit@mega.com','+91 8534529555','cyber city');





create table Salary (
Emp_id int,
Dep_id int,
Brn_id int,
amount double,
FOREIGN KEY (Emp_id) REFERENCES Employee(Emp_id),
FOREIGN KEY (Dep_id) REFERENCES Department(Dep_id),
FOREIGN KEY (Brn_id) REFERENCES Branch(Brn_id)
);

insert into Salary values
(1,501,102,100000.00),
(2,502,102,80000.00),
(3,503,102,70000.00),
(4,504,102,60000.00),
(5,505,102,50000.00),
(6,506,102,40000.00),
(7,507,102,30000.00),
(8,508,102,20000.00);
-- Date & Time --

    create table Date (
    Dat_id int primary key auto_increment,
    Delivery_dt datetime not null,
    receive_dt datetime
    );
    insert into Date values
    (201,'2022-02-11 13:23:44','2022-02-12 15:23:44'),
    (202,'2022-02-12 14:23:44','2022-02-13 16:23:44'),
    (203,'2022-02-13 13:53:44','2022-02-14 14:23:44'),
    (204,'2022-02-14 12:23:44','2022-02-15 13:23:44');
    
    
    -- *** -
    create table Time (
    Tim_id int primary key auto_increment,
    Full_date datetime not null
    -- day
    -- month
    -- year
    );

-- PRODUCT & CATEGORY  *****

create table Category (
Cat_id int primary key auto_increment not null,
Cat_name varchar(100),
Sub_category varchar(100)

);
select * from Category;
alter table category
add Sub_category_1 varchar(50),
add Sub_catagory_2 varchar(50);
Insert into Category values
(1001,'Grocery','Vegetables','Frozen food','Bakery'),
(1002,'Electronics','Home appliance','Computer & accessories','Mobile & audio'),
(1003,'Garments','Mens','Womens','Kids');

Create table Product (
Prod_id int primary key auto_increment not null,
Cat_id int,
Brn_id int,
Prod_type varchar(100),
Prod_name varchar(255),
P_unit_Price double,
Supplier_cost double,
-- margin
-- list price
Foreign key (Cat_id) References Category (Cat_id),
Foreign key (Brn_id) References Branch(Brn_id)
);


Insert into Product values
(1111,1001,102,'Vegetables','Sweet Potato',4.00,2.50),
(1112,1001,102,'Frozen Food','Fish Finger',40.00,25.00),
(1113,1001,102,'Bakery','Chapati',80.00,50.00),
(1114,1002,102,'Home appliance','Smart TV',24000.00,16000.00),
(1115,1002,102,'Computer & accessories','Lenovo L14 Laptop',95000.00,70000.00),
(1116,1002,102,'Mobile & Audio','Samsung Bluetooth headset',4000.00,2500.00),
(1117,1003,102,'Denim','Stone wash',2500.00,1000.00),
(1118,1003,102,'Top','Tank Top',450.00,200.00),
(1119,1003,102,'Kids clothing','Pants',400.00,250.00);



create table Supplier (
    Sup_id int primary key auto_increment not null,
    F_name varchar(50),
    L_name varchar(50),
    Email varchar(100),
    Ph_no varchar(15),
    Street varchar(255),
    Loc_id int,
    FOREIGN KEY (Loc_id) REFERENCES Location(Loc_id)
    );
    
    create table Order_to_Supplier (
    Ord_id int primary key auto_increment not null,
    Prod_id int,
    Sup_id int,
    Quantity int,
    Weight Varchar(50),
    height varchar(50),
    FOREIGN KEY (Prod_id) REFERENCES Product(Prod_id),
    FOREIGN KEY (Sup_id) REFERENCES Supplier(Sup_id)
    );
    
    create table Supplied_Product (
    SupProduct_id int primary key auto_increment not null,
    Ord_id int,
    Loc_id int,
    Dat_id int,
    SupProduct_name varchar(100),
    SupProd_UnitCost double,
    Quantity int,
    Foreign key (Ord_id) references Order_to_Supplier(Ord_id),
    Foreign Key (Loc_id) references Location(Loc_id),
    Foreign Key (Dat_id) references Date(Dat_id)
    );
    
    
    create table Inventory (
    Inv_id int primary key auto_increment,
    Sup_id int,
    SupProduct_id int,
    SupProd_UnitCost double,
    Recived_qty_in_stock int,
    Qty_out_from_stock int,
    Remaining_stock int,
    Stock_location varchar(50),
    Category varchar(75),
    descrip varchar(150),
    Foreign key (Sup_id) references Supplier(Sup_id),
    Foreign key (SupProduct_id) references Supplied_Product(SupProduct_id)
    );
    
    create table Inventory_Details (
    Inv_details_id int primary key auto_increment,
    Inv_id int,
    Prod_id int,
    Emp_id int,
    dat_id int,
    quantity int,
    Foreign Key (Inv_id) references Inventory(Inv_id),
    Foreign key (Prod_id) references Product(Prod_id),
    Foreign Key (Emp_id) references Employee(Emp_id),
    foreign key (Dat_id) references Date(Dat_id)
    );
    
    create table Purchase (
    Pur_id int primary key auto_increment,
    prod_id int,
    Ord_id int,
    Sup_id int,
    Dat_id int,
    Tim_id int,
    Quantity int,
    Pur_amount double,
    Foreign Key (Ord_id) references Order_to_Supplier (Ord_id),
    Foreign key (Prod_id) references Product (Prod_id),
    foreign key (Dat_id) references Date (Dat_id),
    foreign key (Sup_id) references Supplier (Sup_id),
    foreign key (Tim_id) references Time (Tim_id)
    );
    
    create table Customer (
    Cus_id int primary key auto_increment not null,
    F_name varchar(50),
    L_name varchar(50),
    Email varchar(70),
    Ph_no char(15) not null,
    Street varchar(100),
    Loc_id int,
    FOREIGN KEY (Loc_id) REFERENCES Location(Loc_id)
    );
    
    create table Billing (
    Billing_id int primary key auto_increment not null,
    Brn_id int,
    loc_id int,
    emp_id int,
    cus_id int,
    prod_id int,
    tim_id int,
    dat_id int,
    Quantity int,
    Billing_amount double,
    foreign key (Brn_id) references Branch (Brn_id),
    FOREIGN KEY (Loc_id) REFERENCES Location(Loc_id),
    foreign key (Emp_id) references Employee (Emp_id),
    FOREIGN KEY (Cus_id) REFERENCES Customer(Cus_id),
    Foreign key (Prod_id) references Product (Prod_id),
    Foreign key (Dat_id) references Date (Dat_id),
    Foreign key (Tim_id) references Time (Tim_id)
    );