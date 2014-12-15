2d_arrays
==========

Just a couple of functions and an aggregate for working with multidimensional (2 dimensional) arrays in PostgreSQL.

Usage
-----

```sql
TEST=# select unnest_element(ARRAY[ARRAY[1,2,3],ARRAY[4,5,6]],3);
 unnest_element
----------------
              3
              6
(2 rows)

TEST=# select unnest_first(ARRAY[ARRAY[1,2,3],ARRAY[4,5,6]]);
 unnest_dimension
------------------
 {1,2,3}
 {4,5,6}
(2 rows)

-- (Ref http://stackoverflow.com/questions/9832973/initial-array-in-function-to-aggregate-multi-dimensional-array)
TEST=# SELECT array_agg_mult(ARRAY[ARRAY[a,b]]) 
       FROM (SELECT 1 AS a, 2 AS b UNION SELECT 2 AS a, 4 AS b) t;
 array_agg_mult
----------------
 {{1,2},{2,4}}
(1 row) 
```
