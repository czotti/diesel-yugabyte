-- 3fd079dcabca2c6d474bfc24d8bd40fbe5e06932
-- 3fd079dc-abca2c6d-474bfc24-d8bd40fb-e5e06932
UPDATE mytable
    SET uuid = CONCAT(
        SUBSTRING(uuid, 0, 8), '-',
        SUBSTRING(uuid, 8, 8), '-',
        SUBSTRING(uuid, 16, 8), '-',
        SUBSTRING(uuid, 24, 8), '-',
        SUBSTRING(uuid, 32, 8)
    )
    WHERE uuid IS NOT NULL;