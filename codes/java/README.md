Compiling multiple sources
--------------------------
# Compile using required source jar files and local java files
$ javac -cp apache-mina-2.0.7/dist/mina-core-2.0.7.jar TimeServerHandler.java MinaTimeServer.java
# Run using required jar files and local class files (remember to -cp .:)
$ java -cp .:apache-mina-2.0.7/dist/mina-core-2.0.7.jar:apache-mina-2.0.7/lib/slf4j-api-1.6.6.jar MinaTimeServer

Maven
-----
# Install
$ sudo apt-get install maven

# Create dummy project
$ mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

# Build with wildcard deps
# in pom.xml:
  <build>
    <plugins>
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-compiler-plugin</artifactId>
        <version>3.1</version>
        <configuration>
          <source>1.7</source>
          <target>1.7</target>
        </configuration>
      </plugin>
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-dependency-plugin</artifactId>
        <version>2.1</version>
        <executions>
          <execution>
            <id>copy-dependencies</id>
            <phase>package</phase>
            <goals>
              <goal>copy-dependencies</goal>
            </goals>
            <configuration>
              <outputDirectory>${project.build.directory}/lib</outputDirectory>
              <overWriteReleases>false</overWriteReleases>
              <overWriteSnapshots>false</overWriteSnapshots>
              <overWriteIfNewer>true</overWriteIfNewer>
            </configuration>
          </execution>
        </executions>
      </plugin>
    </plugins>
  </build>
  <dependencies>
    <dependency>
      <groupId>com.sparkjava</groupId>
      <artifactId>spark-core</artifactId>
      <version>1.0</version>
    </dependency>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>3.8.1</version>
      <scope>test</scope>
    </dependency>
  </dependencies>
$ mvn dependency:copy-dependencies
$ mvn package
$ java -cp "target/my-app-1.0-SNAPSHOT.jar;target/lib/*" com.mycompany.app.HelloWorld
