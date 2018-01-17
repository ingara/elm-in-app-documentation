module View exposing (documentation)

import Docs exposing (Docs, Module, Value, Type, TypeCase, Alias)
import Html exposing (..)
import Preview
import DocPrinting as Print
import Markdown


documentation : Docs -> Html msg
documentation docs =
    div []
        [ h1 [] [ text "Documentation!" ]
        , div [] <|
            List.map viewModule docs
        ]


viewModule : Module -> Html msg
viewModule module_ =
    div []
        [ h2 []
            [ text <| "Module: " ++ module_.name ]
        , pre []
            [ text module_.comment ]
        , h3 []
            [ text "Type aliases" ]
        , div [] <|
            List.map viewAlias module_.aliases
        , h3 []
            [ text "Union types" ]
        , div [] <|
            List.map viewType module_.types
        , h3 []
            [ text "Values" ]
        , div [] <|
            List.map (viewValue module_.name) module_.values
        ]


viewAlias : Alias -> Html msg
viewAlias alias =
    showMarkdown <|
        "{-|"
            ++ alias.comment
            ++ "-}"
            ++ Print.newline
            ++ Print.aliasToString alias


viewType : Type -> Html msg
viewType type_ =
    showMarkdown <|
        "{-|"
            ++ type_.comment
            ++ "-}"
            ++ Print.newline
            ++ Print.typeToString type_


viewValue : String -> Value -> Html msg
viewValue moduleName value =
    table []
        [ tr []
            [ th [] [ text "Doc" ]
            , th [] [ text "Preview" ]
            ]
        , tr []
            [ td []
                [ showMarkdown <|
                    "{-|"
                        ++ value.comment
                        ++ "-}"
                        ++ Print.newline
                        ++ Print.valueToString value
                ]
            , td []
                [ Preview.view <| moduleName ++ "." ++ value.name
                ]
            ]
        ]


showMarkdown : String -> Html msg
showMarkdown str =
    Markdown.toHtml [] <|
        """
```elm
"""
            ++ str
            ++ """
```
"""
