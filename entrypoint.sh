#!/bin/bash
set -e

#  削除に失敗してもエラーとして扱わず、強行突破する「|| true」
rm -f /app/tmp/pids/server.pid || true
rm -f /tmp/sockets/puma.sock || true

# 最後に、Dockerfile の CMD で指定されたコマンドを実行
exec "$@"