module View exposing (View, map, placeholder)

import Html exposing (Html)


type alias View msg =
    { title : String
    , body : List (Html msg)
    }


map : (msg1 -> msg2) -> View msg1 -> View msg2
map fn view =
    { title = view.title
    , body = List.map (Html.map fn) view.body
    }


placeholder : String -> View msg
placeholder moduleName =
    { title = "Danilo Silva - " ++ moduleName
    , body = [ Html.text moduleName ]
    }
