module Organisms.Volvox exposing (volvox)

import Curve
import SubPath exposing (SubPath)
import TypedSvg exposing (circle, g, svg)
import TypedSvg.Attributes exposing (class, viewBox)
import TypedSvg.Attributes.InPx exposing (cx, cy, height, r, width)
import TypedSvg.Core exposing (Svg)
import TypedSvg.Types exposing (Transform(..))


volvox : Svg msg
volvox =
    g []
        [ g [ class [ "parent" ] ] [ parent ]
        , children
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
            |> List.map (\( dx, dy, radius ) -> circle [ class [ "child" ], cx dx, cy dy, r radius ] [])
        )
