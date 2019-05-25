module Organisms.Volvox exposing (volvox)

import Curve
import Html.Attributes exposing (id)
import SubPath exposing (SubPath)
import TypedSvg exposing (circle, defs, filter, g, svg)
import TypedSvg.Attributes exposing (class, stitchTiles, style, viewBox)
import TypedSvg.Attributes.InPx exposing (cx, cy, height, r, width)
import TypedSvg.Core exposing (Svg)
import TypedSvg.Filters as Filters
import TypedSvg.Filters.Attributes exposing (baseFrequency, colorMatrixType, colorMatrixValues, numOctaves, seed, turbulenceType)
import TypedSvg.Types exposing (ColorMatrixType(..), Transform(..), TurbulenceType(..))


volvox : Svg msg
volvox =
    g []
        [ g [ class [ "parent" ] ] [ parent ]
        , children
        , noise
        ]



-- 親


parent : Svg msg
parent =
    circle [ cx 0, cy 0, r 150 ] []



-- 生殖細胞


children : Svg msg
children =
    g []
        ([ ( -80, -30, 55 )
         , ( 35, -80, 55 )
         , ( 85, 25, 55 )
         , ( -45, 45, 60 )
         ]
            |> List.map
                (\( dx, dy, radius ) ->
                    circle
                        [ class [ "child" ]
                        , cx dx
                        , cy dy
                        , r radius
                        , style "filter: url(#feTurbulence);"
                        ]
                        []
                )
        )



-- パーリンノイズ


noise : Svg msg
noise =
    defs []
        [ filter
            [ id "feTurbulence" ]
            [ Filters.turbulence
                [ turbulenceType TurbulenceTypeFractalNoise
                , baseFrequency 0.05 0.05
                , seed 3
                , numOctaves 5
                , stitchTiles "stitch"
                ]
                []
            , Filters.colorMatrix
                [ colorMatrixType ColorMatrixTypeSaturate
                , colorMatrixValues "0"
                ]
                []
            ]
        ]
