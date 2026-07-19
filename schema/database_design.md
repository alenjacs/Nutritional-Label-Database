# NutriScan Label Database Design

## Project purpose

This PostgreSQL database stores nutrition information entered manually by a user.

A product must have a name and at least one nutrition value. Most nutrition values are optional because a user may only know values such as calories, protein, and carbohydrates.

---

## Table 1: products

Stores information that identifies the food product.

| Column | Purpose |
|---|---|
| product_id | Unique identifier for each product |
| product_name | Name of the product |
| brand | Product brand; optional |
| created_at | Date and time the product was added |

---

## Table 2: nutrition_facts

Stores the nutrition information belonging to a product.

| Column | Purpose |
|---|---|
| nutrition_id | Unique identifier for the nutrition record |
| product_id | Connects the nutrition record to a product |
| serving_size_value | Numeric serving size; optional |
| serving_size_unit | Unit such as g, ml, or item; optional |
| calories | Calories per serving; optional |
| protein_g | Protein in grams; optional |
| carbohydrates_g | Carbohydrates in grams; optional |
| fat_g | Total fat in grams; optional |
| sugar_g | Sugar in grams; optional |
| fibre_g | Fibre in grams; optional |
| sodium_mg | Sodium in milligrams; optional |

---

## Relationship

One product has one nutrition-facts record.

The `product_id` column in `nutrition_facts` will be a foreign key referencing `products`.

A `UNIQUE` constraint on `nutrition_facts.product_id` will prevent one product from receiving multiple nutrition records.

---

## Validation rules

1. `product_name` cannot be empty.
2. Nutrition values cannot be negative.
3. Nutrition fields may contain `NULL`.
4. At least one nutrition value must be provided.
5. Deleting a product should also delete its nutrition record.