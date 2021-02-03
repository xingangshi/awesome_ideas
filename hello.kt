/**
  1. Install kotlin for Terminal
  1.1 Install Sdk
      $ curl -s https://get.sdkman.io | bash

      Open a new Terminal, then:
      $ source "/home/root/.sdkman/bin/sdkman-init.sh"
      $ sdk selfupdate force

  1.2 Install kotlin
      $sdk install kotlin

  1.3 Install openjdk
      $apt-get update
      $apt-get install -y openjdk-11-jdk-headless

  2. Run .kt files as an application
     $ kotlinc hello.kt -include-runtime -d hello.jar
     $ java -jar hello.jar

  3. Using .kt as a lib
     $ kotlinc hello.kt -d hello.jar
     $ kotlin -classpath hello.jar HelloKt

  4. Run in the REPL
     $ kotlinc-jvm
 */

// Oneline comment
//
// just a simple kotlin demo
fun main() {
  println("What's your name ?")
  val name = readLine()
  println("Hello, $name !")
}

