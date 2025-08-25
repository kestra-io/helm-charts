<p align="center">
  <a href="https://www.kestra.io">
    <img src="https://kestra.io/banner.png"  alt="Kestra workflow orchestrator" />
  </a>
</p>

<h1 align="center" style="border-bottom: none">
    Event-Driven Declarative Orchestrator
</h1>

<br />

<p align="center">
    <a href="https://twitter.com/kestra_io"><img height="25" src="https://kestra.io/twitter.svg" alt="twitter" /></a> &nbsp;
    <a href="https://www.linkedin.com/company/kestra/"><img height="25" src="https://kestra.io/linkedin.svg" alt="linkedin" /></a> &nbsp;
<a href="https://www.youtube.com/@kestra-io"><img height="25" src="https://kestra.io/youtube.svg" alt="youtube" /></a> &nbsp;
</p>

<br />
<p align="center">
    <a href="https://go.kestra.io/video/product-overview" target="_blank">
        <img src="https://kestra.io/startvideo.png" alt="Get started in 4 minutes with Kestra" width="640px" />
    </a>
</p>
<p align="center" style="color:grey;"><i>Get started with Kestra in 4 minutes.</i></p>

# kestra-operator

![Version: 0.24.1](https://img.shields.io/badge/Version-0.24.1-informational?style=flat-square) ![AppVersion: v0.24.1](https://img.shields.io/badge/AppVersion-v0.24.1-informational?style=flat-square)

Infinitely scalable, event-driven, language-agnostic orchestration and scheduling platform to manage millions of workflows declaratively in code.

**Homepage:** <https://kestra.io>

## Installing the Chart

To install the chart with the release name `my-kestra-operator`:

```console
$ helm repo add kestra https://helm.kestra.io/
$ helm install my-kestra-operator kestra/kestra-operator --version 0.24.1
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| image.pullPolicy | string | `"IfNotPresent"` | This sets the pull policy for images. |
| image.repository | string | `"registry.kestra.io/docker/kestra-operator"` |  |
| image.tag | string | `"v0.1.2"` | Overrides the image tag whose default is the chart appVersion. |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` | For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| podLabels | object | `{}` | For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/ |
| podSecurityContext | object | `{}` |  |
| resources | object | `{"limits":{"memory":"512Mi"},"requests":{"cpu":"250m","memory":"256Mi"}}` | Resource requests and limits for the container |
| securityContext | object | `{}` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| tolerations | list | `[]` |  |

## Documentation
* Full documentation can be found under [kestra.io/docs](https://kestra.io/docs)
* Deployment on Kubernetes documentation can be found [here](https://kestra.io/docs/installation/kubernetes)

## License
Apache 2.0 © [Kestra Technologies](https://kestra.io)

## Stay up to date

We release new versions every month. Give the [main repository](https://github.com/kestra-io/kestra) a star to stay up to date with the latest releases and get notified about future updates.

![Star the repo](https://kestra.io/star.gif)
