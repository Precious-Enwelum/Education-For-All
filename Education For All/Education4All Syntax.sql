select * from donation_data;
select * from donor_data;

-- How much is the total donation
select cast(sum(donation) as money) as Total_Donation
from donation_data;

-- What is the total donation by gender
select gender, cast(sum(donation) as money) as donation_by_gender
from donation_data
group by gender
order by sum(donation) desc;

-- Show the total donations and number of donations by gender
select gender, cast(sum(donation) as money) as donation_by_gender, count(donation) as no_of_donations
from donation_data
group by gender
order by sum(donation) desc;

-- Total donation made by frequency of donation
select d.id, email, dd.donation_frequency, cast(sum(d.donation) as money) as total_donation
from donation_data as d
join donor_data as dd
on d.id = dd.id
group by dd.donation_frequency, d.id, email
order by sum(d.donation) desc;

-- Total donation and number of donation by job field
select * from donation_data;

select job_field, cast(sum(donation) as money) as total_donation, count(donation) as no_of_donations
from donation_data
group by job_field
order by count(donation) desc;

-- Total donation and number of donation above 200 dollars
select cast(sum(donation) as money) as total_donation, count(donation) as no_of_donations
from donation_data
where donation >200;

-- Total donation and number of donations below 200 dollars
select cast(sum(donation) as money) as total_donation, count(donation) as no_of_donations
from donation_data
where donation <200;

-- Which top 10 states contributes the highest donations
select * from donation_data;

select state, cast(sum(donation) as money) as top_10_donations
from donation_data
group by state
order by sum(donation) desc
limit 20;

-- Which top 10 states contributes the least donations
select state, cast(sum(donation) as money) as least_10_donations
from donation_data
group by state
order by sum(donation)
limit 10;

-- What are the top 10 cars driven by the highest donors
select * from donor_data;

select dd.car, cast(sum(d.donation) as money) as top_10
from donation_data as d
join donor_data as dd
on d.id = dd.id
group by dd.car
order by sum(d.donation) desc
limit 10;

-- Brain storming
select gender, job_field, state, cast(sum(donation) as money) as donation_by_gender, count(donation) as no_of_donations
from donation_data
group by gender, job_field, state
order by sum(donation) desc
limit 20;

-- Brain storming
select state, job_field, cast(sum(donation) as money) as top_10_donations
from donation_data
group by state, job_field
order by state asc;

-- Brain storming
select job_field, state, cast(sum(donation) as money) as total_donation, count(donation) as no_of_donations
from donation_data
group by job_field, state
order by sum(donation) desc;

-- Brain Storming

select job_field, cast(sum(donation) as money) as total_donation, count(donation) as no_of_donations
from donation_data
group by job_field
order by sum(donation) desc;