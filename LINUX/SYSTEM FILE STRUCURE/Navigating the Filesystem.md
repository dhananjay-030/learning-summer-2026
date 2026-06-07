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