# Kestra Helm Charts

<p align="center">
  <img width="460" src="https://github.com/kestra-io/kestra/raw/master/ui/src/assets/logo.svg?sanitize=true"  alt="Kestra workflow orchestrator" />
</p>


## Installing

### Using Helm repository

* Add the kestra-io helm charts repo
  ```
  helm repo add kestra https://helm.kestra.io
  ```
* Install it
  ```
  helm install my-release kestra-io/kestra
  ```

### Using master branch

* Clone the git repo
  ```
  git clone git@github.com:kestra-io/helm-charts.git
  ```
* Install it
  ```
  helm install my-release ./helm-charts/kestra
  ```
  
## License
Apache 2.0 © [Nigh Tech](https://nigh.tech)
