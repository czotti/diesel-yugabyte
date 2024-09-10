-- 3fd079dc-abca2c6d-474bfc24-d8bd40fb-e5e06932
-- 3fd079dcabca2c6d474bfc24d8bd40fbe5e06932
UPDATE Study SET uuid = REPLACE(uuid, '-', '') WHERE uuid IS NOT NULL;

ALTER TABLE Study ALTER COLUMN uuid TYPE VARCHAR(40);
