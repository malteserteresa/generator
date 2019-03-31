import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Random

main =
  Browser.element { init = init, update = update, subscriptions = subscriptions, view = view }


-- MODEL

type alias Model = 
  { number : Int
  }

init : () -> (Model, Cmd Msg)
init _ =
  ( Model 1
  , Cmd.none
  )

-- UPDATE

type Msg = Generate | NewNumber Int

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Generate ->
      ( model
      , Random.generate NewNumber (Random.int 1 100)
      )

    NewNumber newNumber ->
      (Model newNumber
      , Cmd.none
      )

-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Generate ] [ text "Generate" ]
    , div [] [ text (String.fromInt model.number) ]
    ]
