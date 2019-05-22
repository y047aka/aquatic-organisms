module Main exposing (main)

import Browser
import Curve
import Html exposing (footer, h1, header, node, p, section, text)
import Html.Attributes exposing (id, src)
import Organisms.Closterium exposing (closterium)
import SubPath exposing (SubPath)
import TypedSvg exposing (circle, defs, ellipse, g, rect, svg, symbol, use)
import TypedSvg.Attributes exposing (class, points, transform, viewBox, xlinkHref)
import TypedSvg.Attributes.InPx exposing (cx, cy, height, r, rx, ry, width, x, y)
import TypedSvg.Core exposing (Svg)
import TypedSvg.Types exposing (Transform(..))


main =
    Browser.document
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


type alias Model =
    { userState : String }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model ""
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
            ([ closterium
             ]
                |> List.map
                    (\name ->
                        section []
                            [ svg
                                [ width 500
                                , height 500
                                , viewBox -250 -250 500 500
                                ]
                                [ name ]
                            ]
                    )
            )
        , footer []
            [ p [] [ text "y047aka" ]
            ]
        ]
    }


definitions : Svg msg
definitions =
    defs []
        [ symbol [] [] ]


item : Svg msg -> Svg msg
item svgItem =
    svg
        [ width 500
        , height 500
        , viewBox -250 -250 500 500
        ]
        [ svgItem ]
