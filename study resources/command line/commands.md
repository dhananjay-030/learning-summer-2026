-  Space in file/directories names can not just simply be represented by space in terminal . 
  It will perceive them as a command and return `command not found` error .
  
  so we represent spaces in name , by giving a forward slash then space .
  
  Example : `Telegram Desktop` in command line will be written as `Telegram\ Desktop`

  Example : 
```bash
dhananjay@Lenovo-G570:~$ cd shift
dhananjay@Lenovo-G570:~/shift$ cd dev\ and\ files
dhananjay@Lenovo-G570:~/shift/dev and files$ cd ypt\ clone
dhananjay@Lenovo-G570:~/shift/dev and files/ypt clone$ cd full\ prompt
dhananjay@Lenovo-G570:~/shift/dev and files/ypt clone/full prompt$
```



-  There is a second method to do so , by writing the name of the directory as it is but in quotation mark (can be any, single or double quotation mark but single quotation mark is prefered )
  
  Example :
  
  ```
  dhananjay@Lenovo-G570:~/shift/dev and files/ypt clone/full prompt$ cd
dhananjay@Lenovo-G570:~$ cd shift/
dhananjay@Lenovo-G570:~/shift$ cd 'dev and files'
dhananjay@Lenovo-G570:~/shift/dev and files$ cd 'ypt clone'
dhananjay@Lenovo-G570:~/shift/dev and files/ypt clone$ cd 'full prompt'
dhananjay@Lenovo-G570:~/shift/dev and files/ypt clone/full prompt$ 

  ```

# **AUTO COMPLETE FEATURE WORKS FOR BOTH THE METHOD** 

----

