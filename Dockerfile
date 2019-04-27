from jupyter/scipy-notebook

LABEL AUTHOR_EMAIL="vesnikos@gmail.com" 

USER root

RUN conda install --quiet --yes -c conda-forge \
    openpyxl \
    rasterio \
    fiona \
    pandas \
    numpy \
    fuzzywuzzy \
    geopandas \
    pyarrow \
    gdal && \
    conda clean -tipsy


RUN sudo sh -c "ln -s /home/jovyan/ /work"

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

# Configure container startup
ENTRYPOINT ["tini", "--"]
CMD ["start-notebook.sh"]
