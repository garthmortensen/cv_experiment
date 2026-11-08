---
pagetitle: Garth Mortensen — CV
---

# Garth Mortensen

\(612) 212-9519 \| Minneapolis, MN

<mortensengarth@hotmail.com>

[GitHub](https://www.github.com/garthmortensen) \| [LinkedIn](https://www.linkedin.com/in/mortensengarth)

## Data Science Engineer

Full stack production-grade data scientist with strong software engineering background. Love for creative destruction: building pipelines, reducing complexity, and designing clean, maintainable architectures. Let's talk.

## Example Proof of Concepts

### [Prism](https://github.com/garthmortensen/prism)

**Prism is a modernized Risk Adjustment platform** which replaces opaque "black box" legacy tools with a transparent, code-first architecture. It treats Risk Adjustment as a software engineering problem, ensuring usability, accuracy, auditability, and rapid scenario planning. Analysts parametrize model parameters, and guard-railed **AI agents interpret** and process downstream results. #ai #python #health

### [SpilloverLab.com](https://www.spilloverlab.com)

Time series analysis platform which allows users to experiment with financial market spillover modeling. Delivers simple-English interpretations, dashboards, [REST](https://api.spilloverlab.com/redoc) and [GraphQL](https://api.spilloverlab.com/v1/graphql/) APIs for advanced users. Constructed with microservices, deployed on cloud with CI/CD [auto-documentation](https://timeseries-compute.readthedocs.io/en/latest/), [tested](https://app.codecov.io/gh/garthmortensen/timeseries-api) and [unit testing](https://app.codacy.com/gh/garthmortensen/timeseries-api/dashboard). #python #cloud #devops #finance

## Professional Experience

### Federal Reserve Bank of Minneapolis

**Sr. Production Data Scientist, National Stress Testing Program.** *Minneapolis, MN - 06/2022 -- Present*

- **AI enablement:** Led grassroots adoption of AI, taking it from a bare AWS Bedrock instance to a governed, measured, team-wide capability before formal leadership sponsorship. #ai #aws #leadership
- **AI:** Delivered the Stress Testing program's first RAG (Retrieval-Augmented Generation) system for documentation retrieval, and prototyped agentic workflows to automate execution, information retrieval, model configuration and decision support. #ai
- **AI:** Connected Claude to AWS Bedrock end to end: API calls, web proxy, and netsec constraints. #ai #aws #infra
- **Human in the loop:** Every AI workflow keeps a person in control. Analysts review and approve AI output before it informs analysis or enters the codebase. #ai

::: {.detail summary="Full AI details: infrastructure, security, automation, adoption, R&D"}

- **Infrastructure & platform**
    - Partnered with IT to configure and integrate Claude with the backend, working through netsec constraints. #ai #infra
    - Programmatically discovered available models via Swagger/OpenAPI spec. #ai
    - Built Stress Testing's first RAG system over open source docs. #ai
- **Security and governance**
    - Designed AI guardrails using hook-based controls and policy-as-code (e.g. traversing directories), enforcing least-privilege for agents and requiring human approval for sensitive actions. #ai #devops
    - Encoded team structure and context into version-controlled files. #ai
- **Automation and dev productivity**
    - Built a Makefile-based installer to standardize and log Claude setup. #ai #devops
    - Authored reusable AI skills to handle code review, unit testing, and other data science digital assembly line steps, in a git distributed setup, with a human reviewing each step's output. #ai #devops
- **Adoption and measurement**
    - Onboarded and trained colleagues, establishing a git-based workflow for community-contributed skills improvement. #ai #leadership #teaching
    - Created an adoption telemetry process: monthly collection of usage metrics (sessions launched, skill invocation count) to track adoption and ROI and provide evidence to leadership. #ai #leadership
- **AI-assisted R&D**
    - Built an automated peer-review pipeline that evaluates academic research and deltas it against our champion models in a structured report for human reviewers to evaluate. #ai #finance
- **Code comprehension and knowledge transfer**
    - Developed a RAG-powered code annotation tool that matches code against a corpus of documentation. It inserts the "why" comments with page-level citations, turning undocumented code into self-explaining, traceable code once a developer reviews and accepts the comments. #ai
- **Code-doc alignment**
    - Built a tool which can align code to docs, or downstream docs to code, via API calls to wiki pages and docx, proposing changes for human approval rather than applying them automatically. #ai

:::

**Production data science and infrastructure**

- Hired to productionalize credit risk models; expanded role to assume ownership of infrastructure (Merkal DAG ) orchestration, shared libraries, user config, ETL, and production supporting the stress testing program. #infra #etl #finance
- Productionalized mortgage and credit card risk models and performed ad hoc analyses consumed by the Board of Governors. #ml #finance
- Delivered 6 infrastructure releases across Python, SQL, R, and Bash. #python #sql #r #bash #infra
- Owned orchestration platform responsible for congressionally mandated Dodd-Frank Stress Testing workflows, ensuring reliable execution of complex data pipelines. #infra #etl #finance

::: {.detail summary="Team support and collaboration"}

- Served 120+ quantitative analysts as a technical resource for Python, databases, Linux, and Git. #python #sql #leadership
- Acted as Production's liaison and implementation partner to frontend, database, systems, and DevOps teams. #devops #leadership
- Mentored analysts into contributing to the production codebase, improving team capability and knowledge sharing. #leadership #teaching

:::

### University of Minnesota Coding Bootcamp

**Fintech Instructor. [Student Review](https://www.coursereport.com/schools/university-of-minnesota-boot-camps?shared_review=42025#reviews).** *Saint Paul, MN - 09/2021 -- 04/2023*

- Across 270+ lecture hours, scored 90% across all rating categories (engagement, clarity, knowledge). #teaching

::: {.detail summary="Teaching details"}

- Taught programming to professionals ranging from sysadmins to finance directors. #teaching #python
- Guided students in coding up ML models, blockchain implementations, Solidity smart contracts. #teaching #ml #finance

:::

### Medica

**Sr. Risk Adjustment Analyst.** *Minnetonka, MN - 11/2019 -- 06/2022*

- Implemented ML models to predict member health scores. #ml #health
- In zero-sum marketplace, consistently outperformed leading health insurance companies, boosting revenue. #health
- High-impact contributions recognized with a 12% discretionary merit increase.

::: {.detail summary="More at Medica"}

- Independently discovered how to tie-out government reporting database with data warehouse. #sql #health
- Configured bare-metal server to run automated OCR process to ETL `.pdf` into database, as ML model input. #etl #infra #ml

:::

### United Health Group R&D

**Developer/Data Scientist, contract.** *Minneapolis, MN - 01/2019 -- 11/2019*

- Replicated academic research on internal data to uncover actionable insights presented to the CEO. #health
- Built end-to-end data pipelines: API ingestion, transformation, validation, and visualization. #etl #python

::: {.detail summary="More at UHG"}

- Contributed to the design and development of a next-gen big data platform for health research. #infra #health

:::

### Munich Reinsurance

**Sr. Data Analyst.** *Minneapolis, MN - 05/2017 -- 12/2018*

- Transformed and ingested unstructured claims data into a structured 7M+ record star-schema database. #etl #sql
- Analyzed the resulting dataset to surface insights, including reports for top diagnoses by cost and prevalence, and ML models to predict claims. #ml #health

::: {.detail summary="More at Munich Re"}

- Built and deployed custom tools with clean, user-friendly UI frontends. #web

:::

### Earlier career

- **Decyphed**, Entrepreneurial NLP Dev. *Paris, France - 05/2015 -- 01/2016* #nlp
- **Saylor Consulting**, Industry Cost Consultant, contract. *San Francisco, CA - 12/2013 -- 07/2014* #finance
- **GE Capital REIM**, Investor Relations. *Paris, France - 07/2012 -- 12/2012* #finance
- **Xinhua News Agency**, Financial News. *Beijing, China - 02/2009 -- 07/2011* #leadership
- **Caijing Magazine**, Economic Research Assistant. *Beijing, China - 01/2008 -- 09/2008* #web

::: {.detail summary="Earlier career details"}

#### Decyphed

- Programmed text analysis tools specialized in language learning applications. #nlp

#### Saylor Consulting — Recommendation available

- Analyzed industry factors influencing construction industry costs (material/labor) and forecast prices. #finance
- Overhauled cost benchmarking using early industry indicators, resulting in algorithmic, reproducible cost setting. #finance
- Delivered data-driven market analysis reports and product presentations to Federal client. #finance

#### GE Capital REIM

- Oversaw financial database, competitor and industry developments, financial metrics. #finance #sql
- Interpreted market fundamentals for big-ticket investors seeking to purchase entire real estate fund portfolio. #finance
- All \$25+ billion in assets sold off to Blackstone and other financial institutions. #finance

#### Xinhua News Agency

- Led a 15+ person international team to launch a new economics news show, working 6+ months without PTO to meet a high-stakes deadline. #leadership
- Developed a demand driven airtime allocation algorithm based on API driven topic popularity; the method was later leaked to CNN International and appeared on their daily broadcast lineup.
- The program successfully sold content to major global news networks including CNN and Nikkei.

#### Caijing Magazine

- Published 15+ print stories, commodity reports, and analyses. #finance
- Administered and redesigned website. Introduced self made podcasts, video stories, user comments, and other Web 2 technologies, doubling online readership. #web
- Managed the internship program, allocated work based on strengths and interests. #leadership

#### College, high school jobs — Minneapolis, Minnesota, 1/2001 -- 12/2007

- College: Owner of brick-and-mortar studio providing website design, SEO and graphic design services. #web
- High school: Employee of small business providing graphic design, SEO and offsite hosting/storage services. #web

:::

## Formal Education

- **St. Thomas University**, St. Paul, USA. 2023 — Double MSc in Software Engineering and Data Science; Double MSc Certifications in AI and Big Data; GPA 3.9
- **EDHEC Business School**, Nice, France. 2012 — MSc Finance
- **Hamline University**, St. Paul, USA. 2007 — BA Economics

## Skills

**Tech**: Python/R, git, databases (sql/nosql), ETL, linux (shell, RHEL), HPCs, permissions, APIs, cloud (AWS/Google), devops CI/CD, containers, integration, productionalization

**[Certifications](https://github.com/garthmortensen/certifications)**: MS Software Development, MS Databases, MS IT Networking, MS IT Security, MS HTML/CSS, AWS Cloud Practitioner, Graph SQL, Google Analytics IQ, Excel/VBA, Bloomberg Terminal.

**Languages**: English, French and Mandarin Chinese (diminishing CEFR B2).
