SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

EXPLAIN SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);
-- RESULTS
-- QUERY PLAN
-- --------------------------------------------------------------------------
--  Hash Join  (cost=33.38..66.47 rows=635 width=32)
--    Hash Cond: (bidders.id = bids.bidder_id)
--    ->  Seq Scan on bidders  (cost=0.00..22.70 rows=1270 width=36)
--    ->  Hash  (cost=30.88..30.88 rows=200 width=4)
--          ->  HashAggregate  (cost=28.88..30.88 rows=200 width=4)
--                Group Key: bids.bidder_id
--                ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4)
-- (7 rows)

-- with analyzis on run
EXPLAIN ANALYZE SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);
-- RESULTS
-- QUERY PLAN
-- ---------------------------------------------------------------------------------------------------------------------
--  Hash Join  (cost=33.38..66.47 rows=635 width=32) (actual time=0.096..0.106 rows=6 loops=1)
--    Hash Cond: (bidders.id = bids.bidder_id)
--    ->  Seq Scan on bidders  (cost=0.00..22.70 rows=1270 width=36) (actual time=0.016..0.019 rows=7 loops=1)
--    ->  Hash  (cost=30.88..30.88 rows=200 width=4) (actual time=0.065..0.065 rows=6 loops=1)
--          Buckets: 1024  Batches: 1  Memory Usage: 9kB
--          ->  HashAggregate  (cost=28.88..30.88 rows=200 width=4) (actual time=0.052..0.058 rows=6 loops=1)
--                Group Key: bids.bidder_id
--                ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.009..0.022 rows=26 loops=1)
--  Planning time: 0.431 ms
--  Execution time: 0.194 ms
-- (10 rows)
