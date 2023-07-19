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
