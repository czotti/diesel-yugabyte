-- Your SQL goes here
UPDATE mytable
    SET uuid = CONCAT(
        SUBSTRING(uuid, 0, 8), '-',
        SUBSTRING(uuid, 8, 8), '-',
        SUBSTRING(uuid, 16, 8), '-',
        SUBSTRING(uuid, 24, 8), '-',
        SUBSTRING(uuid, 32, 8)
    )
    WHERE uuid IS NOT NULL;