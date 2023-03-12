SELECT D.country,
COUNT(customer_id) AS customer_count
FROM public.customer A
LEFT JOIN public.address B ON A.address_id = B.address_id
LEFT JOIN public.city C ON B.city_id = C.city_id
LEFT JOIN public.country D ON C.country_id = D.country_id
GROUP BY country
ORDER BY customer_count DESC