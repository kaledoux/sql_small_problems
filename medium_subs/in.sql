SELECT name AS bid_on_items
FROM (SELECT *
      FROM items
      WHERE sales_price IS NOT NULL) AS bid_items;

SELECT name AS bid_on_items FROM items
  WHERE id IN (SELECT item_id FROM bids);
