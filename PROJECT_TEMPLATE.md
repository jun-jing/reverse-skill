# 🐍 Python项目标准模板架构

## 📋 模板概述

这是我的Python项目标准化模板，包含虚拟环境管理、依赖安装、项目启动的完整工作流。所有项目都基于这个框架开发。

## 📁 核心文件架构

### 🔧 环境管理脚本

| 文件名 | 功能 | 使用场景 |
|--------|------|----------|
| `Python-OneKey.bat` | 创建Conda虚拟环境 | 项目初始化，首次使用 |
| `Python-Install-ENV.bat` | 激活环境并安装依赖包 | 安装/更新项目依赖 |
| `Python-ProjectVenvScripts.bat` | 激活环境并运行主程序 | 日常启动项目 |
| `Python-DeleteEnv.bat` | 删除虚拟环境 | 环境重置/清理 |

### 📄 配置文件

| 文件名 | 功能 | 内容 |
|--------|------|------|
| `Python-Requirements.txt` | 项目依赖包清单 | pip install所需的所有包及版本 |
| `Python-README.md` | 项目说明文档 | 使用说明、功能介绍、注意事项 |
| `Python-Project.py` | 主程序文件 | 项目核心代码入口 |
| `Python-Debug.py` | 调试脚本 | 开发调试用代码 |

### 🗂️ 可选配置

| 文件名 | 功能 |
|--------|------|
| `Python-OneKey-mac.sh` | Mac版创建环境脚本 |
| `Python-Install-ENV-mac.sh` | Mac版安装脚本 |
| `Python-ProjectVenvScripts-mac.sh` | Mac版运行脚本 |
| `Python-DeleteEnv-mac.sh` | Mac版删除环境脚本 |
| `Python-Excel-Template.xlsx` | Excel模板文件 |

## 🚀 标准工作流程

### 首次使用项目
```bash
1. Python-OneKey.bat          # 创建虚拟环境 py310-venv_YYYYMMDD_HHMMSS
2. Python-Install-ENV.bat     # 安装依赖包
3. Python-ProjectVenvScripts.bat  # 运行项目
```

### 日常使用
```bash
Python-ProjectVenvScripts.bat  # 直接启动运行
```

### 环境维护
```bash
Python-Install-ENV.bat        # 更新依赖包
Python-DeleteEnv.bat          # 重置环境（谨慎使用）
```

## 🏗️ 环境命名规范

**格式**: `py310-venv_项目时间戳`
**示例**: `py310-venv_20240405_140626`

- `py310`: Python版本标识
- `venv`: 虚拟环境标识  
- `YYYYMMDD_HHMMSS`: 创建时间戳

## 📦 依赖管理

### Python-Requirements.txt结构
```txt
# 项目基础依赖
package_name==version

# 特定功能依赖  
# 功能说明
additional_package==version
```

### 安装源配置
默认使用清华大学镜像源：
```bash
pip install -r Python-Requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
```

## 🔄 脚本工作原理

### Python-OneKey.bat
```batch
@echo off
REM 创建Conda虚拟环境
call conda create -n py310-venv_YYYYMMDD_HHMMSS python=3.10
call conda list
PAUSE
```

### Python-Install-ENV.bat  
```batch
@echo off
REM 激活环境并安装依赖
call conda activate py310-venv_YYYYMMDD_HHMMSS
pip install -r Python-Requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
call conda list
call conda deactivate
PAUSE
```

### Python-ProjectVenvScripts.bat
```batch
@echo off
REM 激活环境并运行项目
call conda activate py310-venv_YYYYMMDD_HHMMSS
python Python-Project.py
call conda deactivate
PAUSE
```

## 📋 项目开发规范

### 1. 新项目基于模板开发
- 复制整套模板文件
- 修改环境名称时间戳
- 更新Python-Requirements.txt
- 编写具体业务代码

### 2. 代码组织结构
```
ProjectRoot/
├── Python-*.bat           # 环境管理脚本
├── Python-*.py            # 核心代码文件
├── Python-Requirements.txt # 依赖清单
├── Python-README.md       # 项目文档
├── config.ini             # 配置文件(可选)
├── [业务目录]/             # 具体业务代码
├── templates/             # 模板文件(Web项目)
├── static/               # 静态资源(Web项目)  
├── data/                 # 数据文件
└── logs/                 # 日志文件
```

### 3. 开发最佳实践
- ✅ 始终在虚拟环境中开发
- ✅ 及时更新requirements.txt
- ✅ 保持代码和脚本的一致性
- ✅ 项目文档及时更新
- ✅ 使用统一的命名规范

## 🎯 使用场景示例

### Web应用项目
- 主程序：Flask/Django应用
- 依赖：web框架、数据库、模板引擎
- 启动：通过ProjectVenvScripts启动Web服务器

### 数据分析项目  
- 主程序：数据处理脚本
- 依赖：pandas、numpy、matplotlib
- 启动：运行数据分析流程

### AI/机器学习项目
- 主程序：模型训练/推理代码
- 依赖：tensorflow、pytorch、scikit-learn
- 启动：执行训练或推理任务

### 自动化脚本项目
- 主程序：自动化任务脚本
- 依赖：selenium、requests、schedule
- 启动：执行自动化流程

## ⚙️ 配置文件规范

### config.ini模板
```ini
[APP_CONFIG]
DEBUG = True
SECRET_KEY = your_secret_key

[DATABASE]  
DB_HOST = localhost
DB_PORT = 3306
DB_NAME = your_database

[API_KEYS]
API_KEY = your_api_key
```

## 🔍 故障排除

### 常见问题
1. **环境激活失败**: 检查Conda是否安装，环境名是否正确
2. **依赖安装失败**: 检查网络连接，尝试不同镜像源
3. **脚本执行错误**: 检查路径、权限、Python版本

### 调试方法
1. 使用`Python-Debug.py`进行代码调试
2. 检查`conda list`确认环境状态
3. 查看错误日志定位问题

## 📝 开发者注意事项

### 与AI助手协作
- 提供这个模板文档让AI理解项目架构  
- AI会基于现有脚本进行扩展开发
- 保持模板的一致性和标准化

### 版本控制
- .gitignore包含虚拟环境目录
- 只提交代码和配置，不提交环境文件
- requirements.txt纳入版本控制

### 部署准备
- 生产环境可能需要调整Python版本
- requirements.txt版本号可能需要适配
- 配置文件敏感信息需要环境变量化

---

**版本**: v1.0  
**更新时间**: 2025-09-04  
**适用场景**: 所有Python项目开发

🎯 **使用说明**: 新项目时@此文档，AI会基于这个模板架构进行开发，确保项目结构一致性和开发效率。