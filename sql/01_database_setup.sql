-- ============================================================
-- CONCEPT: CREATE DATABASE
-- PURPOSE:
-- Create a separate PostgreSQL database for this project.
--
-- WHY WE USE IT HERE:
-- All NutriScan tables and data will be stored inside one
-- dedicated database instead of mixing them with other projects.
-- ============================================================

CREATE DATABASE nutritional_label_database;


-- ============================================================
-- PSQL COMMAND: \connect
-- PURPOSE:
-- Switch the current PostgreSQL connection to the project database.
--
-- NOTE:
-- \connect is a psql command, not a regular SQL statement.
-- ============================================================

\connect nutritional_label_database