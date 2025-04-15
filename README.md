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

The HTML provided by default is a basic MoJ Forms branded page. Customise it how you see fit. Raise a PR. Merge it. Cross fingers.

## Enabling and Disabling namespace level maintenance page

It is important to check whether the template used as the basis for the ingress configuration has not changed. It can be found [in the editor](https://github.com/ministryofjustice/fb-editor/blob/main/config/publisher/cloud_platform/ingress.yaml.erb).

To enable or disable the maintance page in a given namespace:

```
./bin/maintenance_mode <action> <namespace>
```

`action` is one of:

- enable
- disable

`namespace` is one of:

- formbuilder-services-test-dev
- formbuilder-services-test-production
- formbuilder-services-live-dev
- formbuilder-services-live-production

## Enabling and Disabling individual service maintenance page

It is important to check whether the template used as the basis for the ingress configuration has not changed. It can be found [in the editor](https://github.com/ministryofjustice/fb-editor/blob/main/config/publisher/cloud_platform/ingress.yaml.erb).

To enable or disable the maintance page in a given namespace:

```
./bin/single_service_maintenance_mode <action> <namespace> <service_ingress>
```

`action` is one of:

- enable
- disable

`namespace` is one of:

- formbuilder-services-test-dev
- formbuilder-services-test-production
- formbuilder-services-live-dev
- formbuilder-services-live-production

`service_ingress` is an exact single match to an ingress in the namespace. 

This script will then enable or disable maintenace mode for just that ingress.
