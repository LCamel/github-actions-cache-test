FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

COPY --chown=vscode:vscode . /workspaces/github-actions-cache-test
WORKDIR                      /workspaces/github-actions-cache-test
RUN mkdir -p /home/vscode/work
RUN --mount=type=cache,uid=1000,gid=1000,target=/home/vscode/work \
    bash -x build.sh
