module Lib.UI.Element exposing (animatedEl)

import Element
import Simple.Animation as Animation
import Simple.Animation.Animated as Animated


animatedUi : (List (Element.Attribute msg) -> children -> Element.Element msg) -> Animation.Animation -> List (Element.Attribute msg) -> children -> Element.Element msg
animatedUi =
    Animated.ui
        { behindContent = Element.behindContent
        , htmlAttribute = Element.htmlAttribute
        , html = Element.html
        }

animatedEl : Animation.Animation -> List (Element.Attribute msg) -> Element.Element msg -> Element.Element msg
animatedEl =
    animatedUi Element.el
