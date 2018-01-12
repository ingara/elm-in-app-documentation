module Preview exposing (view)

import Html exposing (..)
import View


view : String -> Html msg
view name =
    case name of
        "View.buttonPrimary" ->
            div []
                [ View.buttonPrimary "Primary one"
                , View.buttonPrimary "Primary two"
                ]

        "View.buttonSecondary" ->
            div []
                [ View.buttonSecondary "Secondary one"
                , View.buttonSecondary "Secondary two"
                ]

        _ ->
            text <| "Preview missing for \"" ++ name ++ "\""
