module Preview exposing (view)

import Html exposing (..)
import SharedViews


view : String -> Html msg
view name =
    case name of
        "SharedViews.buttonPrimary" ->
            div []
                [ SharedViews.buttonPrimary "Primary one"
                , SharedViews.buttonPrimary "Primary two"
                ]

        "SharedViews.buttonSecondary" ->
            div []
                [ SharedViews.buttonSecondary "Secondary one"
                , SharedViews.buttonSecondary "Secondary two"
                ]

        _ ->
            text <| "Preview missing for \"" ++ name ++ "\""
