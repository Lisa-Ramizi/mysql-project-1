select * from users where name Like '%a' or '%e';
select * from users where email like '%@hotmail%';
select * from orders 
left join users 
on orders.user_id = users.id
where users.phone like '044%';
SELECT * FROM author WHERE origin = 'USA';









