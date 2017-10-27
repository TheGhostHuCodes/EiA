module PhotoGroove exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


urlPrefix =
    "https://imgs.xkcd.com/comics/"


view model =
    div [ class "content" ]
        [ h1 [] [ text "Photo Groove" ]
        , div [ id "thumbnails" ]
            (List.map (viewThumbnail model.selectedUrl) model.photos)
        , img
            [ class "large"
            , src (urlPrefix ++ model.selectedUrl)
            ]
            []
        ]


viewThumbnail selectedUrl thumbnail =
    img
        [ src (urlPrefix ++ thumbnail.url)
        , classList [ ( "selected", selectedUrl == thumbnail.url ) ]
        ]
        []


initialModel =
    { photos =
        [ { url = "cast_iron_pans.png" }
        , { url = "making_progress.png" }
        , { url = "immune_system.png" }
        ]
    , selectedUrl = "cast_iron_pans.png"
    }


main =
    view initialModel
