SELECT MIN(film_id) AS min_film_id,
       MAX(film_id) AS max_film_id,
	   	   
       MIN(release_year) AS min_release_year,
       MAX(release_year) AS max_release_year,
       mode() WITHIN GROUP(ORDER BY release_year) AS mode_release_year,

       MIN(language_id) AS min_language_id,
       MAX(language_id) AS max_language_id,
       mode() WITHIN GROUP(ORDER BY language_id) AS mode_language_id,
	   
       MIN(rental_duration) AS min_rental_duration,
       MAX(rental_duration) AS max_rental_duration,
       AVG(rental_duration) AS avg_rental_duration,
	   
	     MIN(rental_rate) AS min_rent,
       MAX(rental_rate) AS max_rent,
       AVG(rental_rate) AS avg_rent,
	   
       MIN(length) AS min_length,
       MAX(length) AS max_length,
       AVG(length) AS avg_length,
	   
	     MIN(replacement_cost) AS min_replacement_cost,
       MAX(replacement_cost) AS max_replacement_cost,
       AVG(replacement_cost) AS avg_replacement_cost,
	   
       mode() WITHIN GROUP(ORDER BY rating) AS mode_rating,

	     MIN(last_update) AS min_last_update,
       MAX(last_update) AS max_last_update,
       mode() WITHIN GROUP(ORDER BY last_update) AS mode_last_update,
	   
       mode() WITHIN GROUP(ORDER BY special_features) AS mode_special_features
FROM public.film