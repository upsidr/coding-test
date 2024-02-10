group = "com.upsidr.ctjsb.invoices"
version = "0.0.1-SNAPSHOT"

buildscript {
    dependencies {
        classpath("org.flywaydb:flyway-mysql:10.7.2")
    }
}

plugins {
    java
    id("io.spring.dependency-management") version "1.1.4"
    id("org.flywaydb.flyway") version "10.7.2"
    id("org.springframework.boot") version "3.2.2"
}

java {
    sourceCompatibility = JavaVersion.VERSION_17
}

repositories {
    mavenCentral()
}

dependencies {
    implementation("mysql:mysql-connector-java:8.0.33")
    implementation("org.springframework.boot:spring-boot-starter-data-jpa")
    implementation("org.springframework.boot:spring-boot-starter-jdbc")
    implementation("org.springframework.boot:spring-boot-starter-web")
    developmentOnly("org.springframework.boot:spring-boot-devtools")
    developmentOnly("com.google.googlejavaformat:google-java-format:1.7")
    testImplementation("org.springframework.boot:spring-boot-starter-test")
}

tasks.withType<Test> {
    useJUnitPlatform()
}

flyway {
    cleanDisabled = false
    url = "jdbc:mysql://127.0.0.1:13306/upsidr-coding-test"
    user = "upsidr"
    password = "P1z5G0eloynOrqWy"
    locations = arrayOf(
        "filesystem:src/main/resources/db/migration/sql",
        "filesystem:src/main/resources/db/migration/seed",
    )
}
