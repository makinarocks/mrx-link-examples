FROM ghcr.io/makinarocks/mrx-link:0.10.5-python3.9

USER root

RUN python3 -m pip install \
    "catboost>=1.0" \
    "matplotlib>=2.0" \
    "numpy>=1.19" \
    "pandas>=1.1" \
    "pytorch_lightning>=1.6,<1.9" \
    "scikit-learn>=0.22.2" \
    "seaborn>=0.11" \
    "torch>=1.9" \
    "torchmetrics>=0.7.0,<0.11.1" \
    livelossplot && \
    rm -fr "$(python3 -m pip cache dir)"

COPY Link_Intro.ipynb "${HOME}/workspace/Link_Intro.ipynb"
COPY sample-notebooks/*.ipynb "${HOME}/workspace/sample-notebooks/"
RUN chown -R "${NB_UID}:${NB_GID}" "${HOME}/workspace" && \
    fix-permissions "${HOME}/workspace"

USER ${NB_USER}

WORKDIR "${HOME}/workspace"

EXPOSE 8888
