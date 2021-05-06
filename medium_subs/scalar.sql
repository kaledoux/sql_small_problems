SELECT COUNT(item_id) FROM bids
  WHERE bids.id = items.id
  GROUP BY item_id;

SELECT items.name,
                   (SELECT COUNT(item_id)
                    FROM bids
                    WHERE bids.item_id = items.id)
FROM items;

SELECT items.name, COUNT(bids.item_id)  as count FROM items
LEFT OUTER JOIN bids ON item_id = items.id
GROUP BY bids.item_id, items.name;
