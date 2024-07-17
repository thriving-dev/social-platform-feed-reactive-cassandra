# social-platform-feed-reactive-cassandra

POC Implementation of a social platform feed backend, with an RESTful API. 

Built with reacting programming using **Kotlin**, **Quarkus** and **Mutiny**, with **ScyllaDB** as the database (Apache Cassandra Protocol). 

Code from this repository was featured on [WeAreDevelopers World Congress 2024](https://www.wearedevelopers.com/world-congress).

You can find more information on: https://thriving.dev/talks/maximising-cassandras-potential-2024

### Tech Stack
- [Kotlin](https://kotlinlang.org/)
- [Quarkus](https://quarkus.io/)
- [SmallRye Mutiny](https://smallrye.io/smallrye-mutiny/latest/) (Reactive Programming)
- [Apache Cassandra](https://cassandra.apache.org/_/index.html) / [ScyllaDB](https://www.scylladb.com/)
- [OpenTelemetry](https://opentelemetry.io/)
  - https://quarkus.io/extensions/io.quarkus/quarkus-opentelemetry/ 
  - https://quarkus.io/guides/opentelemetry 


## Quick Start

### Docker Compose
- Docker Compose Stack with
  - ScyllaDB 6 / Apache Cassandra 5   
    (incl. CQL schema + sampledata auto-loaded)
  - Jaeger & OpenTelemetry
  - https://quarkus.io/extensions/io.quarkus/quarkus-opentelemetry/ 
  - https://quarkus.io/guides/opentelemetry

#### Start/Stop
To start the docker compose stack locally, run
```bash
docker compose up -d
#docker compose -f docker-compose.cassandra.yml up -d
```

To tear down
```bash
docker compose down
#docker compose -f docker-compose.cassandra.yml down
```

#### Open CQLSH (shell)
When the compose stack is running, you can open a CQL shell via
```bash
docker exec -it scylla cqlsh -k poc
#docker exec -it cassandra cqlsh -k poc 
```

You can find the _schema_, _sampledata_ and all _queries_ featured in the talk in the folder [./cql](./cql).

### Running the app

To run the quarkus app in dev mode, simply run
```bash
./gradlew quarkusDev
```

### Accessing the API
The app webserver is listening on port `8080`.

Here are a few sample `curl` to get you started...
```bash
curl -X GET 'http://localhost:8080/feeds/01HPWG2T821KXLA7TECS8W74W6'
curl -X GET 'http://localhost:8080/feeds/01HPWG2T821KXLA7TECS8W74W6/posts?pageSize=20&ltPostId=01HZMN4H77QBW1W8PS6W04ZH9V'
curl -X GET 'http://localhost:8080/feeds/01HPWG2T821KXLA7TECS8W74W6/posts/count'
curl -X GET 'http://localhost:8080/users/01HPWGWY9C0K2YH7PZGC4XSBHZ'
```

#### Run with the OpenTelemetry javaagent
To start the app with the **opentelemetry-javaagent** to push traces to Jaeger a script has been prepared:
```bash
./dev_otel.sh
```

You should be able to access Jaeger under: http://localhost:16686/search?limit=200&lookback=24h&service=social-platform-feed-poc

When the API is being used, traces shoudl start to show up (pushed every ~30s)

## Quarkus Project

### Created with
This project uses Quarkus, the Supersonic Subatomic Java Framework.

If you want to learn more about Quarkus, please visit its website: https://quarkus.io/ .

```bash
quarkus create app dev.thriving.poc:social-platform-feed-reactive-cassandra:0.0.1 \
  --kotlin --gradle-kotlin-dsl \
  --package-name=dev.thriving.poc.social.platform.feed.backend \
  --extension='kotlin,com.datastax.oss.quarkus:cassandra-quarkus-client,io.quarkus:quarkus-mutiny,io.quarkus:quarkus-resteasy-reactive-kotlin-serialization'
```

### Running the application in dev mode

You can run your application in dev mode that enables live coding using:
```shell script
./gradlew quarkusDev
```

> **_NOTE:_**  Quarkus now ships with a Dev UI, which is available in dev mode only at http://localhost:8080/q/dev/.

### Packaging and running the application

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

### Creating a native executable

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

### Related Guides

- Mutiny ([guide](https://quarkus.io/guides/mutiny-primer)): Write reactive applications with the modern Reactive Programming library Mutiny
- DataStax Apache Cassandra client ([guide](https://quarkus.io/guides/cassandra)): Connect to Apache Cassandra, DataStax Enterprise and DataStax Astra databases
- RESTEasy Classic Mutiny ([guide](https://quarkus.io/guides/resteasy#reactive)): Mutiny support for RESTEasy Classic server
- Kotlin ([guide](https://quarkus.io/guides/kotlin)): Write your services in Kotlin

### Provided Code

#### RESTEasy JAX-RS

Easily start your RESTful Web Services

[Related guide section...](https://quarkus.io/guides/getting-started#the-jax-rs-resources)

#### RESTEasy Reactive

Easily start your Reactive RESTful Web Services

[Related guide section...](https://quarkus.io/guides/getting-started-reactive#reactive-jax-rs-resources)
