FROM ghcr.io/makinarocks/mrx-link:0.10.5-python3.9

USER root

COPY sample-notebooks/*.ipynb "${HOME}/workspace/sample-notebooks/"
RUN chown -R "${NB_UID}:${NB_GID}" "${HOME}/workspace" && \
    fix-permissions "${HOME}/workspace"

USER ${NB_USER}

WORKDIR "${HOME}/workspace"

EXPOSE 8888
