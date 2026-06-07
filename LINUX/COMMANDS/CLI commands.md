# Linux Command Line — Command Reference Sheet

> Quick reference for every command covered in the tutorial series. Each entry shows what the command does and its key options with examples.

---

## Navigation & Directory Commands

---

### `pwd`
Prints the full path of the directory you are currently in.
```bash
pwd
```

---

### `cd` — Change Directory
Moves you into a different directory.
```bash
cd Documents          # move into Documents (relative path)
cd /home/michael      # move to an absolute path
cd ..                 # go up one level to the parent directory
cd ../..              # go up two levels
cd ../Downloads       # go up one level then into Downloads
cd -                  # jump back to the previous directory you were in
cd                    # go straight to your home directory
cd ~                  # same as above — tilde always means home directory
cd ~/Downloads        # go to Downloads inside your home directory, from anywhere
```

---

### `ls` — List Directory Contents
Lists files and directories. Use `man ls` to see all available options.
```bash
ls                    # basic list of current directory
ls /home              # list a specific directory
ls -a                 # show all files including hidden ones (names starting with .)
ls -l                 # long format — shows permissions, owner, group, size, date
ls -h                 # human-readable sizes (4K instead of 4096) — use with -l
ls -lh                # long format with human-readable sizes
ls -la                # long format showing hidden files too
ls -lah               # long format + human-readable + hidden files
ls -i                 # show inode number for each file
ls -lhi               # long format + human-readable + inode numbers
```

---

### `man` — Manual
Opens the built-in documentation for any command. The name says it all.
```bash
man ls                # open the manual for ls
man cd
man grep
```
**Inside man pages:**
- Arrow keys — scroll line by line
- Page Down / Page Up — scroll by screen
- `h` — show navigation help
- `q` — quit

---

### `tree` — Visual Directory Tree
Displays a directory's contents as a visual tree. May need installing first.
```bash
sudo apt install tree       # install if not present
tree -a                # show all files including hidden ones 
```

---

## File and Directory Creation

---

### `touch` — Create a File / Update Timestamp
Creates an empty file if it doesn't exist. If the file already exists, updates its timestamp.
```bash
touch newfile.txt
touch file1.txt file2.txt       # create multiple files at once
touch file{1,2,3}.txt           # create file1.txt, file2.txt, file3.txt
touch file{1..5}.txt            # create file1.txt through file5.txt (range)
```

---

### `mkdir` — Make Directory
Creates a new directory.
```bash
mkdir my_directory
mkdir -p a/b/c                  # -p creates all parent directories in the path if they don't exist
```

---

### `echo` — Print Text to Screen
Reads input and prints it to the terminal. Also commonly used to write text into files.
```bash
echo "hello world"
echo hello world                # quotes optional for plain text
echo 'hello world'              # single quotes work too
echo "hello" > file.txt         # write text into a file (overwrites)
echo "hello" >> file.txt        # append text to a file
```

---

### `printf` — Print Formatted Text
Like echo but supports formatting characters like `\n` (new line) and `\t` (tab).
```bash
printf "line one\nline two\n" > myfile.txt
printf "Name:\t%s\n" "Michael"
```

---

## Text Editors

---

### `nano` — Simple Text Editor
Beginner-friendly editor. Controls are shown at the bottom of the screen.
```bash
nano myfile.txt           # open or create a file
```
**Key controls inside nano:**
- Type to insert text
- `Ctrl + O` — save (write out)
- `Ctrl + X` — exit
- `Ctrl + A` — go to beginning of line
- `Ctrl + E` — go to end of line

---

### `vi` / `vim` — Advanced Text Editor
Powerful but modal — you must switch modes to type or run commands.
```bash
vi myfile.txt
```
**Key controls inside vi:**
- `i` — enter insert mode (now you can type)
- `Esc` — leave insert mode
- `:w` — save (write)
- `:q` — quit
- `:wq` — save and quit
- `:q!` — quit without saving

---

## Reading Files

---

### `cat` — Print File Contents
Prints an entire file's contents to the terminal. Also concatenates multiple files.
```bash
cat file.txt
cat file1.txt file2.txt         # print both files as if one
cat -n file.txt                 # print with line numbers
```

---

### `more` — Paged File Reading
Shows one screenful at a time. Press Space for the next page.
```bash
more file.txt
```

---

### `less` — Improved Paged File Reading
Like more but can scroll backward and doesn't load the whole file at once.
```bash
less file.txt
less -M file.txt                # show filename, line count, and percentage
```
**Inside less:**
- Arrow keys — line by line
- Page Down / Page Up — page by page
- `q` — quit

---

### `head` — Show Beginning of File
Shows the first 10 lines by default.
```bash
head file.txt
head -n 25 file.txt             # show first 25 lines
head -3 file.txt                # show first 3 lines
```

---

### `tail` — Show End of File
Shows the last 10 lines by default.
```bash
tail file.txt
tail -n 25 file.txt             # show last 25 lines
tail -f file.txt                # follow mode — shows new lines as they are added live
```

---

## Output Redirection

---

### `>` — Redirect Standard Output (Overwrite)
```bash
ls -lh > output.txt             # write ls output into output.txt (creates or overwrites)
echo "text" > file.txt
```

### `>>` — Redirect Standard Output (Append)
```bash
ls -lh >> output.txt            # append ls output to output.txt
```

### `2>` — Redirect Standard Error
```bash
cat file.txt 2> errors.txt      # save error messages to errors.txt
cat file.txt 2> /dev/null       # discard errors entirely (/dev/null = black hole)
```

### `&>` — Redirect Both stdout and stderr Together
```bash
cat file.txt &> output.txt      # send both normal output and errors to one file
```

### `<` — Redirect Input from a File
```bash
tr 'a' '@' < grocery_list.txt   # feed file content into tr as input
```

---

## Moving, Copying, Renaming, Deleting

---

### `mv` — Move or Rename
```bash
mv file.txt Documents/          # move file into Documents directory
mv file.txt renamed.txt         # rename file (same directory)
mv file.txt Documents/new.txt   # move and rename at the same time
mv -v file.txt dest/            # -v verbose: show what was moved
mv -n file.txt dest/            # -n no-clobber: don't overwrite if destination exists
mv -i file.txt dest/            # -i interactive: ask before overwriting
mv -f file.txt dest/            # -f force overwrite (this is the default behavior)
```

---

### `cp` — Copy
```bash
cp file.txt Documents/          # copy file into Documents
cp file.txt file_copy.txt       # copy in same directory (must rename)
cp -r mydir/ dest/              # -r recursive: required when copying directories
cp -v file.txt dest/            # -v verbose
cp -n file.txt dest/            # -n no-clobber
cp -i file.txt dest/            # -i interactive
cp -u file.txt dest/            # -u update: only copy if source is newer
cp -a mydir/ dest/              # -a archive: preserve permissions, ownership, timestamps
```

---

### `rm` — Remove Files and Directories
```bash
rm file.txt                     # delete a file (no trash, gone permanently)
rm -v file.txt                  # -v verbose: confirm what was deleted
rm -i file.txt                  # -i interactive: ask before each deletion
rm -r mydir/                    # -r recursive: delete directory and all its contents
rm -ri mydir/                   # ask before deleting every single file inside
rm -rI mydir/                   # ask once before deleting the whole directory tree (uppercase I)
rm -rf mydir/                   # force delete with no prompts (use with extreme care)
```

---

### `rmdir` — Remove Empty Directory
Only works if the directory is completely empty.
```bash
rmdir empty_directory
```

---

## Links

---

### `ln` — Create Links
```bash
ln file.txt file_link.txt           # hard link: another name pointing to the same inode/data
ln -s file.txt file_symlink.txt     # -s soft/symbolic link: a pointer to the filename
ln file.txt newdir/file.txt         # hard link in a different directory
```

### `unlink` — Remove a Symbolic Link
```bash
unlink file_symlink.txt
```

---

## Users and Accounts

---

### `adduser` — Add a New User (Interactive)
```bash
sudo adduser username              # walks through prompts for password, name, phone etc.
```

---

### `useradd` — Add a New User (Minimal)
```bash
sudo useradd username              # creates account only, no home directory
sudo useradd -m username           # -m creates a home directory too
```

---

### `passwd` — Set or Change Password
```bash
passwd                             # change your own password
sudo passwd username               # set or change another user's password
passwd --expire username           # force user to change password on next login
passwd -l username                 # lock the account (lowercase l)
passwd -S username                 # show account status (S = status)
```

---

### `usermod` — Modify a User Account
```bash
sudo usermod -s /bin/zsh username          # -s change the user's shell
sudo usermod -d /new/home username         # -d change home directory (doesn't move files)
sudo usermod -d /new/home -m username      # -d and -m: change home and move files
sudo usermod -l newname oldname            # -l change login name
sudo usermod -c "comment" username         # -c update the comment/GECOS field
sudo usermod -L username                   # -L lock the account (uppercase L)
sudo usermod -U username                   # -U unlock the account (uppercase U)
sudo usermod -G groupname username         # -G set supplemental group (replaces existing)
sudo usermod -aG groupname username        # -aG append to supplemental groups (safe)
sudo usermod -g groupname username         # -g change primary group (lowercase g)
sudo usermod -s /bin/nologin username      # set shell to nologin — prevents login
sudo usermod -s /bin/false username        # set shell to false — silent login rejection
```

---

### `userdel` — Delete a User
```bash
sudo userdel username                      # delete user, keep home directory and files
sudo userdel --remove-home username        # delete user AND home directory
```

---

### `chage` — Change Password Aging
```bash
sudo chage -l username                     # -l list all aging info for the user
sudo chage -m 14 username                  # -m minimum days before password can be changed
sudo chage -M 90 username                  # -M maximum days before password must change
sudo chage -E "2025-12-31" username        # -E set account expiry date
sudo chage --lastday 0 username            # force password change on next login
sudo chage --lastday 1970-01-01 username   # same effect
```

---

### `chfn` — Change Finger Information (User Details)
```bash
chfn -h                                    # show all options
sudo chfn -r 122 username                  # -r set room number
sudo chfn -p 555-1234 username             # -p set work phone
sudo chfn -h 555-5678 username             # -h set home phone
sudo chfn -f "Full Name" username          # -f set full name
sudo chfn -o "other info" username         # -o set other information
finger username                            # display user info (install with apt if missing)
```

---

### `su` — Switch User
```bash
su -                              # switch to root user
sudo su username                  # switch to another user (asks for your password)
whoami                            # show which user you currently are
exit                              # return to previous user
```

---

### `id` — Show User and Group IDs
```bash
id                                # show your own UID, GID, and all groups
id username                       # show another user's IDs
```

---

### `last` — Show Login History
```bash
last username                     # show login/logout history for a user
```

---

## Groups

---

### `groupadd` — Create a Group
```bash
sudo groupadd groupname
```

---

### `groupdel` — Delete a Group
```bash
sudo groupdel groupname
```

---

### `groupmod` — Modify a Group
```bash
sudo groupmod -n newname oldname   # -n rename a group
```

---

### `gpasswd` — Manage Group Passwords and Members
```bash
sudo gpasswd -A username groupname        # set a group administrator
gpasswd -a username groupname             # add a member to the group (as group admin)
gpasswd -d username groupname             # remove a member from the group
gpasswd groupname                         # set a password for the group
```

---

### `newgrp` — Temporarily Switch Primary Group
```bash
newgrp groupname       # temporarily switch your active GID to groupname (prompts for group password if set)
exit                   # leave the temporary group session
```

---

### `groups` — Show Group Memberships
```bash
groups                 # show all groups your current user belongs to
groups username        # show groups for another user
```

---

### `getent` — Get Database Entry
Looks up records from system databases like passwd and group.
```bash
getent passwd username          # show the /etc/passwd record for a user
getent group groupname          # show the /etc/group record and its members
```

---

## File Permissions

---

### `chmod` — Change File Mode (Permissions)
```bash
# Symbolic notation
chmod u=rwx,g=rx,o=r file.txt      # set specific permissions per category
chmod a=r file.txt                  # give all (user, group, other) read only
chmod u+w file.txt                  # add write for owner
chmod g-rx file.txt                 # remove read and execute from group
chmod u+w,g-rx file.txt             # multiple changes in one command
chmod -R u=rwx,g=rx,o=r mydir/     # -R recursive: apply to directory and all contents

# Octal notation (read=4, write=2, execute=1, none=0)
chmod 755 file.txt                  # owner=rwx(7), group=rx(5), other=rx(5)
chmod 700 file.txt                  # owner=rwx, no one else has any access
chmod 644 file.txt                  # owner=rw, group=r, other=r (common for files)
chmod 4755 file.txt                 # setuid + 755
chmod 2770 mydir/                   # setgid + 770
chmod 3770 mydir/                   # sticky bit + setgid + 770
chmod +t mydir/                     # add sticky bit
chmod g+s mydir/                    # add setgid
chmod u+s file.txt                  # add setuid
```

---

### `chown` — Change Owner (and Optionally Group)
Requires sudo.
```bash
sudo chown mary file.txt               # change owner to mary only
sudo chown mary:plugdev file.txt       # change owner to mary, group to plugdev
sudo chown :cdrom file.txt             # change group only (colon with no user before it)
sudo chown michael: file.txt           # change owner and group both to michael
sudo chown -R michael: mydir/          # -R recursive: apply to directory and all contents
```

---

### `chgrp` — Change Group
```bash
chgrp cdrom file.txt                   # change group to cdrom
chgrp -R chemistry mydir/              # -R recursive
```

---

## Access Control Lists (ACLs)

---

### `setfacl` — Set File ACL Permissions
```bash
sudo setfacl -m g:auditors:rx chemistry/       # -m modify: give auditors group r+x
sudo setfacl -m u:michael:rwx chemistry/       # give user michael full access
sudo setfacl -Rm u:michael:rwx chemistry/      # -R recursive: apply to all files inside too
sudo setfacl -d -m g:auditors:rx mydir/        # -d default: apply to all new files created inside
sudo setfacl -x u:michael mydir/               # -x remove michael's ACL entry
sudo setfacl -k mydir/                         # -k remove default ACL permissions
sudo setfacl -b mydir/                         # -b remove all ACL permissions entirely
sudo setfacl -Rb mydir/                        # recursive remove all ACLs
```

---

### `getfacl` — View File ACL Permissions
```bash
getfacl filename
getfacl chemistry/
```

---

## File Attributes

---

### `chattr` — Change File Attributes
Only a privileged user can change attributes, even on files they own.
```bash
sudo chattr +i file.txt           # +i add immutable: file cannot be changed, deleted, or renamed
sudo chattr -i file.txt           # -i remove immutable attribute
sudo chattr +a file.txt           # +a add append-only: can only add to file, not overwrite or delete
sudo chattr -a file.txt           # -a remove append-only attribute
sudo chattr -R +i mydir/          # -R recursive: apply to directory and all contents
sudo chattr -R +a mydir/
```

---

### `lsattr` — List File Attributes
```bash
lsattr file.txt
lsattr -R mydir/                  # -R recursive
```

---

## Date and Time

---

### `date` — Show or Set Date and Time
```bash
date                              # current date and time in local timezone
date -u                           # UTC time
date -d yesterday                 # yesterday's date
date -d tomorrow                  # tomorrow's date
date -d "2 weeks ago"             # 2 weeks in the past
date -d "2 weeks"                 # 2 weeks from now
date -d "+2 weeks"                # same
date -d "2 weeks 3 days"          # 2 weeks and 3 days from now
date -d "12/25/2025"              # what day of the week is Christmas 2025
date -s "2020-08-11"              # set the date (requires sudo)

# Formatting output
date +%F                          # YYYY-MM-DD
date +"%A %F"                     # full day name + date
date +%T                          # time as HH:MM:SS
date +%H:%M                       # hours and minutes only
```

---

### `timedatectl` — Manage System Time and Timezone
```bash
timedatectl                                         # show all time/date/timezone info
timedatectl list-timezones                          # list all available timezones
sudo timedatectl set-timezone "America/Los_Angeles" # change timezone
sudo timedatectl set-time "2020-07-22"              # set date and time
sudo timedatectl set-ntp true                       # enable NTP (internet time sync)
sudo timedatectl set-ntp false                      # disable NTP
```

---

### `systemctl` — Manage System Services
```bash
sudo systemctl start systemd-timesyncd      # start the time sync service
sudo systemctl status systemd-timesyncd     # check its status
```

---

## File Information

---

### `stat` — Show Full File Metadata
```bash
stat file.txt
stat --printf="%n\n" file.txt               # custom output: just the filename
stat --printf="File: %n\nGroup: %G\n" file.txt
```

---

## Searching and Filtering

---

### `find` — Search for Files and Directories
```bash
find /home/michael -name "image.jpg"        # search by exact name
find . -name "image.jpg"                    # search from current directory
find . -name "*list*"                       # wildcard: any file containing "list"
find . -name "*.txt"                        # any .txt file
find . -iname "*dir*"                       # -i case-insensitive name search
find . -name "*dir*" -type f               # -type f files only
find . -name "*dir*" -type d               # -type d directories only
find . -maxdepth 1 -name "*list*"          # only search current directory, no subdirs
find . -mindepth 2 -name "*list*"          # start searching from 2 levels deep
find . -mtime -7                            # modified within last 7 days
find . -mtime +7                            # modified more than 7 days ago
find . -mmin -60                            # modified within last 60 minutes
find . -atime -7                            # accessed within last 7 days
find . -ctime -7                            # inode changed within last 7 days
find . -size +1M                            # files larger than 1 megabyte
find . -empty                              # empty files
find . -perm 777                            # files with exactly 777 permissions
sudo find /srv -user ryan                   # files owned by user ryan
sudo find /srv -group lisa                  # files owned by group lisa
find . -mtime -7 -and -name "*.txt"        # combine criteria with -and
find . -mtime -7 -not -mtime +3            # modified between 3 and 7 days ago
find . -perm 777 -delete                   # delete everything found
```

---

### `locate` — Fast File Search Using a Database
```bash
locate filename                 # fast search (uses a pre-built database)
sudo updatedb                   # update the database so new files are found
```

---

### `grep` — Search Inside Files
```bash
grep "pattern" file.txt             # find lines containing pattern
grep -i "pattern" file.txt          # -i case-insensitive
grep -w "word" file.txt             # -w whole word only (not inside larger words)
grep -n "pattern" file.txt          # -n show line numbers
grep -v "pattern" file.txt          # -v inverse: show lines that DON'T match
grep -c "pattern" file.txt          # -c count of matching lines
grep -r "pattern" mydir/            # -r recursive: search all files in directory
grep -rn "pattern" mydir/           # recursive with line numbers
grep -rh "pattern" mydir/           # -h hide file path in output
grep -l "pattern" mydir/            # -l show only filenames that have a match
grep -L "pattern" mydir/            # -L show only filenames that DON'T have a match
grep -E "chips|salsa" file.txt      # -E extended regex: use | for OR
```

---

### `wc` — Word Count
```bash
wc file.txt                         # shows lines, words, and characters
wc -l file.txt                      # lines only
wc -w file.txt                      # words only
wc -c file.txt                      # characters (bytes) only
```

---

### `sort` — Sort Lines of Text
```bash
sort file.txt                       # sort alphabetically ascending
sort -r file.txt                    # -r reverse order (descending)
sort -u file.txt                    # -u unique: remove duplicate lines
sort -f file.txt                    # -f fold: treat upper and lowercase as equal
sort -uf file.txt                   # unique + case-insensitive
sort -k2 file.txt                   # -k sort by field/column 2
sort -nk2 file.txt                  # -n numeric sort by column 2
sort file.txt > sorted.txt          # redirect sorted output to a new file
```

---

### `uniq` — Filter Consecutive Duplicate Lines
Must sort first if duplicates aren't already adjacent.
```bash
sort file.txt | uniq                # sort then filter duplicates
sort file.txt | uniq -d             # -d show only duplicate lines
sort file.txt | uniq -D             # -D show all instances of duplicated lines
sort file.txt | uniq -Di            # case-insensitive duplicate detection
sort file.txt | uniq -c             # -c count how many times each line appears
```

---

## Text Processing

---

### `tr` — Translate or Delete Characters
Does not accept a filename directly — use `<` or pipe.
```bash
tr 'a' '@' < file.txt               # replace every 'a' with '@'
cat file.txt | tr 'a' '@'           # same via pipe
tr 'a-z' 'A-Z' < file.txt           # make all letters uppercase (range)
tr '[:lower:]' '[:upper:]' < file.txt  # same using character classes
tr '\n' ' ' < file.txt              # replace newlines with spaces (entire file on one line)
tr ',' '\t' < file.csv > file.tsv   # convert CSV to TSV (commas to tabs)
tr -d '[:digit:]' < file.txt        # -d delete: remove all digits
tr -dc '[:digit:]' < file.txt       # -dc delete complement: keep only digits, remove everything else
tr -s '[:digit:]' < file.txt        # -s squeeze: collapse repeated digits into one
```

---

### `sed` — Stream Editor
Processes and edits a stream of text line by line. Does not modify the source file.
```bash
sed 's/old/new/' file.txt           # substitute first occurrence of 'old' with 'new' per line
sed 's/old/new/g' file.txt          # /g global: replace ALL occurrences on each line
sed 's/old/new/2' file.txt          # replace only the 2nd occurrence per line
sed 's/old/new/gp' file.txt         # global replace + print substituted lines again
sed -n 's/old/new/p' file.txt       # -n suppress default output, print only changed lines
sed 's/^c/  c/' file.txt            # indent all lines starting with c by 2 spaces
sed 's/[aeiou]/*/g' file.txt        # replace all vowels with *
sed 's/[aeiou]//g' file.txt         # remove all vowels
sed 's/corn/{&}/' file.txt          # & inserts the matched text into replacement
sed -E 's/(little) (lamb)/\2 \1/' file.txt  # -E extended regex with capture groups (\1 \2)
sed -n '1p' file.txt                # print only line 1
sed -n '3p' file.txt                # print only line 3
sed -n '$p' file.txt                # print only the last line
sed -n '2,$p' file.txt              # print from line 2 to end
sed -n '5,9p' file.txt              # print lines 5 through 9
sed -n '/^c/p' file.txt             # print lines matching a regex
sed -n '/^r/,/^c/p' file.txt        # print from a line starting with r to a line starting with c
sed '11q' file.txt                  # quit after line 11 (like head -11)
sed -e 's/a/@/' -e 's/^c/  c/' file.txt  # -e run multiple edits in one command
sed -f sed_commands.txt file.txt    # -f read sed commands from a file
```

---

### `cut` — Extract Columns or Fields
```bash
cut -c 2-10 file.txt                  # extract characters 2 through 10
cut -c 2-10,14-20 file.txt            # two character ranges (no spaces between)
cut -c 48- file.txt                   # from column 48 to end of line
cut -c 2-10,48- --output-delimiter=", " file.txt  # custom separator between extracted ranges

cut -f 2,3 file.tsv                   # extract fields 2 and 3 (default delimiter = tab)
cut -f 2-4 file.tsv                   # fields 2 through 4
cut -f -3 file.tsv                    # from beginning to field 3
cut -f 3- file.tsv                    # from field 3 to end
cut -f 2,3 -d "," file.csv            # -d specify delimiter (comma for CSV)
cut -f 1,6 -d ":" /etc/passwd         # extract username and home dir from passwd file
```

---

### `awk` — Field Processing and Pattern Scripting
A full programming language for processing structured text line by line.
```bash
awk '{print $1}' file.txt             # print field 1 of every line
awk '{print $2, $3}' file.txt         # print fields 2 and 3 with a space between
awk '{print $0}' file.txt             # $0 = the entire line
awk -F "\t" '{print $2}' file.tsv     # -F specify field separator (tab here)
awk '{print NF}' file.txt             # NF = number of fields on each line
awk '{print NR, $0}' file.txt         # NR = record (line) number
awk '$NF' file.txt                    # print the last field on each line
awk '$(NF-1)' file.txt                # print second-to-last field
awk 'NF == 10 {print $0}' file.txt    # only print lines that have exactly 10 fields
awk 'NR == 2 {print $0}' file.txt     # only print line 2
awk 'NR > 1 {print $0}' file.txt      # skip first line (e.g. skip header)
awk '$1 == "Mary" {print $0}' file.txt          # lines where field 1 equals Mary
awk '$1 ~ /ary/ {print $0}' file.txt            # ~ tilde: field 1 matches regex /ary/
awk '{if(tolower($0) ~ /apple/) print $0}' file.txt  # case-insensitive search using tolower
awk '/^c/' file.txt                             # lines starting with c (like grep)
```

---

## Miscellaneous

---

### `clear` — Clear the Terminal Screen
```bash
clear
# or use the keyboard shortcut:
Ctrl + L
```

---

### `sudo` — Run a Command as Root
```bash
sudo command                  # run a single command with root privileges
sudo -i                       # switch to root user session
sudo -k                       # revoke your sudo privileges immediately
sudo !!                       # re-run the last command with sudo prepended
```

---

### `which` — Find the Path of a Command
```bash
which passwd                  # shows the full path of the passwd executable
```

---

### `updatedb` — Update the locate Database
```bash
sudo updatedb
```

---

### Chaining Commands on One Line
```bash
command1 ; command2           # run command2 after command1 regardless of success
command1 && command2          # run command2 only if command1 succeeded
command1 | command2           # pipe: send output of command1 as input to command2
```
