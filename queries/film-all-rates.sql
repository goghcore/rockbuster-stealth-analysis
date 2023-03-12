SELECT F.film_id, F.rental_duration, F.rental_rate, F.length, F.replacement_cost
FROM public.film F
ORDER BY F.rental_duration