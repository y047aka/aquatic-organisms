module Main exposing (main)

import Browser
import Curve
import Html exposing (img)
import Html.Attributes exposing (id, src)
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
        [ svg
            [ width 500
            , height 500
            , viewBox -250 -250 500 500
            ]
            [ closterium
            ]
        ]
    }


definitions : Svg msg
definitions =
    defs []
        [ symbol [] [] ]


closterium : Svg msg
closterium =
    g [ transform [ Rotate 30 0 0 ] ]
        [ SubPath.element outline []
        , pyrenoids
        ]


outline : SubPath
outline =
    Curve.catmullRomClosed 0.5
        [ ( 0, 10 )
        , ( 55, 5 )
        , ( 120, -20 )
        , ( 150, -40 )
        , ( 150, -30 )
        , ( 85, 35 )
        , ( 0, 60 )
        , ( -85, 35 )
        , ( -150, -30 )
        , ( -150, -40 )
        , ( -120, -20 )
        , ( -55, 5 )
        ]


pyrenoids : Svg msg
pyrenoids =
    g []
        ([ ( -95, 10 )
         , ( -70, 22 )
         , ( -45, 30 )
         , ( -20, 35 )
         , ( 20, 35 )
         , ( 45, 30 )
         , ( 70, 22 )
         , ( 95, 10 )
         ]
            |> List.map (\( dx, dy ) -> circle [ class [ "pyrenoid" ], cx dx, cy dy, r 5 ] [])
        )
