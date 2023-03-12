SELECT A.customer_id, A.first_name, A.last_name,
       D.country,
       C.city,
	   COUNT(A.customer_id) AS rental_count,
       AVG(E.amount) AS avg_spending,
	   SUM(E.amount) AS total_spending
FROM public.payment E
RIGHT JOIN public.customer A ON E.customer_id = A.customer_id
LEFT JOIN public.address B ON A.address_id = B.address_id
LEFT JOIN public.city C ON B.city_id = C.city_id
LEFT JOIN public.country D ON C.country_id = D.country_id
WHERE C.city IN (
                 SELECT C.city
                 FROM public.city C
                 RIGHT JOIN public.address B
                            ON C.city_id = B.city_id
                 LEFT JOIN public.country D
                            ON C.country_id = D.country_id
                 RIGHT JOIN public.customer A
                            ON B.address_id = A.address_id
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
                                     )
                 GROUP BY C.city, D.country
                 ORDER BY COUNT(customer_id) DESC
                 )
GROUP BY A.customer_id, A.first_name, A.last_name,
         D.country,
         C.city
ORDER BY avg_spending DESC