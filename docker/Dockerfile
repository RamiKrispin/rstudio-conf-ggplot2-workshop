# Pulling Rocker image with RStudio and R version 4.2
FROM rocker/rstudio:4.2

# Disabling the authentication step
ENV USER="rstudio"
CMD ["/usr/lib/rstudio-server/bin/rserver", "--server-daemonize", "0", "--auth-none", "1"]

# Install jq to parse json files
RUN apt-get update && apt-get install -y --no-install-recommends \
    jq \
    libxml2-dev \
    libpng-dev \
    libmagick++-dev \
    libprotobuf-dev \
    libjq-dev \
    libudunits2-dev \
    libgdal-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    && rm -rf /var/lib/apt/lists/*

# Installing Quarto
RUN mkdir packages
COPY install_quarto.sh packages/
RUN bash packages/install_quarto.sh

# installing R packages
COPY install_packages.R packages/
COPY packages.json packages/
RUN Rscript packages/install_packages.R

EXPOSE 8787