SELECT COUNT(DISTINCT R.rental_id) AS rental_count,
COUNT(DISTINCT A.customer_id) AS customer_count,
COUNT(DISTINCT D.country_id) AS country_count,
COUNT(DISTINCT C.city_id) AS city_count
FROM public.customer A
LEFT JOIN public.rental R ON A.customer_id = R.customer_id
LEFT JOIN public.address B ON A.address_id = B.address_id
RIGHT JOIN public.city C ON B.city_id = C.city_id
RIGHT JOIN public.country D ON C.country_id = D.country_id