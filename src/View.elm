module View exposing (..)

import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (class)

import Msgs exposing (Msg)
import StoveView exposing (stoveView)
import Models exposing (Model)


type RouteMsg
    = NotFound
    | Stove


router : Int -> RouteMsg
router route =
    if route == 0 then
        Stove
    else
        NotFound
    

resolveView : Model -> RouteMsg -> List (Html Msg)
resolveView model page =
    case page of
        Stove ->
            [ div [ class "header" ] []
            , h1 [] [ text "VCR Stove" ]
            , div [] [ stoveView model ]
            ]

        NotFound ->
            [ div [ class "header" ] []
            , h1 [] [ text "404" ]
            , div [ class "page" ] []
            ]


view : Model -> Html Msg
view model =
    div [ class "root" ] <|
        resolveView model <|
            router <|
                model.route
