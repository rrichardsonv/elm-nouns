module Update exposing (..)

import Msgs exposing (Msg(..))
import Models exposing (Model)


toggle : Bool -> Bool
toggle bool =
    if bool then
        False
    else
        True


noUpdateEmpty : String -> String -> String
noUpdateEmpty curSrc nextSrc =
    if nextSrc == "" then
        curSrc
    else
        nextSrc


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeRoute newRoute ->
            ( { open = model.open
              , videoSrc = model.videoSrc
              , nextVideoSrc = model.nextVideoSrc
              , route = newRoute
              }
            , Cmd.none
            )

        ChangeVideo newContent ->
            ( { open = model.open
              , videoSrc = model.videoSrc
              , nextVideoSrc = newContent
              , route = model.route
              }
            , Cmd.none
            )

        ToggleDoor ->
            ( { open = toggle model.open
              , videoSrc = (noUpdateEmpty model.videoSrc model.nextVideoSrc)
              , nextVideoSrc = ""
              , route = model.route
              }
            , Cmd.none
            )

        NoOp ->
            ( model, Cmd.none )
