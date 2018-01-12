module DocPrinting exposing (newline, aliasToString, typeToString, valueToString)

import Docs exposing (Value, Type, TypeCase, Alias)


newline : String
newline =
    "\n"


indent : String
indent =
    "    "


newlineIndent : String
newlineIndent =
    newline ++ indent


aliasToString : Alias -> String
aliasToString alias =
    "type alias "
        ++ alias.name
        ++ " = "
        ++ newlineIndent
        ++ alias.type_


typeToString : Type -> String
typeToString type_ =
    "type "
        ++ type_.name
        ++ " "
        ++ (String.join " " type_.args)
        ++ newlineIndent
        ++ "= "
        ++ (type_.cases
                |> List.map caseToString
                |> String.join (newlineIndent ++ "| ")
           )


caseToString : ( String, List String ) -> String
caseToString ( name, types ) =
    name
        ++ " "
        ++ (types
                |> String.join " "
           )


valueToString : Value -> String
valueToString value =
    value.name
        ++ " : "
        ++ value.type_
