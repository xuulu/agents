AI Agent Project Kit

通用 AI Coding Agent 项目规范与持久化项目记忆系统。

这是什么？

这是一个用于 AI 编程 Agent 的通用项目规则模板。

它的目的不是让 AI 写更多代码，而是让 AI 在一个已有项目中更加稳定、可控地工作：

理解需求
  ↓
调查项目
  ↓
确认依赖和版本
  ↓
理解状态与数据流
  ↓
确定最小修改
  ↓
编码
  ↓
验证
  ↓
只保存真正有价值的长期知识

它不绑定任何具体技术栈。

可以用于：

* 前端
* 后端
* 全栈
* API
* CLI
* Web
* Desktop
* Mobile
* Rust
* Go
* Python
* Java
* Node.js
* React
* Vue
* Next.js
* Monorepo

⸻

为什么需要它？

AI Coding Agent 最大的问题通常不是“不会写代码”，而是：

* 没理解需求就开始写
* 凭记忆猜 API
* 不检查依赖版本
* 不看已有实现
* 不理解全局状态
* 不检查调用方
* 为一个小需求大规模重构
* 发现报错后不断试错
* 为了让测试通过而隐藏问题
* 每次犯错都产生一条所谓“记忆”
* 项目运行几个月后，AI 记忆越来越乱

这个项目试图解决的是：

如何让 AI 在已有项目中长期、稳定、低噪音地工作。

⸻

什么时候适合使用？

1. 已有项目持续开发

非常适合：

项目已经运行
+
未来会持续让 AI 修改

例如：

* 已上线 Web 项目
* 长期维护的 API
* SaaS
* 后端服务
* 前端项目
* 开源项目
* 个人长期项目

⸻

2. 多次使用 AI Coding Agent

如果你经常使用：

* Claude Code
* Cursor
* Codex
* Cline
* Roo Code
* Windsurf
* 其他支持 AGENTS.md 或类似项目规则的 Agent

这套规则尤其有价值。

它可以把你对 AI 的长期要求从：

每次聊天重新告诉 AI

变成：

项目级规则

⸻

3. 项目存在复杂状态或架构

例如：

多个服务
多个数据源
全局状态
缓存
数据库
外部 API
权限系统
复杂生命周期

这时“先理解再修改”非常重要。

⸻

4. 经常遇到版本相关问题

例如：

项目使用旧版本依赖
↓
AI 按最新文档写代码
↓
API 不存在
↓
项目报错

规则会要求 Agent：

先检查实际版本
↓
再检查 API
↓
再修改

⸻

5. 希望 AI 记住真正重要的问题

例如某个项目存在一个特殊限制：

当前版本的某依赖不能使用某 API

或者：

某个状态只能由某模块管理

或者：

某 API 必须保持兼容旧客户端

这些信息适合进入 .ai/。

⸻

什么时候不需要？

如果只是：

一次性小脚本
临时 Demo
几十行测试代码
一次性实验

通常没必要建立完整 .ai/ 记忆系统。

直接使用 AI 即可。

⸻

推荐项目结构

your-project/
├── AGENTS.md
├── AGENTS.zh-CN.md
├── README.md
├── README.zh-CN.md
└── .ai/
    ├── PROJECT.md
    ├── ARCHITECTURE.md
    ├── DECISIONS.md
    └── TROUBLESHOOTING.md

实际运行时：

AGENTS.md
    ↓
AI 工作规则
.ai/
    ↓
项目长期知识

不要创建：

src/AGENTS.md
src/components/AGENTS.md
src/api/AGENTS.md

默认只保留根目录一个 Agent 规则文件。

⸻

AGENTS.md 是干什么的？

AGENTS.md 是行为规则。

它告诉 AI：

* 怎么理解需求
* 什么时候调查
* 什么情况下不能猜
* 如何检查依赖
* 如何检查状态
* 如何控制修改范围
* 如何 Debug
* 如何验证
* 什么信息应该记忆
* 什么信息不能记忆

它应该相对稳定。

⸻

.ai/ 是干什么的？

.ai/ 是项目长期记忆。

它不是聊天记录。

它也不是 AI 日志。

它只保存项目未来开发真正可能需要的信息。

PROJECT.md

保存项目事实：

项目用途
技术栈
重要版本
运行环境
部署方式
关键依赖
常用命令
长期约束

ARCHITECTURE.md

保存重要架构：

模块边界
数据流
状态所有权
生命周期
外部服务
持久化
非显而易见的约束

DECISIONS.md

保存重要决策：

为什么采用这个方案
为什么不能随意更换某个依赖
为什么 API 必须保持某种形式
为什么状态必须由某模块管理

TROUBLESHOOTING.md

保存：

问题
↓
根因
↓
已验证解决方案
↓
适用条件

⸻

什么情况下应该写入记忆？

必须同时满足：

已确认
+
未来很可能再次使用
+
当前源码中不明显
+
没有已有记录
+
可以简洁表达

例如：

应该记录

当前使用的某依赖版本不支持 API X。
必须使用 API Y。

不应该记录

今天 npm install 失败。

因为这通常是一次性问题。

⸻

不要把 .ai/ 变成垃圾桶

禁止把以下内容全部塞进去：

每次报错
每次测试失败
每次 AI 尝试
聊天记录
临时环境问题
用户每一句话
显而易见的源码行为

正确目标：

100 次开发
↓
只有少量真正重要的知识被保存

而不是：

100 次开发
↓
几千条 AI 日志

⸻

如何安装？

把：

AGENTS.md
.ai/

放入项目根目录即可。

如果需要中文参考：

AGENTS.zh-CN.md

也可以一起保留。

推荐：

your-project/
├── AGENTS.md
├── AGENTS.zh-CN.md
└── .ai/

其中：

AGENTS.md

作为 Agent 实际读取的标准入口。

⸻

第一次使用

不要立即把所有 .ai/ 文件写满。

先让 AI 调查项目。

例如：

请先阅读项目并初始化 .ai 项目记忆。
只记录已经确认、未来可能影响开发、且源码中不明显的信息。
不要猜测，不要记录临时问题。

AI 应该逐渐形成：

PROJECT.md
ARCHITECTURE.md
DECISIONS.md

而不是一次性生成大量内容。

TROUBLESHOOTING.md 可以等真正出现有长期价值的问题后再填写。

⸻

日常开发

正常让 Agent 工作即可。

例如：

修复登录接口的问题。

Agent 应该：

读取相关项目规则
↓
检查相关代码
↓
检查依赖
↓
检查状态
↓
定位问题
↓
修改
↓
测试
↓
判断是否有长期知识

你不需要每次手动告诉它这些步骤。

⸻

架构修改

如果任务涉及：

* 数据库
* 全局状态
* API
* 核心模块
* 服务边界
* 认证
* 缓存
* 外部服务

Agent 应该先检查：

PROJECT.md
ARCHITECTURE.md
DECISIONS.md

并在修改后根据实际结果更新相关记忆。

⸻

Debug

如果是 Bug：

TROUBLESHOOTING.md

只有在问题满足长期记忆条件时才更新。

不要因为一次普通报错就产生记忆。

⸻

为什么不使用多个 AGENTS.md？

默认不使用：

src/AGENTS.md
components/AGENTS.md
api/AGENTS.md

原因：

* 容易出现规则冲突
* AI 需要判断多个规则
* 长期维护成本增加
* 容易重复
* 项目规模扩大后难以控制

默认：

一个项目
=
一个根目录 AGENTS.md

⸻

为什么记忆单独放 .ai/？

因为：

规则

和：

知识

是两种不同的东西。

AGENTS.md：

AI 应该怎么工作？

.ai/：

这个项目有哪些值得长期记住的事实？

这样可以避免 AGENTS.md 不断膨胀。

⸻

与具体框架无关

不要把这套规则理解成：

Next.js Agent Rules

它实际上是：

General AI Coding Agent Rules

项目可以自行增加技术栈相关规则。

例如 Next.js 项目可以在 PROJECT.md 中记录：

Framework: Next.js
Version: ...

Rust 项目可以记录：

Framework: Axum
Version: ...

Python 项目可以记录：

Runtime: Python
Version: ...

核心 Agent 行为不需要改变。

⸻

最终原则

这套系统最重要的原则只有几个：

先理解
不要猜
先调查
检查版本
理解状态
最小修改
实际验证
只记重要知识

最终希望得到的不是一个“记忆很多”的 AI。

而是一个：

越来越了解这个项目，但不会被垃圾记忆污染的 AI Coding Agent。