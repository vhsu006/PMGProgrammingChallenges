#Question 1
select date, sum(impressions) from marketing_performance group by 1 order by 1;

#Question 2
select state, sum(revenue) from website_revenue group by 1 order by 2 desc limit 3;
#The third best state was Ohio with $37,577 in revenue

#Question 3
select * from 
(select campaign_id, round(sum(cost),2), sum(impressions), sum(clicks) from marketing_performance group by 1) mp join 
(select campaign_id, sum(revenue) from website_revenue group by 1) wr using (campaign_id) join 
(select id, name from campaign_info) cinfo on mp.campaign_id = cinfo.id;

#question 4
select geo, sum(conversions) from marketing_performance join campaign_info on marketing_performance.campaign_id = campaign_info.id where name = "Campaign5" group by 1;
#Georgia generated the most conversions from campaign5

#question 5
select campaign_id, name, round(sum(cost) / sum(conversions),2) from marketing_performance join campaign_info on marketing_performance.campaign_id = campaign_info.id group by 1,2 order by 2;
select campaign_id, name,  count(campaign_id), sum(conversions) / count(campaign_id) from marketing_performance join campaign_info on marketing_performance.campaign_id = campaign_info.id group by 1,2;
# In my opinion campaign4 was the most efficient as it had the lowest cost of conversions as well as the second highest number of conversions for each campaign launched.

#Bonus question
select case 
when day = 1 then "Sunday"
when day = 7 then "Saturday"
when day = 6 then "Friday"
when day = 5 then "Thursday"
when day = 4 then "Wednesday"
when day = 3 then "Tuesday"
else "Monday" end as "weekday", cost
from
(select dayofweek(date) "day", round(sum(cost) / sum(conversions),2) cost from marketing_performance group by 1) mp;
select dayofweek(date), count(dayofweek(date)), sum(conversions)/count(dayofweek(date)) from marketing_performance group by 1;
# The best day to run ads was Wednesday as it had the highest number of conversions as well as the lowest cost for each conversion.

