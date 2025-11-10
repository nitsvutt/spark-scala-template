FROM gradle:8.14.3-jdk17 AS builder

WORKDIR /src

COPY ./gradlew ./settings.gradle ./app/build.gradle ./
COPY ./gradle ./gradle/

RUN ./gradlew build --no-daemon || return 0

COPY . .
RUN ./gradlew --no-daemon shadowJar

FROM spark:3.5.0

COPY --from=builder /src/build/libs/spark-scala-template.jar /app/jobs