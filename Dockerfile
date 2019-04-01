from jupyter/scipy-notebook

LABEL AUTHOR_EMAIL="vesnikos@gmail.com" 

RUN conda install --quiet --yes -c conda-forge \
    openpyxl \
    rasterio \
    fiona \
    pandas \
    numpy \
    fuzzywuzzy \
    geopandas \
    gdal && \
    conda clean -tipsy


RUN sudo ln -s /home/jovyan/work /work

# Configure container startup
ENTRYPOINT ["tini", "--"]
CMD ["start-notebook.sh"]
