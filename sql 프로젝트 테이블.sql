drop table customer,seller,store,category,product,orders,friend;

-- 1. CUSTOMER
CREATE TABLE customer (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  address VARCHAR(255) NOT NULL,
  address1 VARCHAR(200), -- 추가됨(04.09) (상세주소1)
  -- address2 VARCHAR(200), -- 추가됨(04.09) (상세주소2) -- 삭제됨(04.10)
  zipcode int, -- 추가됨(04.09) (우편번호)
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
select password from customer where email=email;
select * from customer;
update customer set email='gildodong@naver.com' where id = 1; 
select password from customer where email=#{email};


select id from customer where name= 홍길동;

-- 2. SELLER
CREATE TABLE seller (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


insert into 
customer(id,name,email,password,phone,address) 
value('1','홍길동','gildong@naver.com','1234','010-1111-2222','서울');

insert into 
customer(id,name,email,password,phone,address) 
value('2','홍길영','gilyong@naver.com','12345','010-1111-2223','서울');




insert into 
seller(id,name,email,password,phone) 
value('1','홍판매','hong@naver.com','12345','010-1111-2255');
insert into 
seller(id,name,email,password,phone) 
value('2','김판매','kim@naver.com','123456','010-1122-2255');

select * from seller;

-- 3. STORE
CREATE TABLE store (
  id INT AUTO_INCREMENT PRIMARY KEY,
  seller_id INT UNIQUE,
  name VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  address VARCHAR(255) NOT NULL,
  address1 VARCHAR(200), -- 추가됨(04.10)
  zipcode VARCHAR(7), -- 추가됨(04.10)
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_store_seller FOREIGN KEY (seller_id)
    REFERENCES seller(id) ON DELETE CASCADE
);

-- 4. CATEGORY
CREATE TABLE category (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL
);

-- 카테고리 추가 쿼리

insert into category(name) values('식품');
insert into category(name) values('가구');
insert into category(name) values('도서');
insert into category(name) values('스포츠/레저');
insert into category(name) values('출산/유아용품');
insert into category(name) values('반려동물용품');
insert into category(name) values('뷰티');

select * from category;


-- 5. PRODUCT
CREATE TABLE product (
  id INT AUTO_INCREMENT PRIMARY KEY,
  store_id INT NOT NULL,
  category_id INT,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  price INT NOT NULL,
  stock INT NOT NULL,
  status VARCHAR(50) NOT NULL,
  picture VARCHAR(50), -- 추가됨(04.09)
  recommend INT NOT NULL DEFAULT 0, -- 추가됨(04.09)
  discount_start DATETIME DEFAULT NULL,
  discount_end DATETIME DEFAULT NULL,
  discount_percentage DECIMAL(5,2) DEFAULT 0 CHECK (discount_percentage BETWEEN 0 AND 100),
  CONSTRAINT fk_product_store FOREIGN KEY (store_id)
    REFERENCES store(id) ON DELETE CASCADE,
  CONSTRAINT fk_product_category FOREIGN KEY (category_id)
    REFERENCES category(id) ON DELETE SET NULL
);

-- 6. FRIEND
CREATE TABLE friend (
  id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id1 INT NOT NULL,
  customer_id2 INT NOT NULL,
  status ENUM('pending', 'accepted', 'blocked'),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT uq_friend_pair UNIQUE (customer_id1, customer_id2),
  CONSTRAINT chk_ordering CHECK (customer_id1 < customer_id2),
  CONSTRAINT fk_friend_customer1 FOREIGN KEY (customer_id1)
    REFERENCES customer(id) ON DELETE CASCADE,
  CONSTRAINT fk_friend_customer2 FOREIGN KEY (customer_id2)
    REFERENCES customer(id) ON DELETE CASCADE
);

-- 7. ORDER
CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT NOT NULL, -- 추가됨(04.09)
  customer_id INT NOT NULL,
  friend_id INT,
  total_price INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status ENUM('pending', 'paid', 'shipped', 'delivered', 'cancelled'),
  posted INT, -- 수정됨(04.10/type : VARCHAR(255)->INT)
  CONSTRAINT fk_order_product FOREIGN KEY (product_id)
    REFERENCES product(id) ON DELETE CASCADE, -- 추가됨(04.09)
  CONSTRAINT fk_order_customer FOREIGN KEY (customer_id)
    REFERENCES customer(id) ON DELETE CASCADE,
  CONSTRAINT fk_order_friend FOREIGN KEY (friend_id)
    REFERENCES friend(id)
);


SELECT * FROM customer;


DROP TABLE customer;
DROP TABLE seller;
DROP TABLE store;
DROP TABLE category;
DROP TABLE product;
DROP TABLE friend;
DROP TABLE orders;













--------------------------
show tables;
insert into tb1_board(boardName,boardTitle
,boardContent) values('aaa','aa','a');
select * from tb1_board;

select * from mvc_member;

delete from tb1_board
where bodeNo ='8';
 
 select boardNo, boardName, boardTitle, boardContent, boardDate, boardHit from tb1_board;

select boardNo,boardName,boardTitle,boardContent,boardDate,boardHit from tb1_board;
create table tb1_board
(boardNo int auto_increment primary key
 ,boardName varchar(20)
 ,boardTitle varchar(100)
 ,boardContent varchar(300)
 ,boardDate datetime default now()
 ,boardHit int default 0

);