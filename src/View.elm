module View exposing (..)

import Html exposing (Html, div, text, h1, button, input, video)
import Html.Attributes exposing (class, src, autoplay, loop, placeholder)
import Html.Events exposing (onClick, onInput)
import Msgs exposing (Msg)
import Models exposing (Model)


doorState : Bool -> String
doorState open =
    if open then
        "inside open"
    else
        "inside closed"


view : Model -> Html Msg
view model =
    div [ class "root" ]
        [ h1 [] [ text "VCR Stove" ]
        , div [ class "page" ]
            [ div [ class "stove" ]
                [ div [ class "panel" ]
                    [ div [ class "dial-group" ]
                        [ div [ class "dial" ] []
                        , div [ class "dial" ] []
                        , div [ class "dial" ] []
                        ]
                    ]
                , div [ class "torso" ]
                    [ div [ class "door" ]
                        [ div [ model.open |> doorState |> class ]
                            [ input
                                [ placeholder "Paste a video url here"
                                , class "new-img"
                                , onInput Msgs.ChangeVideo
                                ]
                                []
                            ]
                        , div [ class "handle-wrapper" ]
                            [ button
                                [ onClick Msgs.ToggleDoor
                                , class "handle"
                                ]
                                []
                            ]
                        , div [ class "window" ]
                            [ video
                                [ loop True
                                , autoplay True
                                , src <| model.videoSrc
                                , class "window__view"
                                ]
                                []
                            ]
                        ]
                    ]
                ]
            ]
        ]
