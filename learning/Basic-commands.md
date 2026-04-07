# Complete Linux DevOps Reference Guide

## Table of Contents

1. [File Viewing & Editing](#1-file-viewing--editing)
2. [Directory & File Management](#2-directory--file-management)
3. [Links (Hard & Soft)](#3-links-hard--soft)
4. [Text Processing & Filtering](#4-text-processing--filtering)
5. [System & Processor Management](#5-system--processor-management)
6. [Searching & Finding](#6-searching--finding)
7. [Permissions & Ownership](#7-permissions--ownership)
8. [Disk & Storage Management](#8-disk--storage-management)
9. [Networking Essentials](#9-networking-essentials)
10. [Process Control](#10-process-control)
11. [Package Management](#11-package-management)
12. [Service Management (systemd)](#12-service-management-systemd)
13. [Scripting & Pipelining](#13-scripting--pipelining)
14. [Compression & Archiving](#14-compression--archiving)
15. [System Information & Monitoring](#15-system-information--monitoring)

---

## 1. File Viewing & Editing

| Command | Purpose                     | Essential Options                                         | DevOps Scenario                                   |
| ------- | --------------------------- | --------------------------------------------------------- | ------------------------------------------------- |
| `cat`   | View entire file            | `-n` (line numbers), `-A` (show all chars)                | Check config: `cat /etc/nginx/nginx.conf`         |
| `zcat`  | View compressed (.gz) files | None                                                      | Inspect rotated logs: `zcat /var/log/syslog.2.gz` |
| `tail`  | View end of file            | `-f` (follow), `-n 100` (lines), `-F` (follow with retry) | Monitor live logs: `tail -f /var/log/app.log`     |
| `head`  | View beginning of file      | `-n 50`, `-c 1000` (bytes)                                | Check CSV headers: `head -1 data.csv`             |
| `less`  | Interactive paging          | `-N` (line numbers), `/pattern` (search), `G` (end)       | Search large logs: `less -N /var/log/syslog`      |
| `more`  | Sequential paging           | `+n` (start at line n)                                    | Basic viewing: `more /etc/passwd`                 |
| `nano`  | Terminal text editor        | `-w` (disable wrap), `-B` (backup)                        | Quick config edit: `sudo nano /etc/hosts`         |

---

## 2. Directory & File Management

| Command | Purpose                               | Essential Options                                       | DevOps Scenario                                        |
| ------- | ------------------------------------- | ------------------------------------------------------- | ------------------------------------------------------ |
| `ls`    | List directory contents               | `-la` (all + details), `-lh` (human), `-lt` (time sort) | Find recent files: `ls -lt /var/log`                   |
| `cd`    | Change directory                      | `~` (home), `-` (previous), `..` (parent)               | Navigate to workspace: `cd /opt/application`           |
| `pwd`   | Print working directory               | None                                                    | Confirm path in scripts: `pwd`                         |
| `rm`    | Remove files/directories              | `-rf` (recursive force), `-i` (interactive)             | Clean temp files: `rm -rf /tmp/build/*`                |
| `rmdir` | Remove empty directories              | `-p` (remove parent if empty)                           | Remove empty folder: `rmdir empty_folder`              |
| `mkdir` | Create directories                    | `-p` (create parents), `-m` (set permissions)           | Create nested paths: `mkdir -p app/{config,logs,data}` |
| `touch` | Create empty file or update timestamp | None                                                    | Create lock file: `touch /var/lock/deploy.lock`        |
| `cp`    | Copy files/directories                | `-r` (recursive), `-p` (preserve), `-u` (update)        | Backup config: `cp -p /etc/nginx/nginx.conf /backup/`  |
| `mv`    | Move/rename files                     | `-i` (interactive), `-u` (update), `-v` (verbose)       | Archive old logs: `mv app.log archive/`                |
| `tree`  | Display directory tree                | `-L 2` (levels), `-d` (dirs only), `-h` (human)         | Document structure: `tree -L 3 /opt/app`               |

---

## 3. Links (Hard & Soft)

| Link Type               | Command               | Characteristics                             | DevOps Scenario                                                     |
| ----------------------- | --------------------- | ------------------------------------------- | ------------------------------------------------------------------- |
| **Hard Link**           | `ln source target`    | Same inode, survives original deletion      | Backup strategy: `ln /etc/nginx/nginx.conf /backup/nginx.conf.hard` |
| **Soft Link (Symlink)** | `ln -s source target` | Different inode, breaks if original deleted | Version switching: `ln -sf /usr/bin/python3.9 /usr/bin/python`      |

**Real Scenario: Zero-downtime deployment with symlinks**

```bash
# Deploy new version while keeping old live
ln -sf /opt/app-v2.0 /opt/app-current
# Rollback instantly
ln -sf /opt/app-v1.9 /opt/app-current
```

---

## 4. Text Processing & Filtering

| Command | Purpose                    | Essential Options                                       | DevOps Scenario                                                          |
| ------- | -------------------------- | ------------------------------------------------------- | ------------------------------------------------------------------------ |
| `cut`   | Extract columns/fields     | `-d','` (delimiter), `-f1,3` (fields), `-c1-5` (chars)  | Parse CSV: `cut -d',' -f1,3 users.csv`                                   |
| `sort`  | Sort lines                 | `-n` (numeric), `-r` (reverse), `-k2` (key field)       | Sort by memory: `ps aux --sort=-%mem \| sort -k4 -rn`                    |
| `uniq`  | Report/omit repeated lines | `-c` (count), `-d` (dupes only), `-u` (unique only)     | Count IP hits: `cut -d' ' -f1 access.log \| sort \| uniq -c \| sort -rn` |
| `diff`  | Compare files line by line | `-u` (unified), `-y` (side by side), `-i` (ignore case) | Compare configs: `diff -u old.conf new.conf`                             |
| `wc`    | Count lines/words/bytes    | `-l` (lines), `-w` (words), `-c` (bytes)                | Count log entries: `grep ERROR app.log \| wc -l`                         |

**Complex Real Scenario: Analyze failed SSH attempts**

```bash
# Extract IPs, count occurrences, sort by highest
sudo cat /var/log/auth.log | grep "Failed password" | awk '{print $(NF-3)}' | sort | uniq -c | sort -rn | head -10
```

---

## 5. System & Processor Management

| Command  | Purpose                         | Essential Options                               | DevOps Scenario                                  |
| -------- | ------------------------------- | ----------------------------------------------- | ------------------------------------------------ |
| `lscpu`  | Display CPU architecture        | `-p` (parseable)                                | Check cores: `lscpu \| grep "^CPU(s):"`          |
| `nproc`  | Show number of processing units | `--all` (all cores)                             | Set parallel jobs: `make -j $(nproc)`            |
| `top`    | Real-time process viewer        | `-u user` (filter), `-p PID` (specific)         | Monitor resource usage: `top -u www-data`        |
| `htop`   | Interactive process viewer      | F6 (sort), F9 (kill), F5 (tree)                 | Better top: `htop`                               |
| `mpstat` | CPU statistics per processor    | `-P ALL` (all CPUs), `1` (interval)             | Detect single core bottleneck: `mpstat -P ALL 2` |
| `uptime` | System load averages            | None                                            | Check health: `uptime` (1,5,15 min load)         |
| `ulimit` | User limits                     | `-a` (all), `-n` (open files), `-u` (processes) | Prevent FD exhaustion: `ulimit -n 65535`         |

---

## 6. Searching & Finding

| Command   | Purpose                            | Essential Options                                                                       | DevOps Scenario                                                   |
| --------- | ---------------------------------- | --------------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| `find`    | Search for files/directories       | `-name` (name), `-type f` (file), `-mtime -7` (modified), `-size +100M`                 | Find old logs: `find /var/log -name "*.log" -mtime +30 -delete`   |
| `locate`  | Fast filename search (database)    | `-i` (ignore case), `-l 10` (limit)                                                     | Find config: `locate nginx.conf`                                  |
| `which`   | Locate executable in PATH          | `-a` (all matches)                                                                      | Check binary: `which docker`                                      |
| `whereis` | Locate binary, source, man pages   | `-b` (binary only), `-m` (man only)                                                     | Find all: `whereis python`                                        |
| `grep`    | Search inside files                | `-r` (recursive), `-i` (case-insensitive), `-v` (invert), `-A3` (after), `-B3` (before) | Find error patterns: `grep -r "ERROR" /var/log/ --color`          |
| `zgrep`   | Search compressed files            | Same as grep                                                                            | Search rotated: `zgrep "500" /var/log/nginx/access.log.*.gz`      |
| `awk`     | Pattern scanning & processing      | `-F,` (field separator), `'{print $1}'`                                                 | Extract column: `ps aux \| awk '$3 > 50 {print $2}'`              |
| `sed`     | Stream editor for text replacement | `'s/old/new/g'` (replace), `-i` (in-place), `-n` (quiet)                                | Replace config value: `sed -i 's/port=8080/port=9090/' app.conf`  |
| `jq`      | Parse JSON (install separately)    | `'.key'` (extract), `'. \| length'` (count), `'.[] \| select(.status=="ok")'`           | Parse API response: `curl -s api.example.com \| jq '.data[0].id'` |

**Complex Real Scenario: Find and kill zombie processes**

```bash
ps aux | awk '$8=="Z" {print $2}' | xargs kill -9
```

---

## 7. Permissions & Ownership

| Command   | Purpose                 | Essential Options                                       | DevOps Scenario                                                 |
| --------- | ----------------------- | ------------------------------------------------------- | --------------------------------------------------------------- |
| `chmod`   | Change file permissions | `755` (rwxr-xr-x), `644` (rw-r--r--), `+x` (executable) | Make script executable: `chmod +x deploy.sh`                    |
| `chown`   | Change file owner/group | `user:group`, `-R` (recursive)                          | Fix web permissions: `chown -R www-data:www-data /var/www/html` |
| `umask`   | Set default permissions | `0022` (default), `0002` (shared group)                 | Secure files: `umask 027` (rwxr-x---)                           |
| `getfacl` | Get file ACLs           | None                                                    | Check extended perms: `getfacl /etc/shadow`                     |
| `setfacl` | Set file ACLs           | `-m u:user:rwx` (modify), `-x` (remove)                 | Granular access: `setfacl -m u:jenkins:rwx /deploy`             |
| `ls -l`   | View permissions        | First column shows `-rwxr-xr-x`                         | Check perms: `ls -l script.sh`                                  |

**Permission Number System:**
| Number | Permission | Binary |
|--------|-----------|--------|
| 7 | rwx | 111 |
| 6 | rw- | 110 |
| 5 | r-x | 101 |
| 4 | r-- | 100 |
| 0 | --- | 000 |

---

## 8. Disk & Storage Management

| Command  | Purpose                     | Essential Options                                    | DevOps Scenario                                                  |
| -------- | --------------------------- | ---------------------------------------------------- | ---------------------------------------------------------------- |
| `df`     | Disk filesystem usage       | `-h` (human), `-i` (inodes), `-T` (type)             | Check free space: `df -h /var`                                   |
| `du`     | Directory space usage       | `-sh` (summary human), `-h` (human), `--max-depth=1` | Find large dirs: `du -sh /* 2>/dev/null \| sort -hr \| head -10` |
| `ncdu`   | Interactive disk usage      | `-x` (stay on filesystem)                            | Analyze disk: `ncdu /home`                                       |
| `lsof`   | List open files             | `-i` (network), `-u user`, `-p PID`                  | Find deleted open file: `lsof \| grep deleted`                   |
| `fdisk`  | Partition table manipulator | `-l` (list), `-u` (sectors)                          | List partitions: `sudo fdisk -l`                                 |
| `mount`  | Mount filesystems           | `-t type`, `-o options`                              | Mount USB: `mount /dev/sdb1 /mnt/usb`                            |
| `umount` | Unmount filesystems         | `-l` (lazy), `-f` (force)                            | Unmount busy device: `umount -l /mnt/usb`                        |

---

## 9. Networking Essentials

| Command       | Purpose                        | Essential Options                                                    | DevOps Scenario                                                |
| ------------- | ------------------------------ | -------------------------------------------------------------------- | -------------------------------------------------------------- |
| `ping`        | Test connectivity              | `-c 4` (count), `-i 0.2` (interval)                                  | Check host reachable: `ping -c 4 google.com`                   |
| `curl`        | Transfer data (HTTP/HTTPS/FTP) | `-I` (headers), `-X POST`, `-H` (header), `-d` (data), `-o` (output) | Test API health: `curl -I https://api.example.com/health`      |
| `wget`        | Download files                 | `-O` (output), `-q` (quiet), `--spider` (check)                      | Download artifact: `wget https://example.com/file.tar.gz`      |
| `telnet`      | Test port connectivity         | None                                                                 | Check port open: `telnet database.example.com 3306`            |
| `nc` (netcat) | TCP/UDP Swiss army knife       | `-zv` (scan), `-l` (listen), `-e` (execute)                          | Port scanner: `nc -zv localhost 1-1000 2>&1 \| grep succeeded` |
| `ss`          | Socket statistics              | `-tulpn` (TCP/UDP/listening/port/process)                            | Find listening ports: `ss -tulpn \| grep 8080`                 |
| `netstat`     | Network statistics (legacy)    | `-tulpn` (same as ss)                                                | Alternative to ss: `netstat -tulpn`                            |
| `dig`         | DNS lookup                     | `+short` (short answer), `-x` (reverse)                              | Resolve domain: `dig +short google.com`                        |
| `nslookup`    | DNS query                      | None                                                                 | Simple DNS: `nslookup google.com`                              |
| `ip`          | Show/manipulate routing        | `addr` (addresses), `route` (routing), `link` (interfaces)           | Modern ifconfig: `ip addr show`                                |
| `traceroute`  | Trace packet route             | `-n` (no DNS), `-w 1` (timeout)                                      | Diagnose network path: `traceroute -n google.com`              |

**Real Scenario: Health check with timeout**

```bash
curl -s --max-time 5 http://localhost:8080/health || echo "Service down"
```

---

## 10. Process Control

| Command   | Purpose                               | Essential Options                                            | DevOps Scenario                               |
| --------- | ------------------------------------- | ------------------------------------------------------------ | --------------------------------------------- |
| `ps`      | Process snapshot                      | `aux` (all users + detailed), `-ef` (full format), `-u user` | Find PID: `ps aux \| grep nginx`              |
| `pstree`  | Process tree                          | `-p` (PIDs), `-u` (users), `-a` (args)                       | View parent-child: `pstree -p 1234`           |
| `kill`    | Terminate process                     | `-9` (force), `-15` (graceful), `-HUP` (reload)              | Stop app: `kill -15 $(pgrep myapp)`           |
| `pkill`   | Kill by name                          | `-f` (full command), `-9` (force)                            | Kill all java: `pkill -f java`                |
| `killall` | Kill all processes by name            | `-9`, `-r` (regex)                                           | Kill multiple: `killall chrome`               |
| `nice`    | Set process priority                  | `-n -20` (highest), `-n 19` (lowest)                         | Low priority backup: `nice -n 19 ./backup.sh` |
| `renice`  | Change priority of running process    | `-n 10 -p PID`                                               | Reduce priority: `renice -n 10 -p 1234`       |
| `jobs`    | List background jobs                  | `-l` (with PID), `-r` (running), `-s` (stopped)              | Check background: `jobs -l`                   |
| `bg`      | Resume job in background              | `%1` (job number)                                            | Background process: `bg %1`                   |
| `fg`      | Bring job to foreground               | `%1`                                                         | Foreground process: `fg %1`                   |
| `wait`    | Wait for background process to finish | `$!` (last PID)                                              | Sync parallel tasks: `wait $pid1 $pid2`       |

**Real Scenario: Graceful reload of nginx**

```bash
# Reload config without dropping connections
kill -HUP $(cat /var/run/nginx.pid)
```

---

## 11. Package Management

| Distro                    | Command                | Purpose                  | Essential Options               | DevOps Scenario                                   |
| ------------------------- | ---------------------- | ------------------------ | ------------------------------- | ------------------------------------------------- |
| **Debian/Ubuntu (apt)**   | `apt update`           | Update package index     | None                            | Refresh repos: `sudo apt update`                  |
|                           | `apt upgrade`          | Upgrade all packages     | `-y` (auto yes)                 | System update: `sudo apt upgrade -y`              |
|                           | `apt install`          | Install package          | `-y`, `--no-install-recommends` | Install tools: `sudo apt install -y docker.io jq` |
|                           | `apt remove`           | Remove package           | `--purge` (remove config)       | Uninstall: `sudo apt remove nginx`                |
|                           | `apt search`           | Search packages          | None                            | Find package: `apt search nginx`                  |
|                           | `apt list --installed` | List installed           | `--installed`                   | List all: `apt list --installed \| grep nginx`    |
| **RHEL/CentOS (yum/dnf)** | `yum install`          | Install package          | `-y`                            | Install: `sudo yum install -y httpd`              |
|                           | `yum update`           | Update all               | `-y`                            | System update: `sudo yum update -y`               |
|                           | `rpm -qa`              | Query all installed RPMs | `-qa`                           | List installed: `rpm -qa \| grep nginx`           |
|                           | `rpm -ql`              | List files in package    | `-ql package`                   | Find files: `rpm -ql nginx`                       |
| **Universal**             | `dpkg -l`              | List Debian packages     | None                            | Check package: `dpkg -l \| grep nginx`            |

---

## 12. Service Management (systemd)

| Command                | Purpose                       | Essential Options                                        | DevOps Scenario                                                      |
| ---------------------- | ----------------------------- | -------------------------------------------------------- | -------------------------------------------------------------------- |
| `systemctl start`      | Start service                 | None                                                     | Start app: `sudo systemctl start nginx`                              |
| `systemctl stop`       | Stop service                  | None                                                     | Stop app: `sudo systemctl stop nginx`                                |
| `systemctl restart`    | Restart service               | None                                                     | Apply config: `sudo systemctl restart nginx`                         |
| `systemctl reload`     | Reload config without restart | None                                                     | Graceful reload: `sudo systemctl reload nginx`                       |
| `systemctl status`     | Check service status          | `-l` (full output)                                       | Debug failures: `systemctl status nginx -l`                          |
| `systemctl enable`     | Enable at boot                | `--now` (enable + start)                                 | Auto-start: `sudo systemctl enable --now docker`                     |
| `systemctl disable`    | Disable at boot               | None                                                     | Disable: `sudo systemctl disable nginx`                              |
| `systemctl list-units` | List all units                | `--type=service`, `--state=running`                      | Check running: `systemctl list-units --type=service --state=running` |
| `journalctl`           | View logs                     | `-u nginx` (unit), `-f` (follow), `--since "1 hour ago"` | View service logs: `journalctl -u nginx -f`                          |

---

## 13. Scripting & Pipelining

| Concept                  | Syntax                                                                  | Example                                                     | DevOps Scenario            |
| ------------------------ | ----------------------------------------------------------------------- | ----------------------------------------------------------- | -------------------------- |
| **Shebang**              | `#!/bin/bash`                                                           | `#!/usr/bin/env bash`                                       | First line of every script |
| **Variables**            | `VAR=value`                                                             | `LOG_DIR="/var/log/myapp"`                                  | Store paths                |
| **Command substitution** | `$(cmd)` or `` `cmd` ``                                                 | `DATE=$(date +%Y%m%d)`                                      | Dynamic values             |
| **Conditionals**         | `if [ condition ]; then ...; fi`                                        | `if [ -f "$CONFIG" ]; then source "$CONFIG"; fi`            | Check before action        |
| **Double brackets**      | `[[ condition ]]` (bash only)                                           | `[[ "$NAME" == "prod" ]] && echo "Production"`              | Safer comparisons          |
| **For loop**             | `for i in list; do ...; done`                                           | `for file in *.log; do gzip "$file"; done`                  | Batch process              |
| **While loop**           | `while read line; do ...; done`                                         | `while IFS= read -r line; do echo "$line"; done < file.txt` | Read line by line          |
| **Case statement**       | `case $VAR in pattern) ...;; esac`                                      | `case $ENV in prod) deploy_prod;; dev) deploy_dev;; esac`   | Multi-choice               |
| **Exit codes**           | `$?` (last command)                                                     | `command; if [ $? -ne 0 ]; then exit 1; fi`                 | Error handling             |
| **set options**          | `set -e` (exit on error), `set -u` (unset var error), `set -o pipefail` | `set -euo pipefail`                                         | Fail fast                  |
| **Trap**                 | `trap 'commands' SIGNAL`                                                | `trap 'rm -f /tmp/lock' EXIT`                               | Cleanup on exit            |
| **Functions**            | `func_name() { commands; }`                                             | `log_error() { echo "[ERROR] $*" >&2; }`                    | Reusable code              |
| **Pipes**                | `cmd1 \| cmd2`                                                          | `cat log \| grep ERROR \| wc -l`                            | Chain commands             |
| **Redirections**         | `>` (stdout), `2>` (stderr), `&>` (both), `>>` (append)                 | `./script.sh > output.log 2>&1`                             | Log everything             |
| **Here document**        | `<<EOF ... EOF`                                                         | `cat <<EOF > config.ini`                                    | Generate configs           |
| **tee**                  | `cmd \| tee file`                                                       | `echo "Deploying" \| tee -a deploy.log`                     | Log to file + console      |
| **xargs**                | `cmd \| xargs`                                                          | `find /tmp -name "*.tmp" \| xargs rm -f`                    | Parallel execution         |

**Real Scenario: Deployment script with error handling**

```bash
#!/bin/bash
set -euo pipefail

DEPLOY_DIR="/opt/app"
BACKUP_DIR="/backup/$(date +%Y%m%d_%H%M%S)"

cleanup() {
    echo "Rolling back..."
    [ -d "$BACKUP_DIR" ] && cp -r "$BACKUP_DIR"/* "$DEPLOY_DIR/"
}
trap cleanup ERR

echo "Backing up current version..."
mkdir -p "$BACKUP_DIR"
cp -r "$DEPLOY_DIR"/* "$BACKUP_DIR/"

echo "Deploying new version..."
cd "$DEPLOY_DIR" && git pull origin main

echo "Running tests..."
make test || exit 1

echo "Restarting service..."
systemctl restart myapp

echo "Deployment successful!"
```

---

## 14. Compression & Archiving

| Command  | Purpose              | Essential Options                                               | DevOps Scenario                                  |
| -------- | -------------------- | --------------------------------------------------------------- | ------------------------------------------------ |
| `tar`    | Archive files        | `-czf` (create gzip), `-xzf` (extract), `-tvf` (list)           | Create backup: `tar -czf backup.tar.gz /var/www` |
| `gzip`   | Compress single file | `-d` (decompress), `-k` (keep original), `-9` (max compression) | Compress log: `gzip -9 app.log`                  |
| `gunzip` | Decompress .gz files | `-k` (keep)                                                     | Decompress: `gunzip app.log.gz`                  |
| `zip`    | Zip multiple files   | `-r` (recursive), `-9` (compress), `-e` (encrypt)               | Package artifacts: `zip -r artifact.zip ./build` |
| `unzip`  | Extract zip files    | `-d` (directory), `-o` (overwrite)                              | Extract: `unzip artifact.zip -d /opt/app`        |

**Common tar patterns:**
| Pattern | Command | Use case |
|---------|---------|----------|
| Create .tar.gz | `tar -czf archive.tar.gz /path` | Compressed archive |
| Extract .tar.gz | `tar -xzf archive.tar.gz` | Extract to current dir |
| Create .tar | `tar -cvf archive.tar /path` | No compression |
| Extract .tar | `tar -xvf archive.tar` | Extract |
| List contents | `tar -tvf archive.tar.gz` | Preview before extract |

---

## 15. System Information & Monitoring

| Command         | Purpose                  | Essential Options                                        | DevOps Scenario                       |
| --------------- | ------------------------ | -------------------------------------------------------- | ------------------------------------- |
| `uname`         | System information       | `-a` (all), `-r` (kernel), `-m` (machine)                | Check OS: `uname -a`                  |
| `free`          | Memory usage             | `-h` (human), `-m` (MB), `-g` (GB), `-s 2` (every 2 sec) | Monitor RAM: `free -h`                |
| `vmstat`        | Virtual memory stats     | `1 5` (interval count), `-s` (stats)                     | Detect swapping: `vmstat 1`           |
| `iostat`        | CPU/IO device stats      | `-x 1` (extended every 1s), `-c` (CPU only)              | Find disk bottleneck: `iostat -x 1`   |
| `sar`           | System activity reporter | `-u` (CPU), `-r` (memory), `-n DEV` (network)            | Historical analysis: `sar -u 1 10`    |
| `dstat`         | Versatile resource stats | `-c` (CPU), `-d` (disk), `-n` (net), `--top-cpu`         | Real-time all: `dstat -cdn --top-cpu` |
| `/proc/cpuinfo` | CPU details              | `cat /proc/cpuinfo \| grep "model name"`                 | Get CPU model                         |
| `/proc/meminfo` | Memory details           | `cat /proc/meminfo \| grep MemTotal`                     | Get total RAM                         |
| `lscpu`         | CPU architecture         | `-p` (parseable)                                         | See CPU topology                      |

**Real Scenario: Monitor system during load test**

```bash
# Run in separate terminals
vmstat 1
iostat -x 1
dstat -cdn 1
htop
```

---

## Quick Reference Cheat Sheet

### Most Used Commands Daily

```bash
# Navigation & viewing
ls -la           # List everything with details
cd /path         # Change directory
cat file         # View file
tail -f log      # Follow log
less large.log   # Page through file

# Searching
grep -r "pattern" ./
find . -name "*.conf"

# Permissions
chmod +x script.sh
chown user:group file

# Processes
ps aux | grep process
kill -9 PID
htop

# Network
curl -I url
ss -tulpn

# Disk
df -h
du -sh *

# System
systemctl status service
journalctl -u service -f
```

### Error Handling Patterns

```bash
# Fail on any error
set -euo pipefail

# Check command success
if command; then
    echo "Success"
else
    echo "Failed"
    exit 1
fi

# Redirect all output
./script.sh > output.log 2>&1

# Timeout command
timeout 30s curl http://service
```

---

## DevOps Non-Negotiable Skills Checklist

- [ ] Can navigate filesystem and view files without GUI
- [ ] Can find files by name, size, or modification time
- [ ] Can search inside files with `grep` and regex
- [ ] Can parse logs with `awk`, `cut`, `sort`, `uniq`
- [ ] Can set correct permissions (`chmod`, `chown`)
- [ ] Can check disk space (`df`, `du`)
- [ ] Can check memory/CPU usage (`top`, `free`)
- [ ] Can start/stop/restart services (`systemctl`)
- [ ] Can view service logs (`journalctl`)
- [ ] Can write bash scripts with error handling
- [ ] Can use `curl` to test API endpoints
- [ ] Can check listening ports (`ss -tulpn`)
- [ ] Can kill rogue processes (`kill`, `pkill`)
- [ ] Can compress/extract archives (`tar`, `gzip`)
- [ ] Can use pipelines to chain commands

---

```

```
