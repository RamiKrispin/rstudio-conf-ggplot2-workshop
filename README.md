# Docker environment for the Graphic Design with ggplot2 workshop

This repo provides Docker environment for the [Graphic Design with ggplot2](https://www.rstudio.com/conference/2022/workshops/ggplot2-graphic-design/) workshop at [rstudio::conf 2022](https://www.rstudio.com/conference/) by Cédric Scherer.


**Current image:** rkrispin/ggplot2_workshop:dev.0.0.0.9000

## Getting started

The Docker image named as `rkrispin/ggplot2_workshop:dev.0.0.0.9000`, you can pull it with the `docker pull` command:

``` shell
docker pull rkrispin/ggplot2_workshop:dev.0.0.0.9000
```

And run it with:
``` shell
docker run -d -p 8787:8787 rkrispin/ggplot2_workshop:dev.0.0.0.9000 
``` 
To confirm that the docker is running you can use the `docker ps` command. You should expect the following output:

``` shell
docker ps                                                                      
CONTAINER ID   IMAGE                                      COMMAND                  CREATED         STATUS         PORTS                    NAMES
6168ec1ddd95   rkrispin/ggplot2_workshop:dev.0.0.0.9000   "/usr/lib/rstudio-se…"   9 seconds ago   Up 8 seconds   0.0.0.0:8787->8787/tcp   determined_hypatia
```

You can now open RStudio server from your browser by logging to `http://localhost:8787`:

<img src="images/docker run.mov" width="60%" align="center"/></a>


### Using docker-compose

A more robust way to work with RStudio server is to lunch the image with `docker-compose`. This enables to add some customiztion, which can done also from the command line but simpler with `docker-compose`. To load your RStudio local setting and month the docker container to a local folder we will have to set the following envrionment variables:

- `GGPLOT2_WORKSHOP_IMAGE` - the name of the image
- `GGPLOT2_WORKING_WORKING_DIR` - the path of the local folder to MONTH with the docker container
- `RSTUDIO_CONFIG_PATH` - The path for your local RStudio setting to load your setting (color theme, code snippet, etc.)

To lunch RStudio server with docker compose use the `docker-compose` command:

``` shell
docker-compose up -d
```



### Check the environment requirements 
``` R
packages <- c(
  "ggplot2", "readr", "tibble", "tidyr", "forcats", "stringr",
  "lubridate", "here", "systemfonts", "magick", "scales", "grid",
  "grDevices", "colorspace", "viridis", "RColorBrewer", "rcartocolor",
  "scico", "ggsci", "ggthemes", "nord", "MetBrewer", "ggrepel",
  "ggforce", "ggtext", "ggdist", "ggbeeswarm", "gghalves", "patchwork", 
  "palmerpenguins", "rnaturalearth", "sf", "rmapshaper", "devtools",
  "cowplot", "colorblindr")

installed_packages <- rownames(installed.packages())
f <- FALSE
for(i in sort(packages)){
    if(!i %in% installed_packages){
      f <- TRUE
      cat("\033[0;91m",i, "...Fail", "\033[0m\n")
    } else{
      cat("\033[0;92m",i, "...OK", "\033[0m\n")
    }
}
```


# TODO
- Run docker with log
- Debug missing packages
- Fix the mov file
- Update the docker version
- Check spelling
