#!/bin/bash

# =============================================
# Claude Code 启动脚本 (macOS/Linux)
# 对应: danger-minimax-claude-code.bat
# =============================================

# 获取脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 切换到脚本目录
cd "$SCRIPT_DIR"
echo "Current directory: $(pwd)"

# 显示 Node.js 和 npm 版本
echo "=== Node.js and npm Versions ==="
node -v
npm -v

# 配置 MiniMax API 环境变量
export ANTHROPIC_BASE_URL="https://api.minimaxi.com/anthropic"
export ANTHROPIC_AUTH_TOKEN=""
export ANTHROPIC_SMALL_FAST_MODEL="MiniMax-M2.5"
export ANTHROPIC_DEFAULT_SONNET_MODEL="MiniMax-M2.5"
export ANTHROPIC_DEFAULT_OPUS_MODEL="MiniMax-M2.5"
export ANTHROPIC_DEFAULT_HAIKU_MODEL="MiniMax-M2.5"

echo "=== Claude Config ==="
echo "ANTHROPIC_BASE_URL: $ANTHROPIC_BASE_URL"
echo "ANTHROPIC_AUTH_TOKEN: ${ANTHROPIC_AUTH_TOKEN:0:20}..."

# 启动 Claude Code
echo ""
echo "Starting Claude Code..."
claude --dangerously-skip-permissions