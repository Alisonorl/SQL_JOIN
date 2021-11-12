#List number of films per category.
#Display the first and last names, as well as the address, of each staff member.
#Display the total amount rung up by each staff member in August of 2005.
#List each film and the number of actors who are listed for that film.
#Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

use sakila;

select name, category_id, count(film_id) from category c
left join film_category  fc using (category_id)
group by category_id;

select first_name, last_name, address from staff s
left join address ad using (address_id);

select payment_date from payment;

select first_name, last_name, sum(amount) as amount_rung_up from staff sf
left join payment pt using (staff_id)
where payment_date like '2005-08%'
group by staff_id;

select title, count(actor_id) as nb_actor from film
left join film_actor using (film_id)
group by title;

select customer_id, first_name, last_name, sum(amount) from payment p
left join customer c using(customer_id)
group by customer_id
order by last_name asc;


