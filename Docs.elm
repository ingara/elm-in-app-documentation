module Docs exposing (Docs, Module, Value, Type, TypeCase, Alias, decode)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode


type alias Docs =
    List Module


type alias Module =
    { name : String
    , comment : String
    , aliases : List Alias
    , types : List Type
    , values : List Value
    , generatedWithElmVersion : String
    }


type alias Value =
    { name : String
    , comment : String
    , type_ : String
    }


type alias TypeCase =
    ( String, List String )


type alias Type =
    { name : String
    , comment : String
    , args : List String
    , cases : List TypeCase
    }


type alias Alias =
    { name : String
    , comment : String
    , args : List String
    , type_ : String
    }


decode : Decoder Docs
decode =
    Decode.list decodeModule


decodeModule : Decoder Module
decodeModule =
    Decode.decode Module
        |> Decode.required "name" Decode.string
        |> Decode.required "comment" Decode.string
        |> Decode.required "aliases" (Decode.list decodeAlias)
        |> Decode.required "types" (Decode.list decodeType)
        |> Decode.required "values" (Decode.list decodeValue)
        |> Decode.required "generated-with-elm-version" Decode.string


decodeTypeCase : Decoder TypeCase
decodeTypeCase =
    Decode.map2 (,)
        (Decode.index 0 Decode.string)
        (Decode.index 1 (Decode.list Decode.string))


decodeType : Decoder Type
decodeType =
    Decode.decode Type
        |> Decode.required "name" Decode.string
        |> Decode.required "comment" Decode.string
        |> Decode.required "args" (Decode.list Decode.string)
        |> Decode.required "cases" (Decode.list decodeTypeCase)


decodeValue : Decoder Value
decodeValue =
    Decode.decode Value
        |> Decode.required "name" Decode.string
        |> Decode.required "comment" Decode.string
        |> Decode.required "type" Decode.string


decodeAlias : Decoder Alias
decodeAlias =
    Decode.decode Alias
        |> Decode.required "name" Decode.string
        |> Decode.required "comment" Decode.string
        |> Decode.required "args" (Decode.list Decode.string)
        |> Decode.required "type" Decode.string
