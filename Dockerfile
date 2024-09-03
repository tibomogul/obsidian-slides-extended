FROM tibomogul/rbenv_nvm:user-node

ARG USER_NAME=node

SHELL ["/bin/bash", "-l", "-c"]

RUN mkdir -p /home/${USER_NAME}/.ssh/
RUN ssh-keyscan github.com >> /home/${USER_NAME}/.ssh/known_hosts
RUN chmod 644 /home/${USER_NAME}/.ssh/known_hosts
RUN echo "Host github.com\n\tStrictHostKeyChecking no\n" >> /home/${USER_NAME}/.ssh/config
RUN chmod 600 /home/${USER_NAME}/.ssh/config

# Install application utility packages
RUN source "/home/${USER_NAME}/.nvm/nvm.sh" \
  && npm install -g pnpm

# Install application-specific packages
COPY --chown=${USER_NAME}:${USER_NAME} package.json pnpm-lock.yaml ./
RUN --mount=type=ssh,mode=0666 \
  source "/home/${USER_NAME}/.nvm/nvm.sh" \
  && pnpm install

# Copy application code
COPY --chown=${USER_NAME}:${USER_NAME}  . .
