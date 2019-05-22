module Organisms.Closterium exposing (closterium)

import Curve
import SubPath exposing (SubPath)
import TypedSvg exposing (circle, defs, ellipse, g, rect, svg, symbol, use)
import TypedSvg.Attributes exposing (class, points, transform, viewBox, xlinkHref)
import TypedSvg.Attributes.InPx exposing (cx, cy, height, r, rx, ry, width, x, y)
import TypedSvg.Core exposing (Svg)
import TypedSvg.Types exposing (Transform(..))


closterium : Svg msg
closterium =
    g [ transform [ Rotate 30 0 0 ] ]
        [ g [ class [ "cell-wall" ] ] [ SubPath.element cellWall [] ]
        , pyrenoids
        ]



-- 細胞壁


cellWall : SubPath
cellWall =
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



-- ピレノイド


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
