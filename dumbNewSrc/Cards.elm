module Cards exposing (..)

import Tuple exposing (Tuple, first, second)
import List exposing (List)

type Card = {
    , intValue : Int
    , displayValue : String
    , suit : String
}

traditionalSuits =
    [ "♣️"
    , "♥️"
    , "♠️"
    , "♦️"
    ]

faceValues =
    [ "A"
    , "2"
    , "3"
    , "4"
    , "5"
    , "6"
    , "7"
    , "8"
    , "9"
    , "10"
    , "J"
    , "Q"
    , "K"
    ]

createCard : String -> Int -> String -> Card
createCard cardSuit val prettyVal =
    {
        intValue = val
        , displayValue = prettyVal
        , suit = cardSuit
    }


createDeck : List(String) -> List(String) -> List(Card)
createDeck suits faces =
    flip List.indexMap faces <|
        List.map createCard suits
