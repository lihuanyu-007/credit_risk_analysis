# 信贷违约风险分析与风险管理决策分析
数据分析求职作品集项目

## 项目目标
- 对整体贷款样本进行初步探查，了解数据的基本分布。
- 比较不同信用等级、贷款用途及住房类型下的违约率差异。
- 通过多维交叉分析，识别出违约风险较高的组合类型。
- 将分析结果可视化展示，形成初步的业务建议，为数据驱动型决策提供数据支持。

## 使用工具
1. MySQL(SQL)：原始数据探查，做初步EDA；探索性数据分析，单特征违约率统计，多变量交叉风险分析。
2. Python（pandas）：原始数据清洗，缺失值，异常值业务处理，输出清洗后的干净数据集。
3. Tableau：制作交互式可视化仪表盘，对分析结果进行可视化展示，支持信贷风控业务决策。

## 项目目录
```
credit_risk_analysis/
├── data/
│   └─ .gitkeep             
├── sql/
│   ├─ first_eda.sql          # 原始数据第一轮探查SQL
│   └─ clean_data_analysis.sql # 清洗后数据集的违约率、交叉分析SQL
├── python/
│   └─ data_clean.py          # Pandas数据清洗代码
├── tableau/
│   └─ .gitkeep               # 后续存放Tableau仪表盘文件
├── README.md
└─ .gitignore
```

## 分析流程
1. 原始数据导入MySQL，第一轮EDA探查：统计样本量、缺失值，识别业务异常值，了解原始数据概况。
2. 导出原始CSV，使用Pandas进行数据清洗：剔除异常样本、处理缺失值，导出清洗后的干净数据集。
3. 将清洗后的干净数据再次导入MySQL，开展业务分析：计算整体违约率，完成单特征、多特征交叉风险分析。
4. 提取SQL统计结果，接入Tableau，搭建可视化仪表盘。
5. 整理分析结论，输出信贷风控业务建议。

## 数据集来源
kaggle credit_risk_dataset
[数据下载地址]（https://www.kaggle.com/datasets/laotse/credit-risk-dataset）
> 需要自行去Kaggle下载数据集，将CSV文件放置到本地`data/`文件夹，才能运行代码。
> 本仓库只存放代码，不存储原始数据文件。

## 项目结论
pass

## 项目亮点
1. 多工具协同分析：MySQL、Pandas、Tableau协同分析，各司其职，还原真实分析师工作流。
2. 基于Kaggle真实开源信贷数据集开展分析，贴近真实业务场景，获得落地的业务分析体验。
3. 区分“数据探查”和“正式分析”两个阶段，分两次入库，避免脏数据干扰分析结论。

## 可视化成果
Tableau交互式仪表盘
[Dashboard地址](https://public.tableau.com/app/profile/huanyu.li5988/viz/credit_risk_tableau）
> 目前已完成核心分析图表及交互式仪表板，主要围绕贷款信用等级、贷款用途、住房类型、贷款收入占比及贷款利率等维度展开分析。

