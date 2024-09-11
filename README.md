# Diesel + Yugabyte

I got an issue when trying to run a migration with yugabyte.

To replicate the issue do the following.
```bash
# 1. Install dependencies
apt install libpg postgresql-client
# 2. Create the database for our tests. I take for granted that a yugabyte db is running
# and a user is already created to interact with the database.
psql -h yb-tserver.local -p 5433 -d yugabyte -U yugabyte -c "CREATE DATABASE db1 OWNER user;"
# 3. Install diesel_cli to use their migration.
cargo install diesel_cli --no-default-features --features postgres
# 4. Clone this repository to run the migration.
git clone https://github.com/czotti/diesel-yugabyte.git
# 5. Run the migration with diesel
diesel migration run --database-url 'postgres://user:password@yugabyte_addr.fqdn/db1
```
# Issue
This is the output I get when running the diesel migration on a fresh database
```bash
❯ diesel migration run --database-url 'postgres://user:password@yb-tserver.local:5433/db1'
Running migration 2024-09-10-190931_init
Running migration 2024-09-10-191017_change_uuid
Running migration 2024-09-11-120055_update_uuid
Failed to run 2024-09-11-120055_update_uuid with: schema version mismatch for table 0000460a00003000800000000000400a: expected 3, got 2

❯ diesel migration run --database-url 'postgres://user:password@yb-tserver.local:5433/db1'
Running migration 2024-09-11-120055_update_uuid
```

I need to retry the migration and it works.

# Workaround

I have found about the use of `metadata.toml` file in diesel and adding this file with
```bash
echo "run_in_transaction = false" > migrations/2024-09-11-120055_update_uuid/metadata.toml
```

Fix the above issue.

Also removing the `UPDATE` sql part obvioulsy avoid this issue.