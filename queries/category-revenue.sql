SELECT
    CA.name AS category,
    SUM(E.amount) AS revenue
FROM public.payment E
RIGHT JOIN public.customer A ON E.customer_id = A.customer_id
LEFT JOIN public.rental R ON E.rental_id = R.rental_id
LEFT JOIN public.inventory I ON R.inventory_id = I.inventory_id
LEFT JOIN public.film F ON I.film_id = F.film_id
LEFT JOIN public.film_category FC ON F.film_id = FC.film_id
LEFT JOIN public.category CA ON FC.category_id = CA.category_id
GROUP BY CA.name
ORDER BY revenue DESC;