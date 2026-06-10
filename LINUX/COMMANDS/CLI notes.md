# Linux Command Line — Complete Tutorial Notes

> **Based on the full Linux Command Line tutorial series.**  
> These notes follow the tutorial from start to finish, preserving every concept taught. Extra context, examples, and suggestions have been added where they deepen understanding, but nothing from the original material has been left out.

---

## Table of Contents

1. [What Is the Command Line?](#1-what-is-the-command-line)
2. [Configuring Your Terminal](#2-configuring-your-terminal)
3. [Anatomy of a Linux Command](#3-anatomy-of-a-linux-command)
4. [Navigating the Filesystem](#4-navigating-the-filesystem)
5. [Creating Files and Directories](#5-creating-files-and-directories)
6. [Text Editors — Nano and VI](#6-text-editors--nano-and-vi)
7. [Reading Files — cat, more, less, head, tail](#7-reading-files--cat-more-less-head-tail)
8. [Output Redirection and Standard Streams](#8-output-redirection-and-standard-streams)
9. [Moving, Copying, and Renaming Files](#9-moving-copying-and-renaming-files)
10. [Deleting Files and Directories](#10-deleting-files-and-directories)
11. [Inodes, Hard Links, and Soft Links](#11-inodes-hard-links-and-soft-links)
12. [Root User, sudo, and Privileged Commands](#12-root-user-sudo-and-privileged-commands)
13. [Adding and Managing Users](#13-adding-and-managing-users)
14. [The /etc/passwd and /etc/shadow Files](#14-the-etcpasswd-and-etcshadow-files)
15. [Modifying User Accounts — usermod, chage, chfn](#15-modifying-user-accounts--usermod-chage-chfn)
16. [Locking, Unlocking, and Deleting User Accounts](#16-locking-unlocking-and-deleting-user-accounts)
17. [Groups — Adding, Modifying, Deleting, and Members](#17-groups--adding-modifying-deleting-and-members)
18. [File Permissions — chmod, chown, chgrp](#18-file-permissions--chmod-chown-chgrp)
19. [Special Permissions — setuid, setgid, Sticky Bit](#19-special-permissions--setuid-setgid-sticky-bit)
20. [Access Control Lists (ACLs)](#20-access-control-lists-acls)
21. [File Attributes — chattr, lsattr](#21-file-attributes--chattr-lsattr)
22. [Date and Time Commands](#22-date-and-time-commands)
23. [The stat Command](#23-the-stat-command)
24. [Word Count, Sort, Unique, and Pipes](#24-word-count-sort-unique-and-pipes)
25. [The find Command](#25-the-find-command)
26. [The locate Command](#26-the-locate-command)
27. [grep — Searching Inside Files](#27-grep--searching-inside-files)
28. [Regular Expressions (Regex) with grep](#28-regular-expressions-regex-with-grep)
29. [tr — Translate Characters](#29-tr--translate-characters)
30. [sed — Stream Editor](#30-sed--stream-editor)
31. [cut — Extract Columns and Fields](#31-cut--extract-columns-and-fields)
32. [awk — Field Processing and Scripting](#32-awk--field-processing-and-scripting)

---

## 1. What Is the Command Line?

### The Concept

When you use a graphical desktop (GUI), clicking something sends a command → to the OS → to the kernel → back through the OS → and the result appears on screen. When you use the **command line**, you skip the graphical layer and send commands directly to the OS and kernel yourself.

The command line is also called the **CLI** (Command Line Interface) or simply **the terminal**.

### Why Use the Command Line?

There are several strong reasons to use the CLI instead of always pointing and clicking:

- **Universality across Linux distros.** Most Linux commands are the same whether you're on Red Hat, Ubuntu, Arch, or Mint. You don't have to re-learn where buttons are.
- **Works on Unix-based systems.** Linux is based on Unix. Most Linux/Unix commands work on **Android** and **macOS (Darwin)** too, since both are Unix-based. There may be slight differences but core commands work the same.
- **Automation.** You can automate repetitive tasks and schedule them to run at specific dates and times using `cron`.
- **Control.** You give up some ease-of-use of point-and-click but gain much more fine-grained control.
- **Servers don't have GUIs.** Most servers run without any graphical desktop installed, so the terminal is all there is.
- **It's fun.** Once you know it, you'll wonder how you ever got along without it.

> **Suggestion:** Think of the GUI and CLI as two different tools, each with strengths. For editing a video, use the GUI. For automating a batch of file operations, use the CLI. The right tool for the right job.

### Opening a Terminal

On Linux Mint MATE (the distro used in this series), you can open a terminal by:
- Clicking the terminal icon in the panel at the bottom of the screen
- Going to the main menu and finding the terminal
- Going to **System Tools** and finding the terminal there

### Your First Command

```bash
echo "hello world"
```

The double quotes, single quotes, or even no quotes at all — all work with `echo`. Pressing the **up arrow** recalls the previous command so you can edit it.

---

## 2. Configuring Your Terminal

> **Question for yourself:** Do you spend a lot of time in the terminal? If yes, customizing it pays dividends in readability and comfort.

### Terminal Profiles

A **profile** is a saved set of terminal customizations (colors, font size, window size, etc.). You can have multiple profiles for different situations — e.g., a high-contrast one for presentations, a dark one for daily use.

On Linux Mint MATE terminal, go to **Edit → Profiles** to manage them. You can:
- Create a new profile (e.g., "light") based on an existing one (copies all settings)
- Edit a profile's colors, fonts, and window size
- Set a default profile that opens every time you launch a terminal

### Changing Font Size

To change font size from the keyboard in the terminal:
- `Ctrl + Shift + +` — make text larger
- `Ctrl + -` — make text smaller

To make a persistent font size change: **Edit → Profile Preferences**, uncheck "Use system fixed-width font," then click the font name to open the font picker and choose your desired size (e.g., 24).

### Colors and Themes

Under **Colors** in the profile preferences:
- Uncheck "Use colors from system theme" to use custom colors
- Built-in color schemes: Tango, Solarized Light, XTerm, and others
- The color palette at the bottom controls specific terminal colors (e.g., directory blue). You can change any individual palette color to your preference.

### Window Size

You can set a fixed number of columns and rows for the terminal window via Profile Preferences. Check the relevant box to unlock those fields.

---

## 3. Anatomy of a Linux Command

A Linux command line command (technically a **bash command**) has up to four parts:

```
command   [options]   [argument]   [option-argument]
```

Example:
```bash
ls -n 25 /home
```

- **`ls`** — the command itself
- **`-n 25`** — an option (`-n`) with its own argument (`25`)
- **`/home`** — the main argument (the directory to list)

**Options** are usually preceded by a dash (`-`). They are optional. Without options, commands use their default behavior.

### Getting Help — The Man Pages

`man` stands for **manual**. To read the manual page for any command:

```bash
man ls
```

Navigation inside man pages:
- Arrow keys — scroll line by line
- Page Down / Page Up — scroll page by page
- `h` — show help for navigation keys
- `q` — quit

Options are listed alphabetically in the man page. This is the authoritative source for what a command does and what options it accepts.

---

## 4. Navigating the Filesystem

### ls — List Directory Contents

```bash
ls           # basic list
ls -l        # long format (permissions, owner, group, size, date)
ls -h        # human-readable sizes (4K instead of 4096)
ls -a        # show all files including hidden (dot files)
ls -lah      # combine all three (order doesn't matter)
ls -l /home  # list a specific directory
```

The long format columns are: permissions | links | owner | group | size | date | filename.

### Files vs. Folders (Directories)

In the GUI, we call them **folders**. In the command line, we call them **directories**. Both are correct but the terminal convention is "directory."

The first character of the permissions column tells you the file type:
- `d` = directory
- `-` = regular file
- `l` = symbolic link (sim link)

### Navigating with cd (Change Directory)

```bash
cd Documents        # go into Documents directory (relative path)
cd /home/michael    # go to specific path (absolute path)
cd ..               # go up one directory (parent)
cd ../..            # go up two directories
cd ../Downloads     # go up one, then into Downloads
cd                  # go straight to your home directory
cd ~                # same as above — tilde (~) always means your home
cd -                # go back to the previous directory you were in
```

**Absolute path** = starts from the root `/`, no ambiguity about which directory is meant.  
**Relative path** = starts from where you currently are. Using `..` (parent) or entering a child directory name directly.

**Tab completion** saves enormous time. Start typing and press Tab — the shell will complete the name if it's unique. Press Tab twice to see all options when multiple names match.

### pwd — Print Working Directory

```bash
pwd
```

Shows the full absolute path of the directory you're currently in. Some command prompts show this automatically, but `pwd` always gives a definitive answer.

### The Root Directory

The root directory is just `/` — a single forward slash. Everything on a Linux system lives under it, branching out like a tree. This is different from the "root user" — same word, different meaning.

### Hidden Files

Files and directories whose name starts with a period (`.`) are hidden. The `ls -a` flag reveals them. In every directory you'll see:
- `.` — represents the current directory itself
- `..` — represents the parent directory

> **Suggestion:** The hidden dot files are generally configuration files. You'll rarely need to touch them until you start customizing your shell environment (`.bashrc`, `.bash_profile`, etc.).

---

## 5. Creating Files and Directories

### touch — Create a File

```bash
touch newfile.txt
```

`touch` checks if the file exists. If it doesn't, it creates an empty file. If it does exist, it **updates the timestamp** (last modified date) without changing the content.

### Naming Files

Linux file names can be up to **255 characters**. Linux is **case sensitive** — `MyFile.txt` and `myfile.txt` are two completely different files.

**Unix naming guidelines (best practices):**
- Use only: lowercase `a–z`, digits `0–9`, periods `.`, underscores `_`, hyphens `-`
- Always use file extensions like `.txt`, `.jpg` — Linux doesn't require them but humans find them helpful
- Don't start a filename with a hyphen (could be mistaken for an option)
- Don't start a filename with a period unless you want it hidden

Files with spaces in the name are allowed but can be awkward. To create them:
```bash
touch "new file.txt"         # quotes
touch new\ file.txt          # backslash escape before the space
```

### mkdir — Make a Directory

```bash
mkdir my_directory
mkdir new_directory/new_directory_2/new_directory_3   # error — parent doesn't exist
mkdir -p new_directory/new_directory_2/new_directory_3  # -p creates parents as needed
```

The `-p` flag (parents) creates all intermediate directories in the path that don't yet exist.

### Curly Brace Expansion

Bash lets you create multiple files at once:

```bash
touch file{1,2,3}.txt         # creates file1.txt, file2.txt, file3.txt
touch file{1..5}.txt           # creates file1.txt through file5.txt (range)
```

---

## 6. Text Editors — Nano and VI

> **Important:** Always use a **text editor** (Nano, VI) for Linux text files. Never use a word processor (LibreOffice Writer, Microsoft Word) — they embed hidden formatting code into the file.

### Nano

Simple, beginner-friendly. Controls are shown at the bottom of the screen.

```bash
nano myfile.txt    # open or create myfile.txt
```

Key controls:
- Type to insert text
- `Ctrl + O` — write out (save) the file. Press Enter to confirm the filename.
- `Ctrl + X` — exit. If unsaved changes exist, it asks if you want to save.
- `Ctrl + A` — go to beginning of line
- `Ctrl + E` — go to end of line
- Arrow keys — navigate

### VI / VIM

More powerful but modal (you must switch between modes). Standard on almost every Unix/Linux system.

```bash
vi myfile.txt
```

- Press `i` to enter **insert mode** (now you can type)
- Press `Esc` to leave insert mode and return to **command mode**
- `:w` then Enter — save (write) the file
- `:q` then Enter — quit
- `:wq` then Enter — save and quit
- `:q!` then Enter — quit without saving (force quit)

> **Suggestion:** Learn at least the basics of VI. It's available on every Linux and macOS system — knowing it means you're never stuck without an editor, even on a minimal server.

---

## 7. Reading Files — cat, more, less, head, tail

### cat — Concatenate and Print

`cat` stands for concatenate — joining files together.

```bash
cat myfile.txt                   # print file content
cat file1.txt file2.txt          # print both files as if one
cat -n myfile.txt                # print with line numbers
```

### more

Prints one screenful at a time. Press Space for the next page. Exits at the end.

```bash
more grocery_list.txt
```

### less

Improved version of `more`. Doesn't need to read the whole file. Can scroll both forward and backward.

```bash
less grocery_list.txt
less -M grocery_list.txt     # shows file name, line numbers, and percentage
```

Navigation in less:
- Arrow keys — line by line
- Page Down / Page Up — page by page
- `q` — quit
- `h` — help

> "less is greater than more" — a classic Unix joke about how the improvement to `more` was named `less`.

### head and tail

```bash
head grocery_list.txt        # show first 10 lines (default)
head -n 25 grocery_list.txt  # show first 25 lines
head -25 grocery_list.txt    # same thing, shorter syntax

tail grocery_list.txt        # show last 10 lines
tail -f grocery_list.txt     # follow mode — shows new lines as they are added to the file
```

`tail -f` is extremely useful for watching log files in real time. Open a log file with `tail -f`, then trigger an action in another terminal and watch the log update live. Press `Ctrl + C` to stop following.

---

## 8. Output Redirection and Standard Streams

### Standard Streams

Every command has three streams:
- **Standard input (stdin)** — where a command reads input from (usually keyboard)
- **Standard output (stdout)** — where a command sends normal output (usually screen)  
  Numbered `1`
- **Standard error (stderr)** — where a command sends error messages (usually screen)  
  Numbered `2`

### Redirecting stdout to a File

```bash
ls -lh > output.txt        # create/overwrite output.txt with the ls results
ls -lh >> output.txt       # append to output.txt (don't overwrite)
echo "hello" > hello.txt   # quick way to create a small file
```

A single `>` creates or **overwrites** the file. A double `>>` **appends** to it.

### Redirecting stderr

```bash
cat nonexistent.txt 2> error.txt     # save error messages to error.txt
cat nonexistent.txt 2> /dev/null     # discard error messages entirely
```

`/dev/null` is a special file — anything written to it disappears. Useful when you want to suppress errors you don't care about.

### Redirecting both stdout and stderr together

```bash
cat file.txt &> output.txt           # send both stdout and stderr to the same file
```

The `&>` syntax sends both standard output and standard error to one destination.

### Creating Files with printf

```bash
printf "line one\nline two\n" > myfile.txt
```

`printf` supports `\n` for newlines and `\t` for tabs, giving you more formatting control than `echo`.

---

## 9. Moving, Copying, and Renaming Files

### mv — Move or Rename

```bash
mv source.txt destination/     # move file into a directory
mv source.txt ./                # move to current directory (dot = current dir)
mv hello.txt renamed.txt        # rename a file (same directory, new name)
mv hello.txt new_dir/output.txt # move AND rename simultaneously
```

Useful `mv` options:
- `-v` — verbose (shows what was moved/renamed)
- `-n` — no-clobber (don't overwrite an existing file)
- `-i` — interactive (ask before overwriting)
- `-f` — force overwrite (the default behavior)

Moving directories works exactly the same way as moving files.

> **Caution:** The default behavior is `-f` (force overwrite). If you move a file onto an existing file of the same name, the old file is gone. Use `-i` or `-n` to be safe.

### cp — Copy Files and Directories

```bash
cp source.txt new_directory/       # copy file to directory
cp source.txt source_copy.txt      # copy within the same directory (must rename)
cp -r new_directory/ ./            # copy a directory recursively (required for dirs)
cp -v source.txt dest/             # verbose copy
cp -i source.txt dest/existing.txt # interactive: ask before overwriting
cp -n source.txt dest/             # no-clobber: skip if destination exists
cp -u source.txt dest/             # only copy if source is newer than destination
cp -a source_dir/ dest_dir/        # preserve permissions, ownership, timestamps
```

You cannot copy a directory over a file or vice versa.

---

## 10. Deleting Files and Directories

### rm — Remove Files

```bash
rm file.txt                     # delete a file (no trash — it's gone)
rm -v file.txt                  # verbose: confirm what was deleted
rm -i file.txt                  # interactive: ask before deleting
rm -vi file.txt                 # both
```

There is no Recycle Bin or Trash. Once deleted with `rm`, the file is gone (though forensic tools may recover it from disk until the space is overwritten).

### Removing Directories

```bash
rmdir empty_directory            # only works on empty directories
rm -r my_directory               # recursively delete directory and all contents
rm -ri my_directory              # ask before each deletion (tedious for large dirs)
rm -rI my_directory              # ask once for the whole directory (uppercase I)
```

The uppercase `-I` option is especially useful: it gives you a single warning before recursively deleting an entire directory tree, without prompting for every single file.

`Ctrl + C` cancels a command in progress. If you `rm -rvi` and realize mid-way you don't want to continue, `Ctrl + C` stops it — but any files already deleted before you pressed it are still gone.

---

## 11. Inodes, Hard Links, and Soft Links

### What Is an Inode?

Every file on Linux has two parts:
1. **The filename** — what you see when you type `ls`
2. **The inode** — a record stored on disk that contains all the file's metadata (permissions, owner, group, size, timestamps) and a pointer to where the actual data lives on disk

The filename is not stored in the inode. The inode contains everything *except* the name and the data itself.

```bash
ls -lhi               # show inode numbers (the -i flag)
```

When all inodes are used up, no new files can be created even if disk space remains.

### Hard Links

A hard link is an additional **filename** pointing to the same inode (and therefore the same data).

```bash
ln grocery_list.txt grocery_list_link.txt     # create a hard link
```

After this, `grocery_list.txt` and `grocery_list_link.txt` both point to the same inode. They share the same permissions, size, and timestamps. The link count in `ls -l` increases by one for each hard link.

Deleting one hard link doesn't delete the data — the data is only actually deleted when the last hard link is removed.

Hard link limitations:
- Cannot link across different partitions (inodes are partition-specific)
- Cannot hard link to a directory (would risk creating loops)

### Soft Links (Symbolic Links / Symlinks)

A symlink is a file that contains the path to another file. It's like a shortcut.

```bash
ln -s grocery_list.txt grocery_list_symlink.txt   # -s for symbolic/soft link
```

Symlinks have their own inode and only contain the path string. The size shown for the symlink is the number of characters in the path it points to.

When you `ls -lh`, symlinks show up with:
- `l` as the first character in permissions
- An arrow showing what they point to: `grocery_list_symlink.txt -> grocery_list.txt`

**Breaking a symlink:** If the file it points to is renamed or deleted, the symlink becomes broken (shown in red or blinking on many systems). Fix it by restoring the original filename.

```bash
unlink grocery_list_symlink.txt    # preferred way to remove a symlink
rm grocery_list_symlink.txt        # also works
```

Symlinks can cross partitions and can link to directories.

---

## 12. Root User, sudo, and Privileged Commands

### Root vs. Regular Users

Linux has two types of users:
- **Unprivileged (standard) users** — can only affect their own files and settings
- **Privileged users** — can run root-level commands that affect the whole system

The **root user** is the superuser who can do anything to any file on the system. In early Linux, people logged in daily as root — this was dangerous because one wrong command could wreck the whole system, and any malware running in that session would have full system access.

### sudo

On Ubuntu/Mint-based systems, the user created at install time is automatically made a privileged user. To run a single command with root privileges:

```bash
sudo ls -la /root     # run ls as root
sudo touch /root/file.txt
```

When you run a `sudo` command, Linux asks for **your own password** (not the root password). Your privilege remains active for about 5–10 minutes afterward before timing out.

To manually revoke your sudo privileges immediately:
```bash
sudo -k
```

### Becoming Root Temporarily

To run multiple root commands without typing `sudo` each time:
```bash
sudo -i          # log in as root (command prompt changes to show #)
exit             # return to your regular user
```

### Bang Bang Trick

If you forget to type `sudo` before a command:
```bash
sudo !!          # re-run the last command with sudo prepended
```

`!!` means "the last command." This also works for other purposes: if you wanted to `tail` a file but typed the filename on its own, you can use `tail !!` to re-run with `tail` prepended.

---

## 13. Adding and Managing Users

### adduser (Interactive)

The `adduser` command walks you through creating a user interactively:

```bash
sudo adduser test_add_user
```

It prompts for:
- Password (set immediately)
- Full name
- Room number, work phone, home phone, other info (can be left blank)
- Confirmation

This command also automatically creates a home directory at `/home/username` and copies in configuration files (`.bashrc`, etc.).

### useradd (Minimal)

`useradd` is more low-level and does less automatically:

```bash
sudo useradd test_user_add        # creates a service-like account, NO home dir
sudo useradd -m test_user_adm     # -m flag creates a home directory
```

Without `-m`, no home directory is created. This is intentional — accounts without home directories are used for services (SSH, FTP, MySQL, etc.) that don't need a human login.

**Service accounts** are accounts for system services, not real people. The first 999 user IDs (UIDs) are reserved for service accounts. General user accounts start at UID 1000.

### Switching Users

```bash
sudo su test_user_adm     # switch to test_user_adm (asks for YOUR password)
su -                      # switch to root
whoami                    # shows which user you currently are
exit                      # return to previous user
```

---

## 14. The /etc/passwd and /etc/shadow Files

### /etc/passwd

Any user can read this file:

```bash
cat /etc/passwd
getent passwd test_add_user    # show just one user's record
```

Each record has 7 colon-separated fields:
```
username : x : UID : GID : comment : home_dir : shell
```

- **username** — login name
- **x** — password placeholder (the real encrypted password is in `/etc/shadow`)
- **UID** — user ID number (must be unique)
- **GID** — primary group ID number (doesn't have to be unique)
- **comment** — often holds the full name, phone numbers (GECOS field)
- **home_dir** — the user's home directory path
- **shell** — the shell used at login, e.g., `/bin/bash`

The comment field on the login screen is what Linux Mint displays as the "username" on the graphical login screen. If there's no comment, it shows the actual username.

### /etc/shadow

Only root and privileged users can read this file:

```bash
sudo cat /etc/shadow
```

Each record has 9 colon-separated fields:
```
username : encrypted_password : last_change : min_days : max_days : warn_days : inactive_days : expiry_date : reserved
```

- **encrypted_password** — starts with `$6$` for SHA-512 encryption, `$1$` for MD5. An `!` alone means the account is locked and has no password set. An `*` (for service accounts) means the same.
- **last_change** — days since Jan 1, 1970 that the password was last changed (Unix epoch time)
- **min_days** — minimum days before a user can change their password again
- **max_days** — maximum days before the password must be changed (`99999` = never expires)
- **warn_days** — days before expiry to start showing a warning
- **inactive_days** — days after expiry before the account is automatically locked
- **expiry_date** — the date the account expires entirely

---

## 15. Modifying User Accounts — usermod, chage, chfn

### usermod — Modify User Settings

```bash
sudo usermod -s /bin/zsh test_user_adm         # change shell
sudo usermod -d /users/test_user_adm test_user_adm  # change home directory (doesn't move files)
sudo usermod -d /users/new_home -m test_user_adm    # change home AND move files (-m)
sudo usermod -l new_login_name old_login_name   # change login name
sudo usermod -c "This is a comment" test_user_adm  # update the comment field
```

Multiple changes in one command:
```bash
sudo usermod -s /bin/bash -d /home/test_user_adm test_user_adm
```

### chage — Change Password Aging

```bash
sudo chage -l test_user_adm         # list all aging info for the user
sudo chage -m 14 test_user_adm      # set minimum days before password change to 14
sudo chage -E "2020-12-31" test_user_adm   # set account expiry date
sudo chage --lastday 0 test_user_adm       # force password change on next login
sudo chage --lastday 1970-01-01 test_user_adm  # same effect (sets last change to epoch 0)
```

### chfn — Change Finger Information

`finger` displays user info from the comment (GECOS) field in a nicely formatted way.

```bash
sudo apt install finger     # install if not present
finger test_user_adm        # display user info
chfn -h                     # show available options
sudo chfn -r 122 test_user_adm          # set room number
sudo chfn -f "Full Name" -p 555-1111 -o "Other info" test_user_adm
```

### Forcing a Password Change on Next Login

Three equivalent ways:
```bash
passwd --expire test_add_user
sudo chage --lastday 1970-01-01 test_ad_user
sudo chage --lastday 0 test_ad_user
```

All three set the "last password changed" date to effectively expired, forcing the user to change it immediately on next login.

### Setting a User Password

```bash
sudo passwd test_user_adm       # privileged user sets another user's password
passwd                           # any user changes their own password
```

---

## 16. Locking, Unlocking, and Deleting User Accounts

### Locking a User Account

Three methods that all put a `!` at the front of the encrypted password in `/etc/shadow`, preventing login:

```bash
sudo usermod -L test_user_adm     # lock (uppercase L)
sudo passwd -l test_user_adm      # lock (lowercase l)
```

Check the status:
```bash
sudo passwd -S test_user_adm      # shows L for locked, P for password set
```

A locked account can still be accessed via `sudo su` or SSH with a key — locking only blocks password-based login.

### Unlocking a User Account

```bash
sudo usermod -U test_user_adm    # unlock
```

After unlocking, the user can log in again with the same password (as long as it hasn't expired).

### Making an Account Unusable Without Locking

Setting the shell to a non-login shell effectively blocks login:

```bash
sudo usermod -s /bin/nologin test_user_adm   # user gets "This account is currently not available" message
sudo usermod -s /bin/false test_user_adm     # silent rejection
```

The difference: with `/bin/nologin` the login time is **not** recorded. With `/bin/false` the login time **is** recorded even though login fails.

### Deleting a User Account

```bash
sudo userdel test_user_adm                # delete user but KEEP home directory and files
sudo userdel --remove-home test_ad_user   # delete user AND home directory
```

When a user is deleted but their files remain, the files show their UID number instead of username (since the name mapping no longer exists). The data is still intact.

---

## 17. Groups — Adding, Modifying, Deleting, and Members

### What Groups Are For

Every file and directory must have both a user owner and a group. Groups allow multiple users to share access to files without giving everyone full ownership.

```bash
groups                     # show all groups the current user belongs to
groups michael             # show groups for a specific user
id michael                 # show UID, GID, and all groups with numbers
getent group chemistry     # check if a group exists and see its members
```

### Adding and Deleting Groups

```bash
sudo groupadd team          # create a group called team
sudo groupdel delete_me     # delete a group
sudo groupmod -n chemistry team   # rename "team" to "chemistry"
```

Groups are stored in `/etc/group`. Viewing it doesn't require privileges:
```bash
cat /etc/group
```

Fields: `groupname : x : GID : members`

The shadow equivalent (`/etc/gshadow`) stores group passwords and admins:
```bash
sudo cat /etc/gshadow
```

### Adding Members to Groups

As a privileged user:
```bash
sudo usermod -aG chemistry lisa    # append (-a) lisa to the group (-G) chemistry
sudo usermod -G chemistry lisa     # WARNING: replaces ALL lisa's supplemental groups with just chemistry
sudo usermod -g chemistry ryan     # set ryan's PRIMARY group (lowercase g) to chemistry
```

The difference between lowercase `-g` and uppercase `-G` is critical:
- `-g` = set the **primary group** (the GID shown in `id`)
- `-G` = set **supplemental groups**
- `-aG` = **append** to supplemental groups (use this unless you want to replace all existing group memberships)

### Group Administrators

A group administrator can add/remove members without being a privileged user:

```bash
sudo gpasswd -A prof_scott chemistry           # add prof_scott as admin
sudo gpasswd -A "prof_sarah prof_scott" chemistry  # set the full list of admins (replaces)
```

As a group administrator:
```bash
gpasswd -a ryan chemistry          # add ryan to chemistry group
gpasswd -d dan chemistry           # remove dan from chemistry group
```

### Group Passwords and newgrp

A group password lets non-members temporarily join the group:

```bash
gpasswd chemistry              # set/change the group password (as admin or privileged user)
newgrp chemistry               # temporarily switch your GID to chemistry (prompts for password)
exit                           # leave the temporary group membership
```

The `newgrp` command lets a user (like Brenda, who isn't a member) use the group's features temporarily, similar to how `sudo su` lets you temporarily operate as another user.

---

## 18. File Permissions — chmod, chown, chgrp

### Understanding the Permissions Column

```
drwxr-xr-x
```

Reading left to right:
1. **File type** (`d` = directory, `-` = file, `l` = symlink)
2. **Owner permissions** (3 chars: `rwx`)
3. **Group permissions** (3 chars: `r-x`)
4. **Other permissions** (3 chars: `r-x`)

Each permission position:
- `r` = read (value: 4)
- `w` = write (value: 2)
- `x` = execute (value: 1)
- `-` = no permission (value: 0)

For directories, `x` means the ability to enter (CD into) the directory, not "execute a program." Even if a directory says a group can read/execute, those permissions can be overridden by the individual file's permissions within it.

### Changing Permissions — chmod

**Symbolic (alphabetic) notation:**

```bash
chmod u=rwx,g=rx,o=r nano_file.txt   # set specific permissions for each
chmod ugo=r nano_file.txt             # give all (user, group, other) read only
chmod a=r nano_file.txt               # same — 'a' means all (ugo)
chmod u+w nano_file.txt               # add write for owner
chmod g-rx nano_file.txt              # remove read and execute from group
chmod u+w,g-rx nano_file.txt          # multiple changes (no spaces around comma)
chmod -R u=rwx,g=rx,o=r new_directory/  # recursively apply to dir and all contents
```

**Octal (numeric) notation:**

Add up the values: read=4, write=2, execute=1, none=0.

```bash
chmod 754 nano_file.txt    # owner=7(rwx), group=5(r-x), other=4(r--)
chmod 700 nano_file.txt    # owner has all, no one else has anything
chmod 777 nano_file.txt    # everyone has everything (use carefully — a security risk)
```

> **Security note:** `777` on a web server means anyone can read, write, AND execute files in that directory. This is an open invitation to attackers. If public write access is needed, never also give execute. If execute is needed, never also give write.

### Changing Ownership — chown

Standard users can't change file owners. Only privileged users can:

```bash
sudo chown mary grocery_list.txt           # change owner to mary only
sudo chown michael: grocery_list.txt       # change owner AND group both to michael
sudo chown michael:plugdev grocery_list.txt  # change owner to michael, group to plugdev
sudo chown :cdrom grocery_list.txt         # change only the group (colon with no user before it)
```

A period `.` can be used instead of a colon and works identically:
```bash
sudo chown michael.michael grocery_list.txt   # same as michael:michael
```

### Changing Group — chgrp

```bash
chgrp cdrom grocery_list.txt     # change just the group
```

An owner can change the group of their own file, but only to a group they are a member of. A privileged user can change it to any group.

Why can't you just give your file to someone else? Two reasons:
1. Disk quotas — the file would stop counting against your quota and start counting against theirs
2. Security — someone could plant malicious code in a file then make it yours

---

## 19. Special Permissions — setuid, setgid, Sticky Bit

These are three special permission flags that go beyond regular rwx and are represented in the first character of a four-digit octal value or as special characters in `ls -l` output.

### setuid (Set User ID)

When the **setuid bit** is set on an executable, it runs with the permissions of the **file owner**, not the user who launched it.

The classic example is `/usr/bin/passwd`. Any user can change their own password with it, even though the actual `/etc/shadow` file is only writable by root. The `passwd` executable has its owner set to root and the setuid bit set, so when you run it, it executes with root's permissions.

```bash
ls -lh /usr/bin/passwd    # note the 's' where 'x' normally is
```

The `s` in place of the execute bit means setuid is set. An uppercase `S` means setuid is set but the file is not executable.

To set the setuid bit:
```bash
chmod u+s myfile          # symbolic
chmod 4755 myfile         # octal (4 = setuid, then regular 755)
```

> **Note:** For the setuid bit to work as intended (so any user can run the program with the owner's privileges), on Ubuntu/Mint-based systems the file owner must be **root**. It doesn't work on bash scripts — only on compiled executables (C programs, etc.).

### setgid (Set Group ID)

When the **setgid bit** is set on a **directory**, any file created inside that directory automatically inherits the directory's group — not the creating user's primary group. This solves a common collaboration problem where team members create files with their own personal group instead of the shared group.

```bash
sudo chmod g+s /srv/chemistry    # set setgid on the directory
sudo chmod 2770 /srv/chemistry   # octal (2 = setgid)
```

Now when Lisa (whose primary group is `lisa`) creates a file in `/srv/chemistry`, the new file's group is automatically set to `chemistry`.

### Sticky Bit

The **sticky bit** on a directory prevents users from deleting files they don't own, even if they have write permission on the directory itself.

The classic example is `/tmp`. Everyone needs to write temp files there, but nobody should be able to delete someone else's temp files.

```bash
ls -lh /         # look for 't' at the end of /tmp permissions
sudo chmod +t /srv/chemistry      # add sticky bit
sudo chmod o+t /srv/chemistry     # same (o for other)
sudo chmod 3770 /srv/chemistry    # octal (3 = setgid(2) + sticky(1))
```

With the sticky bit set, a user can only remove files they own. They cannot delete files belonging to others in that directory even if they have write permission to the directory.

A lowercase `t` in the permissions means the sticky bit is set AND `other` has execute. An uppercase `T` means the sticky bit is set but `other` does NOT have execute.

---

## 20. Access Control Lists (ACLs)

Standard Linux permissions only allow one owner and one group per file. **ACLs** break that limitation — you can give specific users or groups different permissions on the same file or directory.

> **Note:** ACLs may not be enabled on all Linux file systems or versions. Files with ACL permissions show a `+` after their permission string in `ls -l`.

### Viewing ACLs

```bash
getfacl chemistry       # show ACL permissions for the chemistry directory
```

The output shows: file name, owner, group, individual user ACL entries, group ACL entries, the mask, and "other" permissions.

### Setting ACLs

```bash
sudo setfacl -m g:auditors:rx chemistry          # give auditors group r+x on chemistry
sudo setfacl -m u:michael:rwx chemistry          # give michael user full access on chemistry
sudo setfacl -Rm u:michael:rwx chemistry         # recursively apply to dir and all current contents
```

Options:
- `-m` = modify (add/change)
- `-R` = recursive
- `g:groupname:permissions` — for a group
- `u:username:permissions` — for a user

### ACL Default Permissions

Default ACL permissions automatically apply to every **new** file or directory created inside a directory:

```bash
setfacl -d -m g:auditors:rx auditors_need_to_read/   # -d for default
```

Without defaults, new files don't inherit ACL permissions — they only get them if you re-run `setfacl` on them explicitly.

### The ACL Mask

The ACL mask limits the effective permissions for all ACL entries (except the owner). It's controlled by the group permission bits in `chmod`:

```bash
chmod g-wx auditors_need_to_read/    # sets mask to r-- (hiding write and execute)
```

Even if Michael has `rwx` in his ACL entry, the mask `r--` means the effective permission is `r` only.

### Removing ACLs

```bash
setfacl -x u:michael auditors_need_to_read/     # remove michael's ACL entry
setfacl -k auditors_need_to_read/               # remove default ACL permissions
setfacl -b auditors_need_to_read/               # remove ALL ACL permissions (as if never set)
setfacl -Rb /srv/chemistry                       # recursively remove all ACLs
```

---

## 21. File Attributes — chattr, lsattr

File attributes are low-level flags on individual files, separate from permissions and ACLs. They can only be changed by a privileged user, even if you own the file.

> **Note:** The `c` and `u` attributes do not work on ext2, ext3, and ext4 file systems (the most common). To check your file system type, view `/etc/fstab`.

### Viewing File Attributes

```bash
lsattr important_file.txt
lsattr -R chattr_test/          # recursively list attributes for a directory
```

The `e` attribute shown by default means "extents" (how the disk maps block locations). Don't change it.

### Immutable Attribute (i)

Makes a file completely unchangeable — cannot be edited, appended to, or deleted, even by root:

```bash
sudo chattr +i important_file.txt     # add immutable attribute
sudo chattr -i important_file.txt     # remove immutable attribute
```

To apply recursively to a directory:
```bash
sudo chattr -R +i chattr_test/
```

Even `sudo rm important_file.txt` will fail. You must first remove the immutable bit.

### Append-Only Attribute (a)

A file with the append-only attribute can only be added to — existing content cannot be overwritten or deleted, and the file cannot be removed:

```bash
sudo chattr +a important_file.txt    # add append-only attribute
echo "new content" >> important_file.txt   # works (append)
echo "new content" > important_file.txt    # fails (overwrite)
sudo rm important_file.txt                 # fails even as root
```

The append-only attribute is ideal for log files where you want to preserve history but allow new records to be added.

---

## 22. Date and Time Commands

### Viewing the Date and Time

```bash
date                    # current date and time in local timezone
date -u                 # current date and time in UTC
date -d yesterday       # yesterday's date and time
date -d tomorrow        # tomorrow's
date -d "2 weeks ago"   # 2 weeks ago (quotes needed for multi-word values)
date -d "2 weeks"       # 2 weeks from now
date -d "+2 weeks"      # same
date -d "2 weeks 3 days"  # 2 weeks and 3 days from now
date -d "12/25/2025"    # what day is Christmas 2025?
```

### Formatting the Date Output

After `date`, add a `+` followed by a format string:

```bash
date +%F                      # full date: YYYY-MM-DD
date +"%A %F"                 # full day name + date
date +'today is %A %Y/%m/%d'  # custom text with date
date +%T                      # time as HH:MM:SS
date +%H:%M                   # hours and minutes only
```

Common format codes:
- `%A` — full day name (Monday, Tuesday…)
- `%Y` — 4-digit year
- `%y` — 2-digit year
- `%m` — month (01–12)
- `%d` — day of month
- `%F` — full date (equivalent to `%Y-%m-%d`)
- `%T` — full time (equivalent to `%H:%M:%S`)
- `%H` — hour (24h)
- `%M` — minute

When a format string contains spaces, put it in quotes. Escape internal double quotes with a backslash if needed: `\"`

### Viewing Date and Time with timedatectl

```bash
timedatectl            # show all date/time/timezone info
```

This shows:
- Local time
- UTC time
- RTC (Real-Time Clock — the battery-backed hardware clock inside the computer)
- Timezone
- Whether NTP (Network Time Protocol) is active

### Changing the Date and Time

```bash
sudo date -s 2020-08-11         # set date (time is set to 00:00:00)
sudo timedatectl set-time 2020-07-22   # set both date and time
```

### NTP — Network Time Protocol

NTP syncs your computer's clock to highly accurate time servers (using atomic clocks, GPS, etc.):

```bash
sudo timedatectl set-ntp true    # enable NTP sync
sudo timedatectl set-ntp false   # disable NTP sync
sudo systemctl start systemd-timesyncd   # start the sync service
```

### Changing Timezones

```bash
timedatectl list-timezones                    # see all available timezones
sudo timedatectl set-timezone "America/Los_Angeles"
cat /etc/timezone                             # show current timezone (Ubuntu)
ls -l /etc/localtime                          # symlink showing current timezone
```

---

## 23. The stat Command

`stat` shows all the metadata stored on a file's inode, with more detail than `ls`:

```bash
stat grocery_list.txt
```

Output includes:
- File name, size, inode number
- Permissions (symbolic and octal)
- Number of hard links
- Owner (name and UID) and group (name and GID)
- Three timestamps: **Access time**, **Modify time**, **Change time** (plus birth date, which Linux doesn't implement)

### The Three Timestamps Explained

- **Access time (atime)** — last time the file was read. Updated on writes, and then once after the first read following a write (as of kernel 2.6.30+, changed for performance reasons). To make it update on every read, add `strictatime` to the options in `/etc/fstab` for your filesystem.
- **Modify time (mtime)** — last time the file content was modified. This is what `ls -l` shows.
- **Change time (ctime)** — last time the inode was changed (permissions, ownership, link count — even without touching content).

### Custom stat Output

```bash
stat --printf="%n\n" grocery_list.txt          # print just the filename
stat --printf="File: %n\nGroup: %G\nAccess rights: %A\n" grocery_list.txt
```

Valid format codes include:
- `%n` — filename
- `%A` — permissions in human-readable form
- `%G` — group name of owner
- `%x` — time of last access (human readable)

---

## 24. Word Count, Sort, Unique, and Pipes

### wc — Word Count

```bash
wc grocery_list.txt          # shows: lines  words  characters  filename
wc -l grocery_list.txt       # lines only
wc -w grocery_list.txt       # words only
wc -c grocery_list.txt       # characters (bytes) only
```

### sort

```bash
sort grocery_list.txt              # sort alphabetically (ascending)
sort -r grocery_list.txt           # sort in reverse (descending)
sort -u grocery_list.txt           # sort and remove duplicates
sort -uf grocery_list.txt          # unique + case-fold (treat upper and lower as same)
sort -k2 presidents_by_height.txt  # sort by the 2nd field/column
sort -nk2 presidents_by_height.txt # numeric sort by 2nd column
sort grocery_list.txt > sorted.txt # redirect sorted output to a file
```

`sort` reads the file and prints the sorted output. It does **not** modify the original file.

### uniq — Filter Consecutive Duplicate Lines

`uniq` only removes duplicates that are **adjacent** — you must sort first if duplicates are scattered throughout the file.

```bash
sort grocery_list.txt | uniq       # sort then filter duplicates
sort -i grocery_list.txt | uniq -i # case-insensitive
sort ... | uniq -d                 # show only duplicate lines
sort ... | uniq -D                 # show all instances of duplicated lines
sort ... | uniq -Di                # case-insensitive version of above
sort ... | uniq -c                 # count how many times each line appears
```

### Pipes — Chaining Commands

The **pipe** symbol `|` takes the output (stdout) of one command and feeds it as input (stdin) to the next:

```bash
sort grocery_list.txt | uniq
cat /etc/passwd | grep lisa         # find lisa's entry without reading the whole file
ls -lh | grep 2019                  # find all files last modified in 2019
ls -lh | grep "r-x"                 # find all files with r-x permissions
```

Pipes can be chained:
```bash
sort grocery_list.txt | uniq | head -10
```

### Running Multiple Commands on One Line

Three ways:
```bash
command1 ; command2            # always runs both, in order
command1 && command2           # only runs command2 if command1 succeeded
command1 || command2           # only runs command2 if command1 failed
```

The semicolon example (log rotation):
```bash
mv logfile.txt logfile_back.txt ; touch logfile.txt
```

---

## 25. The find Command

`find` searches for files in a directory hierarchy based on many different criteria. It's more powerful than `locate` and always searches live (no database needed).

### Basic Syntax

```bash
find [where] [criteria] [action]
find /home/michael/lcl -name "image.jpg"   # search by exact name
find . -name "image.jpg"                   # search from current directory (dot = here)
```

When you use an absolute path, results come back as absolute paths. When you use `.`, results come back as relative paths.

### Wildcards in find

Must be in quotes:
```bash
find . -name "*list*"              # any file containing "list"
find . -name "*.txt"               # any .txt file
find . -name "dirtbike?.txt"       # any file with one unknown character before .txt
find . -name "dirtbike[24].txt"    # only dirtbike2.txt and dirtbike4.txt
find . -name "dirtbike[2-4].txt"   # dirtbike2, 3, and 4
```

### Case-Insensitive Search

```bash
find . -iname "*dir*"              # -iname instead of -name
```

### Filter by Type

```bash
find . -name "*dir*" -type f       # only files (f)
find . -name "*dir*" -type d       # only directories (d)
```

### Limiting Search Depth

```bash
find . -maxdepth 1 -name "*list*"  # only the current directory, no subdirs
find . -mindepth 2 -name "*list*"  # only subdirectories 2+ levels deep
```

### Finding by Time

```bash
find . -mtime -7          # modified within last 7 days
find . -mtime +7          # modified more than 7 days ago
find . -mtime -7 -not -mtime +3   # modified between 3 and 7 days ago
find . -mmin -60          # modified within last 60 minutes
find . -atime -7          # accessed within last 7 days
find . -ctime -7          # changed (inode changed) within last 7 days
```

Using reference files for date range:
```bash
touch --date "1 week ago" ~/start_date
touch --date "3 days ago" ~/end_date
find . -newer ~/start_date -and -not -newer ~/end_date
```

Logical operators:
- `-and` or `-a` — both conditions must be true
- `-or` or `-o` — either condition can be true
- `-not` or `!` — negation

### Finding by Size, Owner, Group, Permissions

```bash
find . -size +1M            # files larger than 1 megabyte
find . -empty               # empty files
sudo find /srv/chemistry -user ryan   # files owned by user ryan
sudo find /srv/chemistry -group lisa  # files owned by group lisa
find . -perm 777             # files with exactly 777 permissions
```

### Filtering Out Paths

```bash
find . -newer ~/start_date -and -name "*.txt" -not -path "*/new_directory_2/*"
```

### Taking Action on Results

```bash
find . -perm 777 -delete    # delete all files with 777 permissions that find finds
```

> **Suggestion:** Before using `-delete`, always run the find command without it first so you can see exactly what would be deleted. This is a safety habit worth developing.

---

## 26. The locate Command

`locate` searches a pre-built database of filenames — much faster than `find` but potentially outdated:

```bash
locate grocery_list.txt       # fast search by filename
sudo updatedb                 # update the database (new files won't be found until then)
```

`locate` doesn't have the fine-grained filtering features of `find`. Use `find` when you need specific criteria; use `locate` when you just want to quickly find where a file is and know it's been on the system for a while.

---

## 27. grep — Searching Inside Files

`grep` stands for **Global Regular Expression Print**. It searches through files (or piped input) for lines that match a pattern and prints matching lines.

```bash
grep "orange" grocery_list.txt           # find lines containing "orange"
grep -i "orange" grocery_list.txt        # case-insensitive search
grep -w "orange" grocery_list.txt        # word-only (not inside "oranges")
grep -n "orange" grocery_list.txt        # show line numbers
grep -v "orange" grocery_list.txt        # inverse — show lines that DON'T match
grep -c "orange" grocery_list.txt        # count of matching lines
grep -r "nut" ~/lcl/                     # recursively search a directory
grep -rn "nut" ~/lcl/                    # recursive with line numbers
grep -rh "nut" ~/lcl/                    # recursive, hide file path
grep -l "nut" ~/lcl/                     # only show filenames that contain a match
grep -L "nut" ~/lcl/                     # only show filenames that DON'T contain a match
```

It's best practice to always put your regex pattern in quotes.

### Piping into grep

```bash
cat /etc/passwd | grep lisa           # find lisa's entry in passwd
ls -lh | grep "2019"                  # files modified in 2019
ls -lh | grep "r-x"                   # files with r-x in permissions string
```

You can pipe grep into grep:
```bash
ls -lh | grep "^gr" | grep "[aeiou][aeiou]"   # lines starting with 'gr' AND containing two adjacent vowels
```

---

## 28. Regular Expressions (Regex) with grep

A regular expression is a pattern-matching language used to find text. They're used across many programming languages and tools.

### Basic Wildcard Characters

- `.` — matches any single character (there must be exactly one character)
- `\` before a special character — escapes it (treats it literally). Use `\.` to search for a literal period instead of any character.

```bash
grep "s...r" grocery_list.txt       # "s" + any 3 chars + "r" → sugar, raspberries
grep "\.txt" grocery_list.txt       # literal ".txt" not "Xtxt"
```

### Anchors

- `^` — at the start of the pattern means "line starts with"
- `$` — at the end of the pattern means "line ends with"

```bash
grep "^c" grocery_list.txt          # lines starting with lowercase c
grep "s$" grocery_list.txt          # lines ending with lowercase s
grep "chips$" grocery_list.txt      # lines ending with the word "chips"
```

### Brackets and Character Classes

- `[ch]` — matches any single character inside the brackets (c or h)
- `[^ch]` inside brackets — the `^` here means NOT (c or not h)
- `[a-z]` — any single character in the range a through z
- `[A-Z]` — any uppercase letter
- `[0-9]` — any digit
- `[A-Z0-9]` — uppercase or digit

```bash
grep "^[ch]" grocery_list.txt         # lines starting with c or h
grep "^[^ch]" grocery_list.txt        # lines NOT starting with c or h
grep "[A-Z]" grocery_list.txt         # lines containing any uppercase letter
grep "[A-Z0-9]" grocery_list.txt      # lines with uppercase letters or numbers
```

POSIX character classes (need double brackets):
```bash
grep "[[:upper:]]" grocery_list.txt   # same as [A-Z]
grep "[[:upper:][:digit:]]" grocery_list.txt
```

### Quantifiers

- `*` — the preceding character can occur **zero or more** times
- `?` — the preceding character can occur **zero or one** time (extended regex: needs `-E`)
- `+` — the preceding character occurs **one or more** times (extended regex: needs `-E`)

```bash
grep "colou*r" grocery_list.txt       # matches color and colour (u zero or more times)
grep -E "colou?r" grocery_list.txt    # u zero or one time (? is extended)
grep -E "colou+r" grocery_list.txt    # u one or more times (not "color")
grep "co.*r" grocery_list.txt         # period-star = any characters (zero or more)
```

The `*` in regex is NOT the same as the `*` wildcard in filename expansion. In regex, `.*` means "any characters" (period = one char, star = zero or more of it).

### OR Expression (Extended)

```bash
grep -E "chips|salsa" grocery_list.txt          # lines containing chips OR salsa
grep -E "chips|salsa|butter" grocery_list.txt   # three options
```

Always use quotes around the pattern — without them, the shell interprets the `|` as a pipe.

---

## 29. tr — Translate Characters

`tr` translates or deletes single characters. Unlike `grep` and `sed`, `tr` does not accept a filename as an argument directly — you must redirect input with `<` or pipe with `|`.

```bash
tr 'a' '@' < grocery_list.txt            # replace all lowercase a with @
cat grocery_list.txt | tr 'a' '@'        # same via pipe
```

### Multiple Character Translations

```bash
tr 'au' '@-' < grocery_list.txt          # a→@ and u→-
tr 'auc' '@-' < grocery_list.txt         # extra char on left: c also maps to - (last char on right)
tr 'a-z' 'A-Z' < grocery_list.txt        # make everything uppercase (range syntax)
tr '[:lower:]' '[:upper:]' < grocery_list.txt   # same, using character classes
```

When more characters are on the left than the right, the excess left characters all map to the last right character.

### Changing Line Returns to Spaces

```bash
tr '\n' ' ' < grocery_list.txt           # turn newlines into spaces (prints everything on one line)
```

### Delete Option (-d)

```bash
tr -d '[:digit:]' < myfile.txt           # delete all digits
tr -dc '[:digit:]' < myfile.txt          # delete the COMPLEMENT (everything except digits)
```

The `-c` flag means "complement" — operate on everything except the specified characters.

### Squeeze Repeated Characters (-s)

```bash
tr -s '[:digit:]' < myfile.txt           # squeeze repeated consecutive digits into one
tr -ds '[:digit:]' '[:alpha:]' < myfile.txt  # delete digits AND squeeze repeated alpha chars
```

### Converting CSV to TSV

```bash
tr ',' '\t' < presidents_by_height.csv > presidents_by_height.tsv
```

---

## 30. sed — Stream Editor

`sed` is short for **stream editor**. It processes text line by line and applies editing operations. Unlike `tr`, `sed` can accept a filename directly.

`sed` does not modify the input file — output goes to the screen unless redirected.

### Substitute (s command) — Most Common Feature

```bash
sed 's/a/@/' grocery_list.txt           # replace FIRST occurrence of 'a' with '@' per line
sed 's/a/@/2' grocery_list.txt          # replace only the SECOND occurrence per line
sed 's/a/@/g' grocery_list.txt          # replace ALL occurrences (g = global)
sed 's/yogurt/Yogurt/' grocery_list.txt # replace a whole word
```

The delimiter after `s` doesn't have to be `/`. You can use any character:
```bash
sed 's:a:@:' grocery_list.txt          # colon as delimiter
sed 's|a|@|' grocery_list.txt          # pipe as delimiter
sed 'sda@d' grocery_list.txt           # 'd' as delimiter (reads 'd' means: delimit with 'd')
```

Whatever character immediately follows the `s` becomes the delimiter.

### Regex in the Search Value

```bash
sed 's/^c/  c/' grocery_list.txt        # indent all lines starting with 'c' by 2 spaces
sed 's/^/  /' grocery_list.txt          # indent every line by 2 spaces
sed 's/[aeiou]/*/g' grocery_list.txt    # replace all vowels with asterisk
sed 's/[aeiou]//g' grocery_list.txt     # remove all vowels
```

### The Ampersand (&) — Include the Match in the Replacement

```bash
sed 's/corn/{&}/' grocery_list.txt       # puts {} around whatever matches
sed 's/c.*r/{&}/' grocery_list.txt       # puts {} around any pattern matching c.*r
```

The `&` inserts the entire matched string into the replacement.

### Numbered Back-References (\1, \2…)

Use escaped parentheses to capture parts of the match:

```bash
sed 's/\(little\) \(lamb\)/\2 \1/' mary.txt     # swap "little" and "lamb"
```

With `-E` (extended regex), no backslashes needed before parentheses:
```bash
sed -E 's/(little) (lamb)/\2 \1/' mary.txt
sed -E 's/(tomatoes|corn|nuts)/canned \1/' grocery_list.txt
```

### Printing Lines — p Option

```bash
sed -n 'p' presidents.csv         # turn off default output (-n), then print manually
sed -n '1p' presidents.csv        # print only line 1
sed -n '3p' presidents.csv        # print only line 3
sed -n '$p' presidents.csv        # print the last line ($ = last)
sed -n '2,$p' presidents.csv      # print from line 2 to end
sed -n '5,9p' presidents.csv      # print lines 5 through 9
sed -n '/^c/p' grocery_list.txt   # print lines matching a regex
```

### Printing Ranges by Regex

```bash
sed -n '/^r/,/^c/p' grocery_list.txt   # start printing at first 'r' line, stop at first 'c' line
```

Sed keeps searching and repeating: finds next `r`-start line, prints until the next `c`-start line.

### Quitting Early — q

```bash
sed '11q' grocery_list.txt     # print the first 11 lines then quit (like head)
sed '3q' grocery_list.txt      # print first 3 lines
```

### Multiple sed Commands (-e and -f)

```bash
sed -e 's/a/\&/' -e 's/^c/  c/' grocery_list.txt   # run two edits on same file
```

Or store them in a file:
```bash
nano sed_file.txt               # write sed commands in the file (no quotes, just the command)
sed -f sed_file.txt grocery_list.txt    # run all commands from the file
```

`sed` can also process multiple input files in sequence.

### Turning Off Default Printing and Selective Substitution

```bash
sed -n 's/a/@/p' grocery_list.txt    # only show lines where a substitution was made
sed 's/a/@/gp' grocery_list.txt      # show all lines (default), but substituted ones appear twice
```

---

## 31. cut — Extract Columns and Fields

`cut` extracts specific columns (characters) or fields from each line of text.

### Cutting by Character Position

```bash
cut -c 2-10 dir.txt             # extract characters 2 through 10
cut -c 2-10,14-20 dir.txt       # extract two separate character ranges (no spaces between!)
cut -c 48- dir.txt              # extract from column 48 to end of line
cut -c 2-10,14-20,48- dir.txt   # three ranges together
```

You can add an output delimiter between the ranges:
```bash
cut -c 2-10,48- --output-delimiter=", " dir.txt
```

### Cutting by Field (Delimiter-Based)

For tab-separated files (`tsv`) and others:

```bash
cut -f 2,3 presidents_by_height.tsv   # extract fields 2 and 3 (default delimiter = tab)
cut -f 2-4 presidents.tsv             # fields 2 through 4
cut -f -3 presidents.tsv              # from beginning to field 3
cut -f 3- presidents.tsv              # from field 3 to end
```

For CSV files (comma-separated), you must specify the delimiter:
```bash
cut -f 2,3 -d "," presidents.csv      # specify comma as delimiter
cut -f 2,3 -d "," --output-delimiter=", " presidents.csv
```

For colon-delimited files like `/etc/passwd`:
```bash
cut -f 1,6 -d ":" /etc/passwd         # extract username and home directory
```

### Using echo + wc to Find Column Positions

To find exactly which column number corresponds to a field:

```bash
echo "text up to the character you want" | tr -dc '[:print:]' | wc -c
```

`tr -dc '[:print:]'` removes non-printable characters (including the newline that `echo` adds). The `-dc` means "delete the complement of printable characters," leaving only printable characters. `wc -c` then counts them accurately.

---

## 32. awk — Field Processing and Scripting

`awk` (named after its creators: **A**ho, **W**einberger, and **K**ernighan) is a programming language for processing structured text. It's often used as single-line scripts from the command line.

A typical `awk` one-liner: `awk 'condition { action }' filename`

### Basic Field Printing

By default, `awk` splits each line into fields by whitespace:

```bash
awk '{print $2}' presidents.tsv         # print field 2
awk '{print $2, $3}' presidents.tsv     # print fields 2 and 3 (space between)
awk '{print $2 "," $3}' presidents.tsv  # print with comma separator
awk '{print $2 "\t" $3}' presidents.tsv # print with tab separator
```

`$0` = the entire line, `$1` = first field, `$2` = second, etc.

### Specifying Input Field Separator

By default, `awk` uses any whitespace (space, tab, etc.) as the delimiter. For tab-only:

```bash
awk -F "\t" '{print $2, $3}' presidents.tsv    # use tab as field separator
```

### Conditions

```bash
awk 'NF == 10 {print NF, $0}' presidents.tsv    # only lines with exactly 10 fields
awk '$1 == "Mary" {print $0}' mary.txt           # lines where field 1 is "Mary"
awk '$1 ~ /ary/ {print $0}' mary.txt             # lines where field 1 contains "ary" (tilde = regex match)
awk '/^c/' grocery_list.txt                      # lines starting with c (like grep)
```

### NF and NR — Built-in Variables

- `NF` — **Number of Fields** on the current line
- `NR` — **Number of Records** read so far (effectively the line number)

```bash
awk '{print NF, $0}' mary.txt           # print field count + line
awk '{print NR, $0}' mary.txt           # print line number + line
awk 'NR == 2 {print NR, $0}' mary.txt   # print only line 2
awk 'NR > 1 {print $0}' mary.txt        # skip the first line (like skipping a header)
awk '$NF' mary.txt                       # print the last field on each line
awk '$(NF-1)' mary.txt                  # print the second-to-last field
```

### Case-Insensitive Search with awk

`awk` doesn't have a `-i` flag like `grep`. Use `tolower()`:

```bash
awk '{if(tolower($0) ~ /apple/) print $0}' grocery_list.txt
```

### Printing Formatted Output

```bash
awk 'NR == 2 {print NR " - " $0}' mary.txt    # add text around output
```

---

## Summary of Key Commands (Quick Reference)

| Command | Purpose |
|---------|---------|
| `ls -lah` | List files with details, sizes, hidden files |
| `cd ~` | Go to home directory |
| `pwd` | Print current directory |
| `touch file.txt` | Create file or update timestamp |
| `mkdir -p a/b/c` | Create nested directories |
| `nano file.txt` | Open/create file in Nano editor |
| `cat -n file.txt` | Print file with line numbers |
| `less -M file.txt` | Scroll through file |
| `head -n 20 file.txt` | First 20 lines |
| `tail -f logfile.txt` | Follow a file live |
| `mv a b` | Move or rename |
| `cp -rv a/ b/` | Recursive verbose copy |
| `rm -rI dir/` | Recursively delete with single confirmation |
| `ln -s target link` | Create symbolic link |
| `sudo useradd -m user` | Add user with home directory |
| `sudo passwd user` | Set user password |
| `sudo usermod -aG group user` | Add user to group |
| `chmod 755 file` | Set permissions (octal) |
| `chown user:group file` | Change owner and group |
| `setfacl -m u:user:rwx dir` | Set ACL for a user |
| `chattr +i file` | Make file immutable |
| `date +"%A %F"` | Formatted date |
| `timedatectl` | View/manage system time |
| `stat file` | Full file metadata |
| `wc -l file` | Count lines |
| `sort -uf file` | Sort uniquely, case-insensitive |
| `find . -name "*.txt"` | Find files by name |
| `grep -i pattern file` | Case-insensitive search |
| `grep -rn pattern dir/` | Recursive search with line numbers |
| `sed 's/old/new/g' file` | Replace all occurrences |
| `cut -f 2,3 -d "," file` | Cut fields from CSV |
| `awk '{print $1, $2}' file` | Print fields 1 and 2 |
| `command1 \| command2` | Pipe output of cmd1 as input to cmd2 |
| `command > file` | Redirect stdout to file (overwrite) |
| `command >> file` | Redirect stdout to file (append) |
| `command 2>/dev/null` | Discard error messages |

---

## Questions to Test Your Understanding

1. What's the difference between an absolute path and a relative path? Give an example of each.
2. Why can't you hard link to a directory? Why can you symlink to one?
3. When would you use `chmod 700` versus `chmod 755`?
4. What does `setuid` do, and why must the file owner be root for it to be useful on Ubuntu?
5. What's the difference between `usermod -G group user` and `usermod -aG group user`? Why is the first one potentially dangerous?
6. When does a file's `ctime` change without its `mtime` changing?
7. What's the difference between `grep "^c"` and `grep "[^c]"` in terms of what they match?
8. If you run `sed 's/a/@/'` on a line that contains `"banana"`, what does the output look like? What if you add the `g` flag?
9. Why must `uniq` be combined with `sort` to fully remove duplicates from a file?
10. What does `NF` stand for in `awk`, and how can you use it to print only the last field of a line?

---

*These notes cover the complete Linux Command Line tutorial series from introduction through awk. Each section preserves all techniques demonstrated in the video and adds contextual explanations, suggestions, and questions to deepen understanding.*
