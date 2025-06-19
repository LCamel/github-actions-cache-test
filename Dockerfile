FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

USER vscode
COPY --chown=vscode:vscode . /workspaces/github-actions-cache-test
WORKDIR                      /workspaces/github-actions-cache-test
RUN --mount=type=bind,from=home-vscode-stack,source=/,target=/home/vscode/.stack,rw \
    bash -x build.sh
