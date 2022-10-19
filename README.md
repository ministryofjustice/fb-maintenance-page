# MoJ Forms Maintenance Page

## Overview
This directory contains the manifest files needed to deploy namespace level maintenance page to the MoJ Forms services namespaces.

This directory also contains the maintenance page HTML file, along with a DockerFile to compile an image.

## Deploying the page

The deployment will create pods starting with `fb-maintenance-page-*` and a service named `fb-maintenance-page-svc`.

## Redirecting traffic

Once deployed traffic must be redirected to it.

This can be achieved by changing the `service.name` field in your current ingress to point to `fb-maintenance-page-svc`.
This can either be done by redeploying the ingress or doing an in-place edit of the ingress.

## Custom HTML

The HTML provided by default is a basic MoJ-branded page.
If you wish to customize it, you will need to:
  - Clone this repo
  - Update the `index.html`
  - ```docker build . -t 754256621582.dkr.ecr.eu-west-2.amazonaws.com/cloud-platform/maintenance:0.2.0-MY-APP-NAME ```
  - ```docker push 754256621582.dkr.ecr.eu-west-2.amazonaws.com/cloud-platform/maintenance:0.2.0-MY-APP-NAME ```
  - Update the image tag used in the deployment file.
