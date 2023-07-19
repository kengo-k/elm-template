# How to setup Elm Development environment

## Install Elm

Install Elm using asdf.

```
$ asdf plugin add elm
$ asdf list all elm # List available versions of Elm.
$ asdf install elm <version>
$ asdf local elm <version>
```

## Run HelloWorld

### Init Project

Execute the following command to create an Elm project.

```
$ elm init
```

### Create HelloWorld Program

Create a new file named Main.elm with the following content in the src directory.

```elm
module Main exposing (..)

import Html exposing (text)

main =
    text "Hello, World!"
```

Execute the following command to compile Main.elm.

```
elm make src/Main.elm --output=main.js
```