/*
项目：贷款违约风险分析
脚本：clean_data_analysis.sql
说明：基于Pandas清洗后的干净数据集 credit_risk_clean
目标：通过单变量描述性分析和多维度交叉分析，计算不同客户群体违约率，为Tableau可视化准备聚合结果
业务逻辑：loan_status=1代表违约，0代表正常还款
*/

-- 1、观察清洗后的总样本
select
    count(*) as total_customer,
    sum(loan_status) as default_customer,
    round(sum(loan_status) / count(*) * 100, 2) as total_default_rate_pct
from credit_risk_clean;

-- 2、按住房所有权分组，查看各组样本量与违约率
select
    person_home_ownership,
    count(*) as group_count,
    sum(loan_status) as default_count,
    round(sum(loan_status) / count(*) * 100, 2) as default_rate_pct
from credit_risk_clean
group by person_home_ownership
order by default_rate_pct desc;

-- 3、按贷款用途分组，分析不同借钱目的的违约水平
select
    loan_intent,
    count(*) as group_count,
    sum(loan_status) as default_count,
    round(sum(loan_status) / count(*) * 100, 2) as default_rate_pct
from credit_risk_clean
group by loan_intent
order by default_rate_pct desc;

-- 4、贷款信用等级与违约率
select
    loan_grade,
    count(*) as group_count,
    sum(loan_status) as default_count,
    round(sum(loan_status) / count(*) * 100, 2) as default_rate_pct
from credit_risk_clean
group by loan_grade
order by loan_grade;

-- 5、交叉维度：信用等级 + 住房类型 组合风险
select
    loan_grade,
    person_home_ownership,
    count(*) as group_count,
    sum(loan_status) as default_count,
    round(sum(loan_status) / count(*) * 100, 2) as default_rate_pct
from credit_risk_clean
group by loan_grade, person_home_ownership
order by default_rate_pct desc;

-- 6、交叉维度：信用等级 + 贷款用途
select
    loan_grade,
    loan_intent,
    count(*) as group_count,
    sum(loan_status) as default_count,
    round(sum(loan_status) / count(*) * 100, 2) as default_rate_pct
from credit_risk_clean
group by loan_grade, loan_intent
order by default_rate_pct desc;

-- 7、交叉维度：住房所有权 + 贷款收入占比分组
select
    person_home_ownership,
    case
        when loan_percent_income < 0.1 then 'low'
        when loan_percent_income < 0.3 then 'mid'
        else 'high'
    end as debt_level,
    count(*) as group_count,
    sum(loan_status) as default_count,
    round(sum(loan_status) / count(*) * 100, 2) as default_rate_pct
from credit_risk_clean
group by person_home_ownership, debt_level
order by default_rate_pct desc;

-- 8、交叉维度：申请人工作年限分组 + 贷款等级
select
    case
        when person_emp_length < 2 then 'short'
        when person_emp_length < 10 then 'mid'
        else 'long'
    end as emp_length_group,
    loan_grade,
    count(*) as group_count,
    sum(loan_status) as default_count,
    round(sum(loan_status) / count(*) * 100, 2) as default_rate_pct
from credit_risk_clean
group by emp_length_group, loan_grade
order by default_rate_pct desc;
