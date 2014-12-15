-- To aggregate rows into 2 dimensional arrays see the following custom aggregate by Erwin Brandstetter
-- http://stackoverflow.com/questions/9832973/initial-array-in-function-to-aggregate-multi-dimensional-array

CREATE AGGREGATE public.array_agg_mult (anyarray)  (
    SFUNC     = array_cat
   ,STYPE     = anyarray
   ,INITCOND  = '{}'
);

-- E.g.
-- TEST=# SELECT array_agg_mult(ARRAY[ARRAY[a,b]]) 
--        FROM (SELECT 1 AS a, 2 AS b UNION SELECT 2 AS a, 4 AS b) t;
--  array_agg_mult
-- ----------------
--  {{1,2},{2,4}}
-- (1 row)       
