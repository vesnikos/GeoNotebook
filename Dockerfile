from jupyter/scipy-notebook

LABEL AUTHOR_EMAIL="vesnikos@gmail.com" 

USER root

# some packages are already installed by jupyter/scipy-notebook
#https://github.com/jupyter/docker-stacks/blob/master/scipy-notebook/Dockerfile

RUN conda install --quiet --yes -c conda-forge \
    openpyxl \
    rasterio \
    fiona \
    fuzzywuzzy \
    geopandas \
    pyarrow \
    gdal && \
    conda remove --quiet --yes --force qt pyqt && \
    conda clean -tipsy


RUN sudo sh -c "ln -s /home/jovyan/work /work"

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

# Configure container startup
ENTRYPOINT ["tini", "--"]
CMD ["start-notebook.sh"]
