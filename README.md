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

### Start Dev Server with elm-live

We will use `elm-live` to launch the development server and run HelloWorld. elm-live allows for more efficient development as it possesses a hot-reloading feature that the standard `elm-reactor` does not have. Install elm-live with the following command.

```
$ npm install --global elm-live
```

After installation, execute the following command to launch the development server.

```
$ elm-live src/Main.elm --start-page=index.html -- --output=main.js
```

Please confirm that the server is running at localhost:8000 and that "HelloWorld" is being displayed.

### Auto formatting with elm-format

Set up to automatically format elm source file using elm-format in VSCode when saving. Execute the following command to install elm-format.

```
$ npm install -g elm-format
```

Install [Elm Plugin for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=Elmtooling.elm-ls-vscode) and add the following configuration to the VSCode settings file.

```
"[elm]": {
    "editor.formatOnSave": true
},
```

## Run Unit Test with elm-test

Execute the following command to install `elm-test`.

```
$ npm install -g elm-test
```

Execute the following command to install the packages needed for testing in Elm.

```
$ elm install elm-explorations/test
```

We will create the following function as a subject for testing.

```elm
add : Int -> Int -> Int
add x y =
    x + y
```

To test the above function, create test code with the following content in the tests/Test.elm.

```elm
module Tests exposing (..)

import Expect
import Main exposing (add)
import Test exposing (..)


all : Test
all =
    describe "add function"
        [ test "adds two numbers" <|
            \_ ->
                add 1 2
                    |> Expect.equal 3
        ]
```

Execute the following command to run all tests.

```
$ elm-test
```
