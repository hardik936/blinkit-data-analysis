--updating the value in given folder to make it uniform
update blinkit_data
set item_fat_content=
case 
when item_fat_content in ('low fat','LF') then 'Low Fat'
when item_fat_content = 'reg' then 'Regular'
else item_fat_content
end

--checking to see the data updated properly or not
select * from blinkit_data;

--using distinct to check if other than wanted value(2) anything is present or not
select distinct(item_fat_content) from blinkit_data;

--finding the total sum of sales done by blinkit
select sum(sales) as total_sales
from blinkit_data;

--finding the total sum of sales done by blinkit in millions
select cast(sum(sales)/1000000 as decimal(10,2)) as total_sales
from blinkit_data;

--finding the average sales done by the stores
select cast(avg(sales) as decimal(10,1)) as average_sales
from blinkit_data;

--finding the total number of items sold
select count(*) from blinkit_data;

--finding the total sales done by the low fat items in millions
select cast(sum(sales)/1000000 as decimal(10,2)) as low_fat_sales
from blinkit_data
where item_fat_content = 'Low Fat';

--finding the average rating 
select cast(avg(rating) as decimal(10,2)) as average_rating
from blinkit_data;

-- Get total and average sales, item count, and average rating
-- for each fat content type, sorted by total sales (in millions).
select item_fat_content,
	 cast(sum(sales)/1000 as decimal(10,2)) as total_sales,
	 cast(avg(sales) as decimal(10,1)) as average_sales,
	 count(*) as no_of_items,
	 cast(avg(rating) as decimal(10,2)) as average_rating
From blinkit_data
group by item_fat_content
order by total_sales desc;

--top 5 item type by sales 
select item_type,
	 cast(sum(sales) as decimal(10,2)) as total_sales,
	 cast(avg(sales) as decimal(10,1)) as average_sales,
	 count(*) as no_of_items,
	 cast(avg(rating) as decimal(10,2)) as average_rating
From blinkit_data
group by item_type
order by total_sales desc
limit 5;

--fat content by outlet for total sales



	 









