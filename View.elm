module View exposing (..)

{-| Module for views

@docs buttonPrimary, buttonSecondary

-}

import Html exposing (..)
import Html.Attributes exposing (..)


{-| Primary button
-}
buttonPrimary : String -> Html msg
buttonPrimary txt =
    button [ class "button--primary" ]
        [ text txt ]


{-| Secondary button
-}
buttonSecondary : String -> Html msg
buttonSecondary txt =
    button [ class "button--secondary" ]
        [ text txt ]
