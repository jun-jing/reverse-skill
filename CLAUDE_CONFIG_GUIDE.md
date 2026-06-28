# 📋 Claude Code 配置使用指南

## 🎯 概述

`.claude` 目录是 Claude Code 的工作环境配置，提供了完整的AI辅助开发工具链，包括规范化开发流程、专业bug修复工作流、多角色AI代理协作等功能。

## 📂 目录结构

```
.claude/
├── 📄 settings.local.json     # Claude权限控制配置
├── 🤖 agents/                 # AI专业代理 (4个)
├── ⚡ commands/               # 工作流命令 (10个)
├── 📋 templates/              # 文档模板 (9个)
├── 🐛 bugs/                   # Bug报告存储目录
├── 📊 specs/                  # 项目规范存储目录
└── 🎯 steering/               # 项目引导配置目录
```

## 🔧 核心配置文件

### 📄 settings.local.json - 权限控制
```json
{
  "permissions": {
    "allow": [
      "WebSearch",           // 允许网络搜索
      "Read(/path/**)",      // 允许读取项目文件
      "Bash(git add:*)",     // 允许Git添加操作
      "Bash(git commit:*)",  // 允许Git提交操作
      "Bash(dir:*)"          // 允许目录查看
    ],
    "deny": [],              // 禁止的操作
    "ask": []                // 需要询问的操作
  }
}
```

**作用**: 定义Claude可以执行的操作范围，相当于AI助手的"权限白名单"

## 🤖 AI专业代理 (agents/)

### 1. spec-task-executor.md
- **角色**: 任务执行专家
- **功能**: 实现规范化任务，专注于干净、可测试的代码
- **使用场景**: 当你有明确的任务规范需要实现时

### 2. spec-task-validator.md  
- **角色**: 任务验证专家
- **功能**: 检查任务分解是否原子化、是否适合AI实现
- **使用场景**: 在开始实施前验证任务合理性

### 3. spec-design-validator.md
- **角色**: 设计验证专家
- **功能**: 验证技术设计的完整性和可行性
- **使用场景**: 技术方案设计完成后的审查

### 4. spec-requirements-validator.md
- **角色**: 需求验证专家  
- **功能**: 验证需求文档的完整性和清晰度
- **使用场景**: 需求分析阶段的质量把关

## ⚡ 工作流命令 (commands/)

### 🐛 Bug修复工作流 (5个命令)

#### 1. `/bug-create <bug-name> [description]`
- **阶段**: Bug报告阶段
- **功能**: 初始化新的bug修复工作流
- **输出**: 创建bug报告文档
- **示例**: `/bug-create login-error "用户登录时出现500错误"`

#### 2. `/bug-analyze <bug-name>`
- **阶段**: Bug分析阶段
- **功能**: 深入调查bug的根本原因
- **输出**: 详细的bug分析报告
- **包含**: 错误堆栈、影响范围、可能原因

#### 3. `/bug-fix <bug-name>`
- **阶段**: Bug修复阶段
- **功能**: 实施具体的修复方案
- **输出**: 修复代码和修改说明
- **特点**: 遵循项目代码规范

#### 4. `/bug-verify <bug-name>`
- **阶段**: Bug验证阶段
- **功能**: 确认bug已被正确修复
- **输出**: 验证测试结果和确认报告

#### 5. `/bug-status [bug-name]`
- **功能**: 查看bug修复进度
- **输出**: 当前阶段、完成状态、下一步行动

### 📊 规范化开发工作流 (5个命令)

#### 1. `/spec-create <project-name>`
- **功能**: 创建新的项目规范
- **输出**: 完整的项目规范文档集
- **包含**: 需求、设计、任务分解、项目结构

#### 2. `/spec-execute <task-id>`
- **功能**: 执行指定的规范任务
- **特点**: 调用专业代理完成具体实现
- **输出**: 符合规范的代码实现

#### 3. `/spec-list [project-name]`
- **功能**: 列出所有任务和进度
- **输出**: 任务清单、状态、优先级

#### 4. `/spec-status [project-name]`  
- **功能**: 查看项目整体状态
- **输出**: 完成进度、下一步计划、风险提示

#### 5. `/spec-steering-setup`
- **功能**: 设置项目引导配置
- **作用**: 为AI提供项目上下文和开发约束

## 📋 文档模板 (templates/)

### 🐛 Bug相关模板 (3个)

#### 1. bug-report-template.md
```markdown
# Bug报告模板
- Bug ID: [自动生成]
- 发现时间: [时间戳]
- 严重级别: [Critical/High/Medium/Low]
- 复现步骤: [详细步骤]
- 预期结果: [应该发生什么]
- 实际结果: [实际发生了什么]
- 环境信息: [系统、浏览器、版本等]
```

#### 2. bug-analysis-template.md
```markdown
# Bug分析模板
- 根因分析: [技术层面的原因]
- 影响范围: [哪些功能受影响]
- 修复方案: [解决思路]
- 风险评估: [修复可能带来的风险]
```

#### 3. bug-verification-template.md
```markdown
# Bug验证模板
- 验证方法: [如何测试修复结果]
- 测试用例: [具体的测试场景]
- 回归测试: [确保没有引入新问题]
- 验证结果: [Pass/Fail及说明]
```

### 📊 项目规范模板 (6个)

#### 1. requirements-template.md
- **用途**: 需求文档标准格式
- **包含**: 功能需求、非功能需求、约束条件

#### 2. design-template.md  
- **用途**: 技术设计文档格式
- **包含**: 架构设计、数据模型、接口设计

#### 3. tech-template.md
- **用途**: 技术规范文档格式  
- **包含**: 技术栈、编码规范、部署要求

#### 4. tasks-template.md
- **用途**: 任务分解清单格式
- **包含**: 任务列表、优先级、依赖关系

#### 5. structure-template.md
- **用途**: 项目结构说明格式
- **包含**: 目录结构、文件职责、模块划分

#### 6. product-template.md
- **用途**: 产品文档格式
- **包含**: 产品概述、用户故事、功能特性

## 🚀 使用场景和最佳实践

### 🎯 场景1：新项目开发
```bash
1. /spec-create my-new-project        # 创建项目规范
2. /spec-steering-setup               # 设置开发约束  
3. /spec-list                         # 查看任务清单
4. /spec-execute task-001             # 执行具体任务
5. /spec-status                       # 检查项目进度
```

### 🐛 场景2：Bug修复工作流
```bash
1. /bug-create payment-failure        # 创建bug报告
2. /bug-analyze payment-failure       # 深入分析原因
3. /bug-fix payment-failure           # 实施修复方案
4. /bug-verify payment-failure        # 验证修复结果
5. /bug-status                        # 查看所有bug状态
```

### 📊 场景3：代码质量保证
```bash
# 在实施前进行多重验证
1. 需求验证: spec-requirements-validator
2. 设计验证: spec-design-validator  
3. 任务验证: spec-task-validator
4. 代码实现: spec-task-executor
```

## 💡 进阶使用技巧

### 1. 自定义权限
编辑 `settings.local.json` 来调整Claude的操作权限：
- 添加新的允许操作到 `allow` 数组
- 添加需要确认的操作到 `ask` 数组
- 添加禁止操作到 `deny` 数组

### 2. 工作流集成
将Claude工作流与现有开发流程结合：
- Bug修复 → 自动创建GitHub Issue
- 规范任务 → 对应Git分支和PR
- 文档模板 → 团队协作标准

### 3. 模板定制
根据项目特点修改模板文件：
- 调整bug报告字段
- 添加项目特定的设计要求
- 自定义任务分解粒度

## 🔄 与Git工作流集成

结合之前的Git工作流程：
```bash
# 完整开发流程示例
1. /spec-create feature-user-auth     # 创建功能规范
2. /spec-execute auth-001             # 实现用户模型  
3. git add . && git commit            # 提交用户模型
4. /spec-execute auth-002             # 实现认证逻辑
5. git add . && git commit            # 提交认证逻辑
6. /bug-create auth-session-bug       # 发现会话问题
7. /bug-fix auth-session-bug          # 修复会话问题
8. git add . && git commit            # 提交bug修复
```

## 📈 效果和价值

使用Claude配置后你将获得：

1. **标准化开发流程** - 每个项目都有规范的文档结构
2. **AI代理协作** - 不同专业角色负责不同环节，提升质量
3. **可追溯的工作记录** - 从需求到实现的完整链路记录
4. **模板化文档** - 减少重复工作，保持一致性
5. **智能质量把关** - AI自动验证需求、设计、任务合理性

---

## 🚀 快速开始

### 第一次使用：
```bash
1. 确认 .claude 目录已正确配置
2. 尝试执行: /spec-create hello-world
3. 查看生成的规范文档
4. 按照提示执行后续命令
```

### 日常开发：
```bash
# 新功能开发
/spec-create [功能名] → /spec-execute [任务ID]

# Bug修复  
/bug-create [bug名] → /bug-analyze → /bug-fix → /bug-verify

# 状态查看
/spec-status 或 /bug-status
```

---
*这个配置系统将显著提升你的AI辅助开发效率和代码质量！* 🎯