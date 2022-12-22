FROM openjdk:8
COPY . /src/java
WORKDIR /src/java
RUN ["javac", "helloworld.java"]
ENTRYPOINT ["java", "helloworld"]
