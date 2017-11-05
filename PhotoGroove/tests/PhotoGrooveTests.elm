module PhotoGrooveTests exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import PhotoGroove exposing (..)
import Json.Decode exposing (decodeString)


decoderTest : Test
decoderTest =
    test "title defaults to (untitled)" <|
        \_ ->
            """{"url": "fruits.com", "size": 5}"""
                |> decodeString photoDecoder
                |> Result.map .title
                |> Expect.equal (Ok "(untitled)")
