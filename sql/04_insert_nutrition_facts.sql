-- ============================================================
-- CONCEPT: INSERT WITH A FOREIGN KEY
-- PURPOSE:
-- Add nutrition information connected to an existing product.
--
-- WHY WE USE IT HERE:
-- The product already exists with product_id 1.
-- This nutrition record belongs specifically to that product.
--
-- Only some nutrition values are provided. Columns that are
-- omitted from the INSERT will automatically contain NULL.
-- ============================================================

INSERT INTO nutrition_facts (
    product_id,
    serving_size_value,
    serving_size_unit,
    calories,
    protein_g,
    carbohydrates_g
)
VALUES (
    1,
    170,
    'g',
    100,
    17,
    6
)
RETURNING
    nutrition_id,
    product_id,
    serving_size_value,
    serving_size_unit,
    calories,
    protein_g,
    carbohydrates_g,
    fat_g,
    sugar_g;