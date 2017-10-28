module PhotoGroove exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Array exposing (Array)


urlPrefix : String
urlPrefix =
    "https://imgs.xkcd.com/comics/"


type alias Msg =
    { operation : String, data : String }


type alias Photo =
    { url : String }


type alias Model =
    { photos : List Photo
    , selectedUrl : String
    }


view : Model -> Html Msg
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


viewThumbnail : String -> Photo -> Html Msg
viewThumbnail selectedUrl thumbnail =
    img
        [ src (urlPrefix ++ thumbnail.url)
        , classList [ ( "selected", selectedUrl == thumbnail.url ) ]
        , onClick { operation = "SELECT_PHOTO", data = thumbnail.url }
        ]
        []


initialModel : Model
initialModel =
    { photos =
        [ { url = "cast_iron_pans.png" }
        , { url = "making_progress.png" }
        , { url = "immune_system.png" }
        ]
    , selectedUrl = "cast_iron_pans.png"
    }


update msg model =
    if msg.operation == "SELECT_PHOTO" then
        { model | selectedUrl = msg.data }
    else
        model


photoArray : Array Photo
photoArray =
    Array.fromList initialModel.photos


main =
    Html.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
