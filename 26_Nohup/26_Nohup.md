# 36. Using nohup

`nohup` stands for no hang up. It is used to run a command so it keeps running even if the terminal session is closed.

## Why Use nohup

Normally, a process can stop when you close the terminal. With `nohup`, the command ignores the hangup signal and continues running.

## Example Script (26_nohup.sh)

This script starts a background job with `nohup` and sends the output to a file.

```bash
#!/bin/bash

echo "Starting nohup demo"

# Run a command in the background and keep it alive after logout.
nohup bash -c 'for i in 1 2 3 4 5; do echo "Log line $i"; sleep 1; done' > nohup_demo.out 2>&1 &

echo "Background process started"
echo "Output will be written to nohup_demo.out"
echo "Check the process with: ps -ef | grep bash"
```

## Important Points

* `nohup` prevents the process from stopping when the terminal closes.
* `> nohup_demo.out 2>&1` stores both standard output and errors in one file.
* `&` sends the job to the background.

## How to Run

```bash
bash 26_nohup.sh
```

After running it, you can check the generated output file:

```bash
cat nohup_demo.out
```