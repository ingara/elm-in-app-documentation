module Main exposing (..)

import Html exposing (Html, text)
import Http exposing (Request)
import Docs exposing (Docs)
import View


docRequest : Request Docs
docRequest =
    Http.get "docs.json" Docs.decode


type alias Model =
    { docs : Maybe Docs }


type Msg
    = DocResponse (Result Http.Error Docs)


init : ( Model, Cmd Msg )
init =
    ( { docs = Nothing }
    , Http.send DocResponse docRequest
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case (Debug.log "m" msg) of
        DocResponse (Ok docs) ->
            ( { model | docs = Just docs }
            , Cmd.none
            )

        DocResponse _ ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    case model.docs of
        Just docs ->
            View.documentation docs

        Nothing ->
            text "Waiting for response..."


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = always Sub.none
        }
