EXPLAIN ANALYZE SELECT MAX(bid_counts.count) FROM
(SELECT COUNT(bidder_id) FROM bids GROUP BY bidder_id) AS bid_counts;

-- QUERY PLAN
-- ---------------------------------------------------------------------------------------------------------------
--  Aggregate  (cost=37.15..37.16 rows=1 width=8) (actual time=0.079..0.080 rows=1 loops=1)
--    ->  HashAggregate  (cost=32.65..34.65 rows=200 width=12) (actual time=0.067..0.073 rows=6 loops=1)
--          Group Key: bids.bidder_id
--          ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.017..0.027 rows=26 loops=1)
--  Planning time: 0.221 ms
--  Execution time: 0.185 ms
-- (6 rows)


EXPLAIN ANALYZE SELECT COUNT(bidder_id) AS max_bid FROM bids
  GROUP BY bidder_id
  ORDER BY max_bid DESC
  LIMIT 1;

  -- QUERY PLAN
  -- ---------------------------------------------------------------------------------------------------------------------
  --  Limit  (cost=35.65..35.65 rows=1 width=12) (actual time=0.133..0.134 rows=1 loops=1)
  --    ->  Sort  (cost=35.65..36.15 rows=200 width=12) (actual time=0.132..0.132 rows=1 loops=1)
  --          Sort Key: (count(bidder_id)) DESC
  --          Sort Method: top-N heapsort  Memory: 25kB
  --          ->  HashAggregate  (cost=32.65..34.65 rows=200 width=12) (actual time=0.063..0.069 rows=6 loops=1)
  --                Group Key: bidder_id
  --                ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.013..0.023 rows=26 loops=1)
  --  Planning time: 0.271 ms
  --  Execution time: 0.227 ms
  -- (9 rows)

-- FURTHER
EXPLAIN ANALYZE SELECT items.name,
  (SELECT COUNT(item_id)
   FROM bids
   WHERE bids.item_id = items.id)
FROM items;

-- QUERY PLAN
-- -------------------------------------------------------------------------------------------------------------
--  Seq Scan on items  (cost=0.00..25455.20 rows=880 width=40) (actual time=0.028..0.068 rows=6 loops=1)
--    SubPlan 1
--      ->  Aggregate  (cost=28.89..28.91 rows=1 width=8) (actual time=0.008..0.008 rows=1 loops=6)
--            ->  Seq Scan on bids  (cost=0.00..28.88 rows=8 width=4) (actual time=0.003..0.006 rows=4 loops=6)
--                  Filter: (item_id = items.id)
--                  Rows Removed by Filter: 22
--  Planning time: 0.125 ms
--  Execution time: 0.107 ms
-- (8 rows)


EXPLAIN ANALYZE SELECT items.name, COUNT(bids.item_id)  as count FROM items
LEFT OUTER JOIN bids ON item_id = items.id
GROUP BY bids.item_id, items.name;
-- QUERY PLAN
-- ---------------------------------------------------------------------------------------------------------------------
-- HashAggregate  (cost=70.21..85.31 rows=1510 width=44) (actual time=0.208..0.236 rows=6 loops=1)
-- Group Key: bids.item_id, items.name
-- ->  Hash Right Join  (cost=29.80..58.89 rows=1510 width=36) (actual time=0.108..0.160 rows=27 loops=1)
-- Hash Cond: (bids.item_id = items.id)
-- ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.010..0.020 rows=26 loops=1)
-- ->  Hash  (cost=18.80..18.80 rows=880 width=36) (actual time=0.044..0.045 rows=6 loops=1)
-- Buckets: 1024  Batches: 1  Memory Usage: 9kB
-- ->  Seq Scan on items  (cost=0.00..18.80 rows=880 width=36) (actual time=0.022..0.027 rows=6 loops=1)
-- Planning time: 0.389 ms
-- Execution time: 0.417 ms
-- (10 rows)
