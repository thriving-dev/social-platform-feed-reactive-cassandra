# social-platform-feed-reactive-cassandra

This project uses Quarkus, the Supersonic Subatomic Java Framework.

If you want to learn more about Quarkus, please visit its website: https://quarkus.io/ .

## Features
- Jaeger & OpenTelemetry
  - https://quarkus.io/extensions/io.quarkus/quarkus-opentelemetry/ 
  - https://quarkus.io/guides/opentelemetry 

## TODOs / ideas
- document steps to run 
  - docker-compose
    - scylladb (default)
      - `docker compose up -d`
      - `docker compose down`
    - cassandra
      - `docker compose -f docker-compose.cassandra.yml up -d`
      - `docker compose -f docker-compose.cassandra.yml down`
  - CQL
    - ./cql/schema.cql
    - ./cql/data-samples.cql
    - ./cql/queries.cql
  - app
    - `./gradlew quarkusDev`
    - `./dev_otel.sh`
  - curl example REST API
    - `curl -X GET 'http://localhost:8080/feeds/01HPWG2T821KXLA7TECS8W74W6/posts?pageSize=20&ltPostId=01HZMN4H77QBW1W8PS6W04ZH9V' | jq`
- instructions to Jaeger + collector via docker-compose
  - http://localhost:16686/search?limit=200&lookback=24h&service=social-platform-feed-poc
  - `./run_otel.sh`
- Metrics / Grafana Dashboard?
- Simplify further?

## Created with
```bash
quarkus create app dev.thriving.poc:social-platform-feed-reactive-cassandra:0.0.1 \
  --kotlin --gradle-kotlin-dsl \
  --package-name=dev.thriving.poc.social.platform.feed.backend \
  --extension='kotlin,com.datastax.oss.quarkus:cassandra-quarkus-client,io.quarkus:quarkus-mutiny,io.quarkus:quarkus-resteasy-reactive-kotlin-serialization'
```

## Running the application in dev mode

You can run your application in dev mode that enables live coding using:
```shell script
./gradlew quarkusDev
```

> **_NOTE:_**  Quarkus now ships with a Dev UI, which is available in dev mode only at http://localhost:8080/q/dev/.

## Packaging and running the application

The application can be packaged using:
```shell script
./gradlew build
```
It produces the `quarkus-run.jar` file in the `build/quarkus-app/` directory.
Be aware that it’s not an _über-jar_ as the dependencies are copied into the `build/quarkus-app/lib/` directory.

The application is now runnable using `java -jar build/quarkus-app/quarkus-run.jar`.

If you want to build an _über-jar_, execute the following command:
```shell script
./gradlew build -Dquarkus.package.type=uber-jar
```

The application, packaged as an _über-jar_, is now runnable using `java -jar build/*-runner.jar`.

## Creating a native executable

You can create a native executable using: 
```shell script
./gradlew build -Dquarkus.package.type=native
```

Or, if you don't have GraalVM installed, you can run the native executable build in a container using: 
```shell script
./gradlew build -Dquarkus.package.type=native -Dquarkus.native.container-build=true
```

You can then execute your native executable with: `./build/social-platform-feed-reactive-cassandra-0.0.1-runner`

If you want to learn more about building native executables, please consult https://quarkus.io/guides/gradle-tooling.

## Related Guides

- Mutiny ([guide](https://quarkus.io/guides/mutiny-primer)): Write reactive applications with the modern Reactive Programming library Mutiny
- DataStax Apache Cassandra client ([guide](https://quarkus.io/guides/cassandra)): Connect to Apache Cassandra, DataStax Enterprise and DataStax Astra databases
- RESTEasy Classic Mutiny ([guide](https://quarkus.io/guides/resteasy#reactive)): Mutiny support for RESTEasy Classic server
- Kotlin ([guide](https://quarkus.io/guides/kotlin)): Write your services in Kotlin

## Provided Code

### RESTEasy JAX-RS

Easily start your RESTful Web Services

[Related guide section...](https://quarkus.io/guides/getting-started#the-jax-rs-resources)

### RESTEasy Reactive

Easily start your Reactive RESTful Web Services

[Related guide section...](https://quarkus.io/guides/getting-started-reactive#reactive-jax-rs-resources)
