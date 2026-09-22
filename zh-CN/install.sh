#!/usr/bin/env bash
#
# AI Agent Project Kit — 安装脚本（中文版）
#
# 用法：
#   ./install.sh [目标目录]
#
# 把本目录中的 AGENTS.md 和 .ai/ 记忆模板复制到目标项目根目录（默认：当前目录）。
#
# 脚本不会覆盖已有文件：如果目标文件已存在，将跳过并给出提示。
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${1:-$(pwd)}"

if [[ ! -d "$TARGET_DIR" ]]; then
  echo "错误：目标目录不存在：$TARGET_DIR" >&2
  exit 1
fi

# --- AGENTS.md ---------------------------------------------------------------
if [[ -e "$TARGET_DIR/AGENTS.md" ]]; then
  echo "跳过：$TARGET_DIR/AGENTS.md 已存在（保持不变）"
else
  cp "$SCRIPT_DIR/AGENTS.md" "$TARGET_DIR/AGENTS.md"
  echo "已安装：$TARGET_DIR/AGENTS.md"
fi

# --- .ai/ 记忆模板 -------------------------------------------------------------
if [[ -d "$TARGET_DIR/.ai" ]]; then
  echo "提示：$TARGET_DIR/.ai 已存在，只复制缺失的模板"
else
  mkdir -p "$TARGET_DIR/.ai"
  echo "已创建：$TARGET_DIR/.ai/"
fi

for f in PROJECT.md ARCHITECTURE.md DECISIONS.md TROUBLESHOOTING.md; do
  if [[ -e "$TARGET_DIR/.ai/$f" ]]; then
    echo "跳过：$TARGET_DIR/.ai/$f 已存在（保持不变）"
  else
    cp "$SCRIPT_DIR/.ai/$f" "$TARGET_DIR/.ai/$f"
    echo "已安装：$TARGET_DIR/.ai/$f"
  fi
done

echo
echo "安装完成。AGENTS.md 是 Agent 读取的规则入口。"
echo "请逐步填写 .ai/ 模板，只记录已确认且非显而易见的知识。"
