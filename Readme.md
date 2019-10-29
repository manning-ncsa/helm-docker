Run Helm in Docker
=====================

The instructions below build a Docker image of [Helm v2.15.1](https://github.com/helm/helm/releases/tag/v2.15.1) and demonstrate how to run the `helm template` command to generate a Kubernetes YAML configuration file from a Helm Chart.

Clone this repo to `helm-docker` and switch to that working directory.
```
cd helm-docker
```
Build the Docker image by starting with Alpine and installing a downloaded Helm release (see `Dockerfile`):
```
docker build -t helm:v2.15.1 .
```
Change directory to the parent of the folder containing your Helm Chart definition files (e.g. `my-chart`). Then run the following, where your working directory is bind-mounted to the container's `/apps` working directory.
```
docker run --rm -v $(pwd):/apps helm:v2.15.1 template my-chart
```
You can output the results to a file `config.yaml` by redirection:
```
docker run --rm -v $(pwd):/apps helm:v2.15.1 template my-chart > config.yaml
```
