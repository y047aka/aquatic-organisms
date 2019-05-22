module Main exposing (main)

import Browser
import Html exposing (footer, h1, header, node, p, section, text)
import Html.Attributes exposing (id, src)
import Organisms.Closterium exposing (closterium)
import TypedSvg exposing (svg)
import TypedSvg.Attributes exposing (class, viewBox)
import TypedSvg.Attributes.InPx exposing (height, width, x, y)
import TypedSvg.Core exposing (Svg)


main =
    Browser.document
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


type alias Model =
    { organisms : List String }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model
        [ "closterium"
        ]
    , Cmd.none
    )


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


view : Model -> Browser.Document Msg
view model =
    { title = "Aquatic Organisms"
    , body =
        [ header []
            [ h1 [] [ text "Aquatic Organisms" ]
            ]
        , node "main"
            []
            (model.organisms
                |> List.map
                    (\name ->
                        section []
                            [ case name of
                                "closterium" ->
                                    svgItem closterium

                                _ ->
                                    text ""
                            ]
                    )
            )
        , footer []
            [ p [] [ text "y047aka" ]
            ]
        ]
    }


svgItem : Svg msg -> Svg msg
svgItem item =
    svg
        [ width 500
        , height 500
        , viewBox -250 -250 500 500
        ]
        [ item ]
