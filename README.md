UPS Service
===================

Service for UPS.

create db locally
=================
1   Run following commands to login psql command line:  
1.1 Run `vagrant ssh`  
1.2 Run `sudo su - postgres`  
1.3 Run `psql`  
2   Inside command line(skip this if you never did before, go to 4 directly):  
2.1 Run `create database documentlines owner postgres;`  
2.2 Run `grant all privileges on database documentlines to postgres;`  
3   rename database:  
3.1 Run `ALTER DATABASE documentlines RENAME TO selfbilledinvoicelines;`  

4   Inside command line:  
2.1 Run `create database selfbilledinvoicelines owner postgres;`  
2.2 Run `grant all privileges on database selfbilledinvoicelines to postgres;`  

run this module
==================  
1   Run `mvn clean jetty:run`  

Tips
====
1 java8  
2 rest api path:  
localhost:8890/tradeshift-proforma/rest/external/proforma/
