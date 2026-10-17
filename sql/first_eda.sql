/*贷款风险违约分析项目
脚本：第一轮EDA探查
数据库：MySQL
数据表：credit_risk
*/

-- 1.查看总样本量
select count(*) as total_sample
from credit_risk;

-- 2.统计各字段缺失值
select
  sum(case when person_age is null then 1 else 0 end) as age_missing,
  sum(case when person_income is null then 1 else 0 end) as income_missing,
  sum(case when person_home_ownership is null then 1 else 0 end) as home_ownership_missing,
  sum(case when person_emp_length is null then 1 else 0 end) as emp_length_missing,
  sum(case when loan_intent is null then 1 else 0 end) as loan_intent_missing,
  sum(case when loan_grade is null then 1 else 0 end) as loan_grade_missing,
  sum(case when loan_amnt is null then 1 else 0 end) as loan_amnt_missing,
  sum(case when loan_int_rate is null then 1 else 0 end) as int_rate_missing,
  sum(case when loan_status is null then 1 else 0 end) as loan_status_missing,
  sum(case when loan_percent_income is null then 1 else 0 end) as percent_income_missing,
  sum(case when cb_person_default_on_file is null then 1 else 0 end) as default_hist_missing,
  sum(case when cb_person_cred_hist_length is null then 1 else 0 end) as cred_hist_missing
from credit_risk;

-- 3.识别年龄异常值（业务年龄18-80岁）
select
  min(person_age) as min_age,
  max(person_age) as max_age,
  sum(case when person_age < 18 or person_age > 80 then 1 else 0 end) as abnormal_age_cnt
from credit_risk;

-- 4.统计整体违约率（loan_status = 1 为违约）
select
  count(*) as total_cnt,
  sum(loan_status) as default_cnt,
  round(sum(loan_status)/count(*)*100, 2) as default_rate_pct
from credit_risk;

--- 5.统计住房所有权分布情况
select person_home_ownership, 
       count(*) as cnt
from credit_risk
group by person_home_ownership
order by cnt desc;

-- 6.统计贷款等级分布情况
select loan_grade,  
       count(*) as cnt
from credit_risk
group by loan_grade
order by loan_grade;

-- 7.统计贷款用途分布情况
select loan_intent, 
       count(*) as cnt
from credit_risk
group by loan_intent
order by cnt desc;

-- 8.统计历史违约记录分布情况
select cb_person_default_on_file, 
       count(*) as cnt
from credit_risk
group by cb_person_default_on_file
order by cnt desc;















