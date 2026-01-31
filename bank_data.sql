use excel;
select * from bank_data;
select count(*) from bank_data;
#1 Total Funded Amount
select concat("$",round(sum(fundedamount)/1000000,2),"M") as Total_funded_Amount from bank_data;

#2 Total Loans
select concat(round(count(clientid)/1000,2),"K") as Total_loans from bank_data;

#3 Total Collection
select concat("$",round(sum(totalpymnt)/1000000,2),"M") as Total_collection 
from bank_data;

#4 Total Interest
select concat("$",round(sum(totalrrecint)/1000000,2),"M") as Total_interest from bank_data;

#5 Branch wise performance
select branchname, concat("$",round(sum(totalpymnt)/1000000,2),"M") as Total_payment 
from bank_data group by branchname;

#6 State wise Loan
select statename, concat("$",round(sum(loanamount)/1000000,2),"M") as Total_loan 
from bank_data where statename is not null group by statename;

#7 Religion wise Loan
select religion, concat("$",round(sum(loanamount)/1000000,2),"M") as Total_loan 
from bank_data where religion is not null group by religion;

#8 Product Group wise Loan
select purposecategory, concat("$",round(sum(loanamount)/1000000,2),"M") as Total_loan 
from bank_data where purposecategory is not null group by purposecategory;

#9 Disbursement Trend
select disbursementdate, concat("$",round(sum(loanamount)/1000000,2),"M") as Total_loan 
from bank_data  group by disbursementdate;

#10 Grade wise Loan
select grrade , concat("$",round(sum(loanamount)/1000000,2),"M") as Total_loan
 from bank_data where grrade is not null 
 group by grrade order by grrade;

#11 Default loan count
select count(loanamount) as Default_loan_count 
from bank_data where isdefaultloan = "Y";

#12 Delinquent client count
select count(clientid) as Delinquent_client_count 
from bank_data where isdelinquentloan = "Y";

#13 Delinquent Loan rate
select 
       concat(round((sum(case when isdelinquentloan = "Y" then 1 else 0 end)/count(clientid))*100,2),"%")
       as Delinquent_loan_rate from bank_data;
       
       
#14 Default loan rate
select 
       concat(round((sum(case when isdefaultloan = "Y" then 1 else 0 end)/count(clientid))*100,2),"%")
       as Default_loan_rate from bank_data;


#15 Loan status wise loan
select loanstatus, concat("$",round(sum(loanamount)/1000000,2),"M") as Total_loan
 from bank_data 
 where loanstatus is not null group by loanstatus;

#16 Age Group wise loan
select age, concat(round(count(accountid)/1000,2),"K") as loan
 from bank_data where age is not null group by age;

#17 Loan Maturity
select term, concat("$",round(sum(loanamount)/1000000,2),"M") as Loan_maturity
 from bank_data 
 where term is not null
 group by term;


#18 NO Verified Loans
select concat(round(count(verificationstatus)/1000,0),"K") as Not_verified_loans 
from bank_data 
where verificationstatus = "not verified" ;

















