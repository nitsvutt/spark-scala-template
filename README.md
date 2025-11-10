# Spark Scala Template

![license](https://img.shields.io/github/license/nitsvutt/spark-scala-template)
![stars](https://img.shields.io/github/stars/nitsvutt/spark-scala-template)
![forks](https://img.shields.io/github/forks/nitsvutt/spark-scala-template)

## Table of Contents
1. [Set up development environment](#setup-dev-env)
1. [Develop a Spark Application](#dev-a-spark-app)

<div id="setup-dev-env"/>

## 1. Set up development environment

## 1.1. Clone installation projects

- Clone lakehouse-platforms and k8s-in-action projects:
```
mkdir $PROJECT_PATH/lakehouse-platform
git clone https://github.com/nitsvutt/lakehouse-platform.git $PROJECT_PATH/lakehouse-platform
```
```
mkdir $PROJECT_PATH/kubernetes-in-action
git clone https://github.com/nitsvutt/kubernetes-in-action.git $PROJECT_PATH/kubernetes-in-action
```

### 1.2. Set up K8s

See [Kubernetes in Action](https://github.com/nitsvutt/kubernetes-in-action#set-up-dev-env) for more info.

### 1.3. Set up Spark on K8s

See [Kubernetes in Action](https://github.com/nitsvutt/kubernetes-in-action#spark-on-k8s) for more info.

### 1.4. Set up ScyllaDB

- Run `docker compose`:
```
docker compose -f $PROJECT_PATH/lakehouse-platform/scylladb/docker-compose.yml up -d
```

<div id="dev-a-spark-app"/>

## 2. Develop a Spark Application

<!-- - Check for version of Gradle:
```
brew search gradle
``` -->

- Install Gradle:
```
brew install gradle
```

- Init Gradle project (Java: 17, Structure: Single application project):
```
gradle init \
    --type scala-application \
    --dsl groovy \
    --package spark.scala.template \
    --project-name spark-scala-template
```

- Update `settings.gradle`, `app/build.gradle` as needed.

- Pin gradle wrapper version to 8.1.1 (to match with shadow version):
```
./gradlew wrapper --gradle-version 8.1.1
```

- Build docker image for Spark Submit operation:
```
docker build -t nitsvutt/spark-scala-template:0.1.0 .
```

<!-- - Check for jar file: -->
<!-- ```
docker run --rm -it nitsvutt/spark-scala-template:0.1.0 bash
``` -->

- Submit spark job:
```
kubectl apply -f $PROJECT_PATH/spark-scala-template/spark-submit.yaml
```