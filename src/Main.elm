module Main exposing (..)

import Html exposing (program)
import Msgs exposing (Msg)
import Models exposing (Model)
import Update exposing (update)
import View exposing (view)


init : ( Model, Cmd Msg )
init =
    ( { open = False
      , videoSrc = "https://media.giphy.com/media/UflLFAje3IXKw/giphy.mp4"
      , nextVideoSrc = ""
      }
    , Cmd.none
    )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
