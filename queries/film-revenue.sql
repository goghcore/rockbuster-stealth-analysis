SELECT F.film_id, F.title, F.release_year, SUM(E.amount) AS revenue
FROM public.payment E
RIGHT JOIN public.rental R ON E.rental_id = R.rental_id
LEFT JOIN public.inventory I ON R.inventory_id = I.inventory_id
LEFT JOIN public.film F ON I.film_id = F.film_id
GROUP BY F.film_id, F.title, F.release_year
ORDER BY revenue DESC