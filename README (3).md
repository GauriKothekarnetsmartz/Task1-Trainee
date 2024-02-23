
# LOG MONITORING AND ANALYIS SYSTEM USING BASH SCRIPTING

the system is designed in such a way that it contains different scripts which are designed for different purposes .

# Hi, I'm Gauri! 👋


## 🚀 About Me
I'm a Junior Devops Trainee Engineer


## 🛠 Skill

bash scripting 
## 🔗 Links
github link 
https://github.com/GauriKothekarnetsmartz

project link
https://github.com/GauriKothekarnetsmartz/Task1-Trainee.git


## Installation

Download folder Assignemt1Gauri

or

```bash
   create setup
   chmod +x setup.sh
   run setup.sh
  
```
It will create setup in your file .
you can check using 

```bash
   
   run ls
  
```


# working of remote directories


  this file generate remote servers(lets say directory )  and in these directories  automatic log files generate every 5 seconds in every directory and directory number also auto increase.


```bash
   
   run automatic.sh
  
```

to transfer the file from remote directories to log server(let's say central server)

```bash
   
   run copy.sh
  
```
# all the scripts are merged into one dashboard.sh and convert into a utility dashboard

```bash
   
   chmod +x utilityY
   ./utilityY -lg 
  ```
this will generate the logs.


```bash
   ./utilityY -lt
  ```
this will transfer the logs

# configuration at central erver named as 'log server'

the files generated at remote log server let's say (directory_1->log__file1.txt) .

 The file in log server is saved as directory_1_log_file1.txt so as to clearify from where the file has been coming.

 # utilities designed under log server

 1. To monitor live logs using watch 
 ```bash
   
   ./watch.sh
  
```
 
 2. To monitor the scanning of lines in files along with %
 ```bash
   
   ./dash.sh
  
```
 3. To search the error using status code 
 ```bash
   
   ./error_search.sh
  
```
 4. To search the error using timestamp range
 ```bash
   
   ./time_search.sh
  
```
 5. To search the logs of certain days ago
 ```bash
   
   ./daysago.sh
  
```

 # all the scripts are merged into one dashboard.sh and convert into a utility dashboard

 #steps  to run the utility

```bash
   
   ./dashboard
  
```
# it will list down the flag
1. --------"-w: Watch the dashboard"----------
2.--------"-es: error search"--------
3.--------"-d: Get logs from a certain number of days ago"--------
4.--------"-es: Search for specific errors"--------
5.---------"-per: Analyze percentage of lines of code"-------


    
## Support

For support, email gauri.kothekar@netsmartz.com .

