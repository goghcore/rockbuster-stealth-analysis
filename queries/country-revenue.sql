SELECT D.country, SUM(E.amount) AS revenue
FROM public.payment E
RIGHT JOIN public.customer A ON E.customer_id = A.customer_id
LEFT JOIN public.address B ON A.address_id = B.address_id
LEFT JOIN public.city C ON B.city_id = C.city_id
LEFT JOIN public.country D ON C.country_id = D.country_id
GROUP BY D.country
ORDER BY revenue DESC