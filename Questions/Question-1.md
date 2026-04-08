# Linux User Management, File System & Permissions - Practice Questions

## Basic Level (Junior DevOps)

### Question 1

You need to create a new user `deployer` for CI/CD pipelines. The user must:

- Have home directory `/opt/deployer` (not default `/home/deployer`)
- Use `/bin/bash` as shell
- Have an expiry date of 2025-12-31

What command do you use?

### Question 2

Your team has 3 developers: `alice`, `bob`, and `charlie`. They need shared read/write access to `/opt/shared_project`. Write all commands to create the group, add users, create the directory, and set correct permissions.

### Question 3

A file has permissions `-rw-r-x--x`. What does this mean numerically and who can do what?

### Question 4

Why does a new file get `644` permissions by default, not `666`? What controls this behavior?

### Question 5

What command would you use to find all files owned by user `john` in `/var` directory?

### Question 6

How do you temporarily switch to user `postgres` to run a database command?

### Question 7

What is the difference between `/etc/passwd` and `/etc/shadow`?

---

## Intermediate Level (Mid-Level DevOps)

### Question 8

You have `/tmp/shared_storage` where multiple users create temporary files. User `alice` creates a file, but `bob` keeps deleting it. How do you prevent users from deleting files they don't own?

### Question 9

Standard Unix permissions aren't enough. You need:

- `jenkins` user: read/write/execute
- `devops` group: read-only
- `monitoring` user: no access at all
- All others: read-only

Set this up on `/opt/application/config`. Write all commands.

### Question 10

You find `/usr/bin/passwd` has `-rwsr-xr-x` permissions. What does the `s` mean? Why is this potentially dangerous? How do you find all SUID files on the system?

### Question 11

Security team mandates:

- Passwords expire every 90 days
- 7-day warning before expiry
- Account locks after 5 failed attempts
- Minimum password age of 1 day

Implement this for user `appuser`. Write the commands.

### Question 12

User `john` is in groups: `john` (primary), `docker` (secondary), `sudo` (secondary). He runs `touch test.txt`. What group owns the file, and why? How do you make new files inherit the directory's group instead?

### Question 13

You edited `/etc/sudoers` directly (not using `visudo`) and made a syntax error. Now `sudo` doesn't work, and you're locked out of root access. How do you recover?

### Question 14

What does the `umask 027` command do? What permissions will new files and directories have?

### Question 15

How do you add user `alice` to the `docker` group without removing her from existing groups?

### Question 16

What is the difference between `sudo su -` and `sudo -i`?

---

## Advanced Level (Senior DevOps)

### Question 17

You need to allow `/usr/bin/ping` to create raw sockets without making it SUID root (security risk). How do you achieve this using Linux capabilities?

### Question 18

You have critical config `/etc/nginx/nginx.conf` that must NEVER be modified, even by root. How do you make it immutable? Write the command to set and remove this protection.

### Question 19

You're running Docker as non-root user, but need to mount NFS volumes. Without root, you get permission errors. What Linux feature allows container root (UID 0) to map to an unprivileged host UID?

### Question 20

Your company has 10,000 users in LDAP. Local users still need to exist for emergency access. A developer named `john` exists in LDAP and locally. Which one is used? What file controls this order?

### Question 21

You set `chmod 777` on `/var/www/html`, but nginx still gets "Permission denied". Regular Linux permissions look correct. What security system might be blocking access? How do you check and fix it?

### Question 22

What is the purpose of the sticky bit on a directory? Write the numeric and symbolic commands to set it.

### Question 23

Explain the difference between `chmod 4755` and `chmod 755`. What does the 4 represent?

### Question 24

How do you set the default group ownership for all new files created in a directory to `www-data` instead of the user's primary group?

### Question 25

What is an ACL (Access Control List) and when would you use it instead of standard Unix permissions?

---

## Troubleshooting Scenarios

### Question 26

You're logged in as `root` (or using `sudo`), but still get "Permission denied" when accessing `/proc/some_pid/mem`. Why can't root access this file?

### Question 27

`df -h` shows `/var` is 95% full, but `du -sh /var` shows only 10GB used. There's a 40GB difference. What's happening and how do you find the cause?

### Question 28

NFS share mounted with `rw` options, but user `nobody` owns all files locally. UID 1000 locally is `alice`, but on NFS server, UID 1000 is `bob`. Why does this happen and how do you fix it?

### Question 29

A user reports they can't write to `/opt/app/logs` even though they are in the correct group. You run `ls -ld /opt/app/logs` and see `drwxrwx--- 2 root appteam`. The user is in `appteam` group. What else could be wrong?

### Question 30

You accidentally run `sudo chmod -R 000 /etc` on a production server. The system is still running but broken. How do you recover without reinstalling the OS?

---

## Security-Focused Scenarios

### Question 31

Security scan shows a new SUID binary `/tmp/.hidden/suid_bash`. You didn't put it there. What commands would you run to investigate and what is your immediate response?

### Question 32

Someone disabled the sticky bit on `/tmp` (now `1777` → `777`). What attacks become possible? Write the command to fix it.

### Question 33

How do you audit all failed sudo attempts on a system? Which log file contains this information?

### Question 34

What is a "privilege escalation" vulnerability? Give an example of a misconfiguration that could allow a non-root user to gain root access.

### Question 35

How do you restrict a specific user `guest` to only execute `ls` and `cat` commands via sudo, and nothing else?

---

## Hands-On Practical Tasks

### Task 1

Create a secure shared directory with these requirements:

- Directory: `/data/team_project`
- Group: `project-team`
- Members: `john`, `jane`, `jim` (all in group)
- New files automatically belong to `project-team`
- Users can delete only their own files (even within shared dir)
- No access for others

Write all commands.

### Task 2

Create an emergency break-glass user `breakglass` that:

- Can `sudo` to ANY command without password
- Has SSH key authentication only (no password)
- Logs all commands to `/var/log/breakglass.log`
- Expires in 7 days

Write all commands.

### Task 3

Find and fix the following issues on a Linux system:

1. All files in `/home` have incorrect ownership (should belong to respective users)
2. The `/tmp` directory has wrong permissions (currently `755`)
3. There's a world-writable file in `/etc` that shouldn't be
4. A user `olduser` needs to be removed but their files preserved in `/archive/olduser`

Write commands to identify and fix each issue.

### Task 4

Create the following permission structure:
/project/
├── public/ (anyone can read, only team can write)
├── private/ (only team members can access)
└── backups/ (only root can write, team can read)
Team name: `project-team`. Write all commands.

### Task 5

You have a backup script that needs to run as root via cron. Instead of giving the script SUID, what's the proper way to schedule it securely?

---

## Quick Scenario Questions

### Question A

What command shows you which users are currently logged into the system?

### Question B

How do you lock a user account without deleting it?

### Question C

What is the difference between `/etc/skel` and a user's home directory?

### Question D

How do you change a user's primary group from `users` to `developers`?

### Question E

What does the command `chown :www-data /var/www` do?

### Question F

How do you see which groups a user belongs to?

### Question G

What is the purpose of the `/etc/login.defs` file?

### Question H

How do you delete a user and their home directory in one command?

### Question I

What is a "zombie process" and how does it relate to permissions?

### Question J

How do you check if SELinux is enforcing, permissive, or disabled?

---

## Command Recall Questions (No Context)

Write the command for each requirement:

1. Change ownership of `/data` to user `nginx` and group `www-data` recursively
2. Add execute permission for owner only on `script.sh`
3. Remove write permission for group and others on `secret.txt`
4. Set default permissions so new files are `640` and directories `750`
5. Find all files in `/etc` that are writable by anyone
6. Find all directories with SUID bit set
7. Add user `monitoring` to group `adm` without changing other groups
8. Temporarily become user `postgres` and run `psql` command
9. Check when user `deployer`'s password expires
10. Force password change for user `newhire` on next login

---

## Bonus: Open-Ended Questions

### B1

Design a permission scheme for a CI/CD system where:

- Jenkins runs as user `jenkins`
- Build artifacts go to `/artifacts/`
- Developers (group `developers`) need to read artifacts
- Only Jenkins can write to `/artifacts/`
- Operations team (group `operations`) can delete old artifacts
- No other users have any access

### B2

You discover that a former employee's SSH key is still in the authorized_keys file of 50 servers. What's your step-by-step plan to remove it securely across all servers?

### B3

Explain how you would implement "least privilege" for a microservice that needs to:

- Read from `/etc/app/config`
- Write logs to `/var/log/app/`
- Connect to database on port 5432
- Run as non-root user

### B4

What is the security implication of a directory with `777` permissions but without the sticky bit? Give a concrete attack scenario.

### B5

You need to give a contractor temporary access to your staging environment for 30 days. After that, their access must be completely removed automatically. How do you implement this?

---

**Total Questions: 70+**
