-  Whenever you open the terminal you are by default in : `/home/dhananjay`

-  Which you can see by typing `pwd` (print working directory) command in the terminal : 
```
dhananjay@Lenovo-G570:~$ pwd
/home/dhananjay
```

-  The directory `/home/dhananjay` is denoted by the symbol : `~` 

-  The text shown between your machine name and dollar sign is your current directory . Example : 
```
dhananjay@Lenovo-G570:~$ cd shift
dhananjay@Lenovo-G570:~/shift$ cd study
dhananjay@Lenovo-G570:~/shift/study$ pwd
/home/dhananjay/shift/study
dhananjay@Lenovo-G570:~/shift/study$ 
```

   Since ,`/home/dhananjay` = `~` , hence both , the path in prompt ie. `dhananjay@Lenovo-G570:`**`~/shift/study`**`$` and the `pwd` output are same .

---

-  If you want to go to the main directory , from where we came , ie. `~` , you could just write `cd` and press enter .

```
dhananjay@Lenovo-G570:~/shift/study$ cd
dhananjay@Lenovo-G570:~$ 
```

or you could write : `cd ~`

```
dhananjay@Lenovo-G570:~/shift/study$ cd ~
dhananjay@Lenovo-G570:~$ 
```

---

-  If you want to go to the root directory , you can go by :

  ```
dhananjay@Lenovo-G570:~$ cd /
dhananjay@Lenovo-G570:/$ 
  ```

From root directory you can go anywhere , even when you are in another directory . and from `~` this directory you can go to any other directory within `~` .



