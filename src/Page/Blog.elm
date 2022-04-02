module Page.Blog exposing (Model, Msg, Data, page)

import DataSource exposing (DataSource)
import Head
import Head.Seo as Seo
import Page exposing (Page, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Shared
import View exposing (View)
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Lib.Colors as Colors


type alias Model =
    ()


type alias Msg =
    Never

type alias RouteParams =
    {}

page : Page RouteParams Data
page =
    Page.single
        { head = head
        , data = data
        }
        |> Page.buildNoState { view = view }


type alias Data =
    ()


data : DataSource Data
data =
    DataSource.succeed ()


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

blogView : Element Msg
blogView =
    let
        attrs =
            [ Font.color Colors.green
            , pageFont 
            , centerX
            , centerY
            , spacing 15
            ]
    in
        column attrs
            [ el [Font.size 35, centerX] <| text "Coming Soon"
            , link 
                [ Font.size 20
                , centerX
                , centerY
                , mouseOver
                    [ Font.shadow
                        { offset = (0, 0)
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
    { title = "Blog"
    , body =
        blogView
        |> Element.layout [Background.color Colors.black]
        |> List.singleton
    }
