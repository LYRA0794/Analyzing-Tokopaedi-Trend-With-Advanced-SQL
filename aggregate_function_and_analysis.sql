-- FUNGSI AGREGAT 


-- COUNT = menghitung banyaknya data/baris/rows
-- Ada berapa baris pada tabel di orders?
select 
	count (*) 
from orders
-- Kenapa bintang dikasih kurung? untuk menandakan parameter dari fungsi

-- Menggabungkan COUNT DISTINCT
-- Fungsinya, dapat menghitung banyaknya data yang berbeda

-- Hitung ada berapa banyak konsumen?
-- caranya, menghitung banyaknya customer id yang berbeda
select 
	count (distinct customer_id) 
from orders
--Kenapa menghitung using customer_id daripada customer_name?
--id(identifier), pastinya setiap customer memiliki id yang berbeda

--ada berapa banyak transaksi yang terjadi?
select 
	count (distinct order_id) 
from orders

--Berapa banyaknya baris yang profitnya di bawah 0?
select 
	count (*) 
from 
	orders
where
	profit < 0
	


--AVARAGE
--berapa avarage dari kolom sales
select 
	avg (sales) 
from 
	orders
	
	
	
--MIN, MAX
--berapa min, max dari kolom sales
select 
	min (sales) 
from 
	orders
	
select 
	max (sales) 
from 
	orders
	
	
---The end of Fungsi Agregat---
	
	

--GROUP BY
--jumlah sales dari tabel orders dikelompokkan based on segment!
select 
	segment,
	sum(sales) as total_sales
from 
	orders
group by 
	segment 

--hitung total sales untuk setiap segment di negara bagian california, florida dan kentucky
select 
	segment,
	sum(sales) as total_sales
from 
	orders
where 
	state in ('California', 'Florida', 'Kentucky')
group by 
	segment 
	
--hitung total sales berdasarkan segment, negara bagian
select 
	segment,
	state,
	sum(sales) as total_sales
from 
	orders
where 
	state in ('California', 'Florida', 'Kentucky')
group by 
	segment, state 
order by
	segment, state
	
--berapa banyaknya konsumen per negara bagian
select 
	state,
	count(distinct customer_id) as total_customer
from 
	orders
group by 
	state
order by
	state	
	
--negara bagian mana yang memiliki konsumen terbanyak?
select 
	state,
	count(distinct customer_id) as total_customer
from 
	orders
group by 
	state
order by
	total_customer desc	

--untuk setiap state, hitung banyaknya konsumen, total order
--total sales dan total profit
--pake AS atau pake spasi sekali, juga sama aja kok
select 
	state,
	count(distinct customer_id) as total_customer,
	count(distinct order_id) as total_order,
	sum(profit) as total_profit,
	sum(sales) as total_sales
from 
	orders
group by 
	state
order by
	state	



--HAVING
--customer prioritas-> total salesnya di atas 5000 dollar
--hitung total sales berdasarkan nama konsumen
--setelah group by, sudah dipastikan pake distinct
select 
	customer_name,
	sum(sales) as total_sales
from 
	orders
group by 
	customer_name 
--filter yang total salesnya di atas 5000 using 'having'
having
	sum(sales) > 5000
--where = tidak bisa berisi fungsi agregat
--having = bisa berisi fungsi agregat


--big customer base: tampilkan state dengan banyaknya konsumen lebih dari 200 orang
select
	state,
	count (distinct customer_id)
from 
	orders
group by 
	state 
having
	count (distinct customer_id) > 200	
order by
	count desc



--TRICK
--angka representasi dari kolom
--hanya bisa digunakan pada groupby dan orderby
select
	state, --(1)
	count (distinct customer_id) --(2)
from 
	orders
group by 
	1 
having
	count (distinct customer_id) > 200	
order by
	2 desc
	
	
	
--GRANULARITY = satuan terkecil dari data
--seamacam, row data dia menunjukkan apa? gitu
--buat tabel berisi
--order id, order date, ship date, customer id, customer name, 
--state, banyaknya jenis barang, total sales
select
	order_id,
	order_date,
	ship_date,
	customer_id,
	customer_name,
	state, 
	count(product_id),
	sum(sales) as total_sales
from 
	orders
group by 
	1, 2, 3, 4, 5, 6



--SUBQUERY atau CTE <- membungkus query
--kalo mau nambah CTE, tinggal tambah tanda koma aja ya
--dan WITH nya cukup ditulis satu kali aja
--tetapi antara cte dengan query utama itu jangan dikasih koma
WITH
orang_kaya as(
	select 
		customer_name,
		sum(sales) as total_sales
	from 
		orders
	group by 
		customer_name 
	having
		sum(sales) > 5000
)

--berapa banyak orang kaya?
--select count(*) from orang_kaya

--tampilkan 10 orang terkaya
select * from orang_kaya order by total_sales desc limit 10



--JAWABAN SOAL NO 1 == produk bestselling berdasarkan kuantitas barang yang terjual
select
	distinct product_name,
	sum (quantity) as total
from
	orders
group by
	1
order by
	2 desc
limit 1

--JAWABAN SOAL NO 2 = You want to give a promo to 100 individual consumers (segment = 'Consumer') with the highest order value. Make a list of these consumers!
select
	customer_id,
	customer_name,
	count (order_id) as total_order
from
	orders
where
	segment = 'Consumer'
group by
	1, 2 
order by
	3 desc
limit 100

--JAWABAN NO.3 = A consumer named Joel Eaton asked for a transaction record containing 
--what products were purchased and their quantity while he was a Tokopaedi customer. 
--Make the data summary!
select
	customer_name,
	segment,
	product_name, 
	sum (quantity) as total_order
from
	orders
where
	customer_name = 'Joel Eaton' and segment = 'Consumer'
group by 1, 2, 3
order by 4 desc
	
--JAWABAN NO.4 = On what date did Tokopaedi receive the most orders?=
select
	order_date,
	count (order_id)
from
	orders
group by 1
order by 2 desc

--JAWABAN NO.5 = Produk apa yang memiliki rata-rata keuntungan terbesar per unit terjualnya?
select
	product_name,
	avg (profit)
from
	orders
group by 1
order by 2 desc
limit 1
	
	
	






	
	
	
	
	
	
	
