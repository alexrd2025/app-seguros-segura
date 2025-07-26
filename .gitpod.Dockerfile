FROM gitpod/workspace-full

USER gitpod

# Instalar Flutter
RUN mkdir -p ~/development && \
    cd ~/development && \
    git clone https://github.com/flutter/flutter.git -b stable

ENV PATH="$HOME/development/flutter/bin:$PATH"
