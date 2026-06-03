1. Open terminal type : `ssh-keygen`
2. Output looks like : 
```
dhananjay@Lenovo-G570:~$ ssh-keygen
Generating public/private ed25519 key pair.
Enter file in which to save the key (/home/dhananjay/.ssh/id_ed25519): 
Created directory '/home/dhananjay/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/dhananjay/.ssh/id_ed25519
Your public key has been saved in /home/dhananjay/.ssh/id_ed25519.pub
The key fingerprint is:
SHA256:5aEbo/w1jp0csUEy/Ph9SSTZxq4xB4n7m34z5Xo83MQ dhananjay@Lenovo-G570
The key's randomart image is:
+--[ED25519 256]--+
|                 |
|       .   . =   |
|        + = = =  |
|         X o *   |
|        S * o +. |
|     . . = * * .E|
|      o . * + +=.|
|       . * + ++o=|
|        o =.+..=.|
+----[SHA256]-----+
```
3. You see path (`/home/dhananjay/.ssh/id_ed25519`) and the directory (`/home/dhananjay/.ssh`) of SSH key.
4. Go to the path and copy the public(.pub) key.
   ```
   dhananjay@Lenovo-G570:~$ cd .ssh
dhananjay@Lenovo-G570:~/.ssh$ ls
id_ed25519  id_ed25519.pub
dhananjay@Lenovo-G570:~/.ssh$ cat id_ed25519.pub 
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICnymKDA/KHX59cCV6wX54rT18jmRctdUeVPkafoluQH dhananjay@Lenovo-G570

   ```
5. Go to github profile , open setting , click on **SSH and GPG keys** option , then **New SSH key** , enter the title and paste the ssh public ssh key in **Key** section . Hit **Add SSH key**.
6. Create a repo or go to a existing repo , click on the **Code** and copy its SSH link .
7. Copy it to a folder on you machine via `git clone` command .
   ```
   dhananjay@Lenovo-G570:~$ cd Documents
dhananjay@Lenovo-G570:~/Documents$ git clone git@github.com:dhananjay-030/testing.git
Cloning into 'testing'...
warning: You appear to have cloned an empty repository.

   ```
8. Now you have cloned the repo into Document folder , change directory, go onto the repo, make files or make changes.
   ```
   dhananjay@Lenovo-G570:~/Documents$ cd testing/
dhananjay@Lenovo-G570:~/Documents/testing$ touch hello.py
dhananjay@Lenovo-G570:~/Documents/testing$ touch hi.py
dhananjay@Lenovo-G570:~/Documents/testing$ nano hello.py 
dhananjay@Lenovo-G570:~/Documents/testing$ vi hi.py

   ```
9. Now do a status check . #noideawhy
```
dhananjay@Lenovo-G570:~/Documents/testing$ git status
On branch main

No commits yet

Untracked files:
	(use "git add <file>..." to include in what will be committed)
	    hello.py
	    hi.py

nothing added to commit but untracked files present (use "git add" to track)

```

10.  It shows we have two untracked files ie. hello.py and hi.py , and we need to use `git add` command to track it . (dont know what track means , i guess it is like saved or pushed files , if it is pushed then it is tracked if not it is untracked) #doubt/unsolved . So we add the files , instead of manually writing every file name we use a full stop to add all files (do all means , only untracked once or it takes tracked files also for pushing ?).
```
dhananjay@Lenovo-G570:~/Documents/testing$ git add .
```

11. All files add for commit . (What is diffrence between commit and push ?) #doubt/unsolved 
12. Now we commit the changes :
```
dhananjay@Lenovo-G570:~/Documents/testing$ git commit -m "pushing through ssh"
Author identity unknown

*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.

fatal: unable to auto-detect email address (got 'dhananjay@Lenovo-G570.(none)')
```
Can superficiously understand  `git commit -m "pushing through ssh" `
but dont know what the `-m` flag stands for . #doubt/unsolved

Since it was may first time i have not setup git so it was asking , email and username .
i entered it : 
```
dhananjay@Lenovo-G570:~/Documents/testing$ git config --global user.email "cutsav591@gmail.com"
dhananjay@Lenovo-G570:~/Documents/testing$ git config --global user.name "dhananjay-030"
```

Then again commit it :
```
dhananjay@Lenovo-G570:~/Documents/testing$ git commit -m "pushing through ssh"
[main (root-commit) 96e63bf] pushing through ssh
 2 files changed, 2 insertions(+)
 create mode 100644 hello.py
 create mode 100644 hi.py
```

13. Now push it  : 
```
dhananjay@Lenovo-G570:~/Documents/testing$ git push -u origin main
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 2 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (4/4), 295 bytes | 14.00 KiB/s, done.
Total 4 (delta 0), reused 0 (delta 0), pack-reused 0
To github.com:dhananjay-030/testing.git
 * [new branch]      main -> main
branch 'main' set up to track 'origin/main'.
```

Command : `git push -u origin <branch you want to push in>'

What doest the `-u` flag shands for ? #doubt/unsolved 

14. Go check the  Github profile and check the updated repo .  Enjoy . 