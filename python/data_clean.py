"""
信贷违约风险分析项目
脚本：data_clean.py
功能：对原始信贷数据集执行业务规则清洗，输出干净csv
"""

import pandas as pd 

# 读取原始数据
df_raw = pd.read_csv("../data/credit_risk_dataset.csv")

# 查看原始数据行数，便于清洗前后进行对比
print("原始数据行数：", df_raw.shape[0])

# 复制副本，避免原始数据损坏
df_clean = df_raw.copy()

# 过滤年龄异常值（18<业务年龄<80）
df_clean = df_clean[(df_clean["person_age"] >= 18) & (df_clean["person_age"] <= 80)]
print("剔除年龄异常后行数：", df_clean.shape[0])

# 处理贷款者收入缺失值，数值字段采用中位数填充，避免受极端值干扰
df_clean["person_income"] = df_clean["person_income"].fillna(df_clean["person_income"].median())

# 处理贷款者工作年限缺失值，分类字段采用"unknown"填充
df_clean["person_emp_length"] = df_clean["person_emp_length"].fillna("unknown")

# 处理贷款利率缺失值，按照贷款等级进行分组，以每组中位数进行填充
df_clean["loan_int_rate"] = df_clean.groupby("loan_grade")["loan_int_rate"].transform(lambda x: x.fillna(x.median()))

# 校验清洗后的缺失值
print("\n===== 清洗后各字段缺失值统计 =====")
print(df_clean.isnull().sum())

# 输出清洗结果
df_clean.to_csv("../data/credit_risk_clean.csv", index=False, encoding="utf-8-sig")

print("\n数据清洗完成！")
print("清洗后最终行数：", df_clean.shape[0])
print("清洗完成的文件存放路径：data/credit_risk_clean.csv")
