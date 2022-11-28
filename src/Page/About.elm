module Page.About exposing (Data, Model, Msg, page)

import DataSource exposing (DataSource)
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Head
import Head.Seo as Seo
import Lib.Colors as Colors
import Page exposing (Page, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Shared
import View exposing (View)


type alias Model =
    ()


type alias Msg =
    Never


type alias RouteParams =
    {}


descriptionText : String
descriptionText =
    """
    My name is Danilo Silva, I'm a brazillian who loves functional programming and
    programming languages. Nowadays, I work as a Software Engineer at Nubank, building software using
    Clojure, Datomic, DynamoDB, Kafka and another amazing tecnologies.
    """


descriptionElement : Element msg
descriptionElement =
    paragraph [ paddingXY 100 0 ]
        [ text descriptionText ]


page : Page RouteParams Data
page =
    Page.single
        { head = head
        , data = data
        }
        |> Page.buildNoState { view = view }


type alias Data =
    { intro : String
    , professionalExperiences : List String
    , portfolioHighlights : List String
    }


data : DataSource Data
data =
    DataSource.succeed
        { intro = ""
        , professionalExperiences = []
        , portfolioHighlights = []
        }


head :
    StaticPayload Data RouteParams
    -> List Head.Tag
head static =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "elm-pages"
        , image =
            { url = Pages.Url.external "TODO"
            , alt = "elm-pages logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "TODO"
        , locale = Nothing
        , title = "TODO title" -- metadata.title -- TODO
        }
        |> Seo.website


pageFont : Attribute Msg
pageFont =
    Font.family
        [ Font.external
            { url = "https://fonts.googleapis.com/css2?family=Share+Tech+Mono&display=swap"
            , name = "Share Tech Mono"
            }
        , Font.sansSerif
        ]


aboutView : Element Msg
aboutView =
    let
        attrs =
            [ Font.color Colors.green
            , pageFont
            , centerX
            , centerY
            , spacing 50
            ]
    in
    column attrs
        [ el [ Font.size 20, centerX ] <| descriptionElement
        , link
            [ Font.size 24
            , centerX
            , centerY
            , mouseOver
                [ Font.shadow
                    { offset = ( 0, 0 )
                    , blur = 20
                    , color = Colors.white
                    }
                ]
            ]
            { url = "/"
            , label = text "Go To Home"
            }
        ]


view :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> View Msg
view maybeUrl sharedModel static =
    { title = "About"
    , body =
        aboutView
            |> Element.layout [ Background.color Colors.black ]
            |> List.singleton
    }
