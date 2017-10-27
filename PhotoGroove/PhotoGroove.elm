module PhotoGroove exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


urlPrefix =
    "https://imgs.xkcd.com/comics/"


view model =
    div [ class "content" ]
        [ h1 [] [ text "Photo Groove" ]
        , div [ id "thumbnails" ] (List.map viewThumbnail model)
        ]


viewThumbnail thumbnail =
    img [ src (urlPrefix ++ thumbnail.url) ] []


initialModel =
    [ { url = "cast_iron_pans.png" }
    , { url = "making_progress.png" }
    , { url = "immune_system.png" }
    ]


main =
    view initialModel
