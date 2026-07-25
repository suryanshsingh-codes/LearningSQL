--STRING FUNCTIONS--

--1. upper: convert into upper case
select upper(name) from products;

--2. lower: convert into lower case
select lower(sku_code) from products;

--3. length: length of the elements of one col
select length(name)from products;

--4. substring(string,start location, number of char you want to extract), INDEX START FROM 1
select substring('hello world',1,2);

--5. left(string name, n elements): leftmost n element and rightmost n element of a substring
select left('helloworld',5);
select right('helloworld',5);

--6. concat(string1, 'separator', string2)
select concat('hello','','world');
select concat('hello','*','world');
select concat('hello',' ','world');


--7. concat_ws(string1, 'separator', string2): concate with separator
select concat_ws(':','hello','world');
select concat_ws('','hello','world');
select concat_ws('*****','hello','world');

--8. replace(main string, part to be replaced, replacaement)
select replace('brother is mine', left('brother is mine', 5), '12345');

--9. trim(string): remove all the sapces
select trim('hello the world is a hell');