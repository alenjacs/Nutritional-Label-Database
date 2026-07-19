-- ============================================================
-- CONCEPT: CREATE TABLE
-- PURPOSE:
-- Define the structure and validation rules for stored data.
--
-- WHY WE USE IT HERE:
-- The products table stores the basic identity of each food
-- product before its nutrition information is added.
-- ============================================================

CREATE TABLE products (
    product_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    product_name TEXT NOT NULL
        CHECK (BTRIM(product_name) <> ''),

    brand TEXT,

    created_at TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP
);


-- ============================================================
-- CONCEPT: FOREIGN KEY AND ONE-TO-ONE RELATIONSHIP
-- PURPOSE:
-- Connect nutrition information to the product it belongs to.
--
-- WHY WE USE IT HERE:
-- Product details and nutrition values are stored separately,
-- but every nutrition record must belong to a valid product.
-- ============================================================

CREATE TABLE nutrition_facts (
    nutrition_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    product_id BIGINT NOT NULL UNIQUE
        REFERENCES products(product_id)
        ON DELETE CASCADE,

    serving_size_value NUMERIC(8, 2),
    serving_size_unit TEXT,

    calories NUMERIC(8, 2),
    protein_g NUMERIC(8, 2),
    carbohydrates_g NUMERIC(8, 2),
    fat_g NUMERIC(8, 2),
    sugar_g NUMERIC(8, 2),
    fibre_g NUMERIC(8, 2),
    sodium_mg NUMERIC(8, 2),

    CHECK (serving_size_value IS NULL OR serving_size_value > 0),

    CHECK (calories IS NULL OR calories >= 0),
    CHECK (protein_g IS NULL OR protein_g >= 0),
    CHECK (carbohydrates_g IS NULL OR carbohydrates_g >= 0),
    CHECK (fat_g IS NULL OR fat_g >= 0),
    CHECK (sugar_g IS NULL OR sugar_g >= 0),
    CHECK (fibre_g IS NULL OR fibre_g >= 0),
    CHECK (sodium_mg IS NULL OR sodium_mg >= 0),

    CHECK (
        calories IS NOT NULL
        OR protein_g IS NOT NULL
        OR carbohydrates_g IS NOT NULL
        OR fat_g IS NOT NULL
        OR sugar_g IS NOT NULL
        OR fibre_g IS NOT NULL
        OR sodium_mg IS NOT NULL
    )
);