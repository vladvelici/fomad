fomad
=====

*F*ast c*O*mpile and *MA*ven *D*ependency management


> This is a hack. Normally you would simply write in Go. >:)

A small Makefile for those who hate Maven and don't want to deal with it.

init
----
From your project root:

    curl http... | sh

Why?
----

Maven is slow. Compilation of small things just takes forever (5s) compared to less than a second. But maven is good at one thing: dependency management. As longs as you depend on some libraries that depend on some other libraries which also have some dependencies, downloading the jars manually is painful. Lots of Java libraries out there give copy-and-paste Maven pom.xml dependency snippets.

**Note:** fomad comes from a vim user. Might not be IDE friendly. 

Solution
--------

A Makefile, a cached classpath and a script to run your software.

You don't need the Maven source code structure anymore. Just a folder where you want your .class files and a folder where you put your sources. Defaults are:

    src/        - source files
    bin/        - .class files
    pom.xml     - Maven pom file - for dependencies only.
    Makefile    - The makefile provided in this repository
    .gitignore

    # Autogenerated files:
    r           - script generated by Makefile to help you run your Java programs
    .classpath  - file that holds the maven-generated classpath
    .sources    - java sources index for javac


