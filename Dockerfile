FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

USER vscode
COPY --chown=vscode:vscode . /workspaces/github-actions-cache-test
WORKDIR                      /workspaces/github-actions-cache-test

# 創建 work 目錄
RUN mkdir -p /home/vscode/work

# 使用 cache mount 並添加詳細的調試資訊
RUN --mount=type=cache,uid=1000,gid=1000,target=/home/vscode/work \
    echo "=== Cache mount 開始 ===" && \
    echo "Build time: $(date)" && \
    echo "Cache 目錄權限:" && \
    ls -la /home/vscode/work && \
    echo "Cache 目錄檔案數量: $(ls -1 /home/vscode/work 2>/dev/null | wc -l)" && \
    bash -x build.sh && \
    echo "=== 執行完畢後的 Cache 狀態 ===" && \
    ls -la /home/vscode/work && \
    echo "最終檔案數量: $(ls -1 /home/vscode/work | wc -l)"
