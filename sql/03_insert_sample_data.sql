-- ============================================================
-- CONCEPT: INSERT
-- PURPOSE:
-- Add a new row to a database table.
--
-- WHY WE USE IT HERE:
-- A nutrition label must first belong to a product.
-- This statement adds the product information.
-- ============================================================

INSERT INTO products (
    product_name,
    brand
)
VALUES (
    'Plain Greek Yogurt',
    'Example Brand'
)
RETURNING
    product_id,
    product_name,
    brand,
    created_at;