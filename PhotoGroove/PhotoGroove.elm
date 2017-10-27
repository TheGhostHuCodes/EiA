module PhotoGroove exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


view model =
    div [ class "content" ]
        [ h1 [] [ text "Photo Groove" ]
        , div [ id "thumbnails" ]
            [ img [ src " https://imgs.xkcd.com/comics/cast_iron_pans.png " ] []
            , img [ src "https://imgs.xkcd.com/comics/making_progress.png" ] []
            , img [ src "https://imgs.xkcd.com/comics/immune_system.png" ] []
            ]
        ]


main =
    view "no model yet"
