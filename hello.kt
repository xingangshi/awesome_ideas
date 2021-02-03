/**
  1. Install kotlin for Terminal
  curl -s https://get.sdkman.io | bash
  sdk selfupdate force

  sdk install kotlin

  apt install openjdk-11-jdk-headles


  2. Run .kt files as an application
  kotlinc hello.kt -include-runtime -d hello.jar
  java -jar hello.jar

  3. Using .kt as a lib
  kotlinc hello.kt -d hello.jar
  kotlin -classpath hello.jar HelloKt

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

