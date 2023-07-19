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

Create an index.html file with the following content to embed the compiled main.js file into HTML.

```html
<!DOCTYPE html>
<html>
<head>
    <title>My Elm App</title>
</head>
<body>
    <div id="elm-root"></div>
    <script src="main.js"></script>
    <script>
        var app = Elm.Main.init({
            node: document.getElementById('elm-root')
        });
    </script>
</body>
</html>
```