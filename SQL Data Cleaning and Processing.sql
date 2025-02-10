use aman;
select * from data1;
select product_name,brand_name from data;

select product_name, marked_price, discounted_price, 
         marked_price - discounted_price from data;
         
select product_name as 'Product Name', marked_price as 'Marked Price', discounted_price as 'Discounted Price', 
         marked_price - discounted_price as 'Discounted amount' from data;
         
select product_name,
marked_price,
discounted_price as 'Discounted Price', 
marked_price - discounted_price as 'Discounted amount',
round(((marked_price - discounted_price)/marked_price)*100,0) as 'Discounted Percent'
from data1;

-- create new column with mathematical functions | Making Discounted Amount
select product_name, brand_name, marked_price, discounted_price,
marked_price- discounted_price as 'Discounted amount' from data1;

select product_name, brand_name, marked_price, discounted_price,
marked_price- discounted_price as 'Discounted amount' ,
ROUND(((marked_price - discounted_price)/marked_price)*100,2) as 'Discounted Percent'
from data1;

select product_name, brand_name, marked_price, discounted_price,
marked_price- discounted_price as 'Discounted amount' ,
ROUND(((marked_price - discounted_price)/marked_price)*100,0) as 'Discounted Percent'
from data1;

select brand_name from data1;
select distinct brand_name from data1;
select count(distinct product_tag) from data1;

select count(marked_price),
 count(product_tag) from data1;
 
select count(product_link), count(distinct product_link) ,
count(product_link) - count(distinct product_link) as 'Dublicates',
round(((count(product_link) - count(distinct product_link))/ count(product_link))*100,2) as 'Dublicate %' 
from data1;

select * from myntra;
select brand_name from myntra;
select distinct brand_name from myntra;
select distinct product_tag from myntra;
select count(product_tag) from myntra;
select count(product_tag), count(product_tag) from myntra;
select count(distinct product_tag) from myntra;
select count(product_tag), count(marked_price) from myntra;
select count(product_tag), count(distinct(product_tag)) from myntra;
select count(product_link), count(distinct product_link) from myntra;
-- For dublicate products
select count(product_link), count(distinct product_link),
count(product_link) - count(distinct product_link) as "Dublicates",
round(((count(product_link) - count(distinct product_link))/count(product_link))*100,2) as "Dublicate Percent"
from myntra;
-- Finding Unique values
select count(brand_name) from myntra;
select count(distinct(brand_name)) from myntra;

select count(distinct(brand_name)) from myntra where product_tag = 'tshirts';
select count(distinct(brand_name)) from myntra where product_tag = 'shirts';

-- Adding where clause
select * from myntra where true;

-- Adding distinct with where | Unique products servred by adidas
select * from myntra where brand_tag = 'adidas';

-- Adding distinct with where | Unique products servred by adidas
select distinct * from myntra where brand_tag = 'adidas';

-- Products with multiple where clause with AND
select count(distinct(brand_tag)) from myntra
where product_tag = 'tshirts' and discounted_price < 1000;

-- name of brands selling shirts with price more than 5000
select distinct(brand_name) from myntra 
where product_tag = 'shirts' and discounted_price > 5000;

-- Different categories "Blackberry" serves under 5000rs
select distinct(brand_tag) from myntra
where brand_name = "nike" and discounted_price < 5000;

-- Nike tshirts between 2000 - 3000
select * from myntra
where brand_name = 'Nike' and product_tag = 'tshirts' and
discounted_price between 2000 and 3000;

-- tshirts between 2000 - 3000 from either nike or adidas.
select * from myntra
where brand_name = 'Nike' and 'adidas' and
discounted_price between 2000 and 3000;

select * from myntra where brand_name = 'Nike' and 'adidas' and product_tag = 'tshirts' and discounted_price > 2000 and discounted_price <5000;

select * from myntra where brand_name = 'Nike' or brand_name = 'adidas' and product_tag = 'tshirts' and discounted_price between 2000 and 3000;

select * from myntra where brand_name = 'Nike' or brand_name = 'adidas' and (product_tag = 'tshirts' or product_tag 'pants')  and discounted_price between 2000 and 3000;

select * from myntra where brand_name = 'Nike' or brand_name = 'adidas' and discounted_price between 2000 and 3000;

-- Adding more filters
select distinct * from myntra 
where brand_tag = 'adidas' and (discounted_price between 3000 and 8000) and rating > 4;

select distinct * from myntra 
where brand_tag = 'adidas' and (discounted_price between 2000 and 8000) and rating > 4 and rating_count = 10;

-- Using OR
select distinct * from myntra 
where (brand_tag = 'adidas' and brand_tag = 'puma') and
(discounted_price between 2000 and 5000);

 -- Using NOT
select distinct * from myntra 
where not (brand_tag = 'adidas') and
(discounted_price between 2000 and 5000);

-- Using IN
select distinct * from myntra 
where brand_name in ('adidas','Puma') and
(discounted_price between 2000 and 5000);

-- Using NOT IN
select distinct * from myntra 
where brand_name not in ('adidas','Puma') and
(discounted_price between 2000 and 5000);
select distinct * from myntra 
where brand_name not in ('adidas','Puma') and
(discounted_price between 2000 and 5000);

use ashish;
select * from myntra;
select * from myntra order by discounted_price;
select * from myntra order by discounted_price desc;
select * from myntra order by rating desc;
select * from myntra where rating_count > 1000 order by rating;

# 1. Best rated wallets with rating more than 4.5 and rating_count 100'
select * from myntra where product_tag = 'wallets' and rating > 4.5 and rating_count > 100 order by rating_count desc;

# 2. Best rated tshirts from nike/adidas with rating more than 4.5 and rating_count 100 and prices 1000-3000.
select * from myntra where product_tag = 'tshirts' and brand_name = 'adidas' or brand_name = 'nike' and rating > 4.5 and rating_count > 100 and discounted_price > 1000 and discounted_price < 3000;
select * from myntra where product_tag = 'tshirts' and brand_name in ('adidas','nike') and rating > 4.5 and rating_count > 100 and discounted_price > 1000 and discounted_price < 3000;
select * from myntra where product_tag = 'tshirts' and brand_name = 'adidas' or brand_name = 'nike' and rating > 4.5 and rating_count > 100 and discounted_price between 1000 and 3000;
-- 3. Best rated wallets with rating more than 4.5 and rating_count 100 and total rating count'
select * from myntra where product_tag = 'wallets' and rating > 4.5 and rating_count = 100;

# 2. Find the least expensive product on myntra.
select * from myntra order by discounted_price asc limit 1;
select min(discounted_price) from myntra;
select * from myntra where discounted_price = 49;
select * from myntra order by discounted_price asc limit 10;
select * from myntra order by discounted_price asc limit 5;
select * from myntra order by discounted_price asc limit 5,5;
# 2. Find the least expensive product on myntra.
select * from myntra order by discounted_price asc limit 1,0;
select * from myntra order by discounted_price asc limit 5,5;
-- Most expensive product
select * from myntra order by discounted_price desc limit 10;
-- 
select * from myntra order by discounted_price desc limit 5;
select * from myntra order by discounted_price desc limit 5,5;

#3. Find fifth most expensive product
select * from myntra order by discounted_price asc limit 4,1;

# 3. Most expensive product.
select max(discounted_price) from myntra;
select * from myntra where discounted_price = 45900;
select * from myntra order by discounted_price desc limit 1;

# 3 Finding the top 5 most expensive products on myntra.
select * from myntra order by discounted_price desc limit 5;

# 4 Top 5 products based on best rating | rating*rating_count
select *, round(rating*rating_count,0) as 'rating_filter' from myntra 
order by rating_filter desc limit 5;

# 5 Finding the second most expensive product.
select * from myntra order by discounted_price desc limit 1,1;

# 6 Finding the second least expensive product.
select * from myntra order by discounted_price desc;
select * from myntra where discounted_price = 45599 ; 

#7 Finding the tenth most expensive product
select * from myntra order by discounted_price desc limit 9,1;
select * from myntra order by discounted_price desc;
select * from myntra where discounted_price = 41900;

#8 Finding the worst rated product by nike.
	select *, (rating*rating_count) as 'rating_filter' from myntra
	where brand_name = 'Nike' and rating != 0
	order by rating_filter asc limit 1;
select * from mynta order by rating asc;
select * from myntra where product_name = 'Nike' and order by rating asc; 
#9 Find the worst rated product by nike and rating is not zero.
select * from myntra order by product_name;
