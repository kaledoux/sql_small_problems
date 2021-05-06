SELECT bid_totals AS max
FROM (SELECT COUNT(bidder_id)
      FROM bids
      GROUP BY bidder_id) AS bid_totals
ORDER BY bid_totals DESC LIMIT 1;

SELECT COUNT(bidder_id) FROM bids
  GROUP BY bidder_id;

-- solution
SELECT MAX(count) FROM
  (SELECT COUNT(bidder_id) FROM bids
  GROUP BY bidder_id) AS count;
