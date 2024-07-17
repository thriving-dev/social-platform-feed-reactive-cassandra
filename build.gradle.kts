import org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_21

plugins {
    kotlin("jvm") version "2.0.0"
    kotlin("plugin.allopen") version "2.0.0"
    kotlin("kapt") version "2.0.0"
    id("io.quarkus")
}

repositories {
    mavenCentral()
    mavenLocal()
}

val quarkusPlatformGroupId: String by project
val quarkusPlatformArtifactId: String by project
val quarkusPlatformVersion: String by project

dependencies {
//    annotationProcessor("com.datastax.oss:java-driver-mapper-processor:4.17.0")
    kapt("com.datastax.oss.quarkus:cassandra-quarkus-mapper-processor:1.2.0")

    implementation(enforcedPlatform("$quarkusPlatformGroupId:$quarkusPlatformArtifactId:$quarkusPlatformVersion"))
    implementation(enforcedPlatform("$quarkusPlatformGroupId:quarkus-cassandra-bom:$quarkusPlatformVersion"))
    implementation("io.quarkus:quarkus-mutiny")
    implementation("io.quarkus:quarkus-kotlin")
    implementation("io.quarkus:quarkus-arc")
    implementation("io.quarkus:quarkus-resteasy-reactive")
//    implementation("io.quarkus:quarkus-resteasy-reactive-kotlin-serialization")
    implementation("io.quarkus:quarkus-resteasy-reactive-jackson")
    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")

    // ScyllaDB shard aware fork of the java driver
    implementation("com.scylladb:java-driver-core:4.18.0.1")

    implementation("io.smallrye.reactive:mutiny-kotlin:2.1.0")

    implementation("com.datastax.oss.quarkus:cassandra-quarkus-client:1.2.0")
    implementation("com.datastax.oss:java-driver-mapper-runtime:4.17.0")

    testImplementation("io.quarkus:quarkus-junit5")
    testImplementation("io.rest-assured:rest-assured")
}

group = "dev.thriving.poc"
version = "0.0.1"

java {
    sourceCompatibility = JavaVersion.VERSION_21
    targetCompatibility = JavaVersion.VERSION_21
    toolchain {
        languageVersion = JavaLanguageVersion.of(21)
        vendor = JvmVendorSpec.GRAAL_VM
    }
}

tasks.compileJava {
    dependsOn(tasks.compileKotlin)
}

tasks.withType<Test> {
    systemProperty("java.util.logging.manager", "org.jboss.logmanager.LogManager")
}
allOpen {
    annotation("jakarta.ws.rs.Path")
    annotation("jakarta.enterprise.context.ApplicationScoped")
    annotation("jakarta.persistence.Entity")
    annotation("io.quarkus.test.junit.QuarkusTest")
}

kotlin {
    compilerOptions {
        jvmTarget = JVM_21
        javaParameters = true
    }
}
