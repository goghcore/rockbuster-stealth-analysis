SELECT C.city,
       D.country,
       COUNT(A.customer_id) AS customer_count
FROM public.customer A
LEFT JOIN public.address B ON A.address_id = B.address_id
LEFT JOIN public.city C ON B.city_id = C.city_id
LEFT JOIN public.country D ON C.country_id = D.country_id
           WHERE D.country IN (
                               SELECT D.country
                               FROM public.customer A
                               LEFT JOIN public.address B 
                                          ON A.address_id = B.address_id
                               LEFT JOIN public.city C 
                                          ON B.city_id = C.city_id
                               LEFT JOIN public.country D 
                                          ON C.country_id = D.country_id
                               GROUP BY country
                               ORDER BY COUNT(customer_id) DESC
                               LIMIT 10
                               )
GROUP BY C.city, D.country
ORDER BY customer_count DESC