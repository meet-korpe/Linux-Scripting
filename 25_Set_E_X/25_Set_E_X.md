# 35. Using set -e and set -x

In Bash, `set -e` and `set -x` are useful options for safer scripts and easier debugging.

## `set -e`

When `set -e` is enabled, the script exits immediately if any command returns a non-zero status.

## `set -x`

When `set -x` is enabled, Bash prints each command before running it. This helps you trace what the script is doing.

## Example Script (25_set_e_x.sh)

This script shows both options together.

```bash
#!/bin/bash

set -e
set -x

echo "Starting the demo"
mkdir -p demo_output
touch demo_output/example.txt
ls demo_output

# Uncomment the next line to see set -e stop the script immediately.
# ls /does-not-exist

echo "Script finished successfully"
```

## What You Will See

* `set -x` prints each command with a `+` prefix before execution.
* `set -e` stops the script as soon as a command fails.
* Together, they are helpful when debugging shell scripts.

## Example

Run the script with:

```bash
bash 25_set_e_x.sh
```