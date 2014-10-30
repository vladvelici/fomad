SRCPATH=./src
BINPATH=./bin

## Comile all .java files in src source to bin/.
all: .classpath r
	find ${SRCPATH} -name *.java > .sources && \
	javac -d ${BINPATH} -cp "`cat .classpath`" @.sources
	-rm .sources

## Create a runner script.
r:
	echo '#!/bin/sh\njava -cp "${BINPATH}:`cat .classpath`" $$@\n' > r
	chmod +x r

## Download all dependencies
fetch: pom.xml
	mvn dependency:resolve -q

## Delete compiled files (.class).
clean:
	-rm -r bin/*

## Delete compiled files (.class), .classpath and the runner script.
refresh: clean
	-rm .classpath
	-rm r

## Generate the classpath
.classpath: pom.xml
	mvn dependency:build-classpath -Dmdep.pathSeparator=":" -Dmdep.fileSeparator="/" -Dmdep.outputFile=.classpath -q
	touch .classpath
