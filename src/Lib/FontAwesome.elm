module Lib.FontAwesome exposing (..)

import Html
import Html.Attributes
import Element
import Element.Font as Font


icon : String -> Element.Element msg
icon classes = Element.html <| Html.i [Html.Attributes.class classes] []

linkIcon : { url : String, awesomeClasses : String, color : Element.Color } -> Element.Element msg
linkIcon {url, awesomeClasses, color} =
    Element.newTabLink [Font.color color] {url = url, label = icon awesomeClasses}
