module Main exposing (main)

import Browser
import Html exposing (Html, footer, h1, header, li, node, p, text, ul)
import Html.Attributes exposing (class, id, src)
import Organisms.Closterium exposing (closterium)
import TypedSvg exposing (svg)
import TypedSvg.Attributes exposing (viewBox)
import TypedSvg.Attributes.InPx exposing (height, width, x, y)
import TypedSvg.Core exposing (Svg)


main =
    Browser.document
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }



-- MODEL


type alias Model =
    { organisms : List Organism }


type alias Organism =
    { binomialName : String
    , japaneseName : String
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model
        [ { binomialName = "Closterium"
          , japaneseName = "ミカヅキモ"
          }
        ]
    , Cmd.none
    )



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "Aquatic Organisms"
    , body =
        [ header [ class "site-header" ]
            [ h1 [] [ text "Aquatic Organisms" ]
            ]
        , node "main"
            []
            [ viewOrganisms model ]
        , footer [ class "site-footer" ]
            [ p [ class "copyright" ] [ text "© 2019 y047aka" ]
            ]
        ]
    }


viewOrganisms : Model -> Html Msg
viewOrganisms model =
    ul [ class "organisms" ]
        (model.organisms
            |> List.map
                (\o ->
                    li [ class "closterium" ]
                        [ h1 [] [ text o.japaneseName ]
                        , p [] [ text ("学名：" ++ o.binomialName) ]
                        , case o.binomialName of
                            "Closterium" ->
                                svgItem closterium

                            _ ->
                                text ""
                        ]
                )
        )


svgItem : Svg msg -> Svg msg
svgItem item =
    svg
        [ width 500
        , height 500
        , viewBox -250 -250 500 500
        ]
        [ item ]
