module Page.Contact exposing (Data, Model, Msg, page)

import DataSource exposing (DataSource)
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Head
import Head.Seo as Seo
import Lib.Colors as Colors
import Lib.FontAwesome as FontAwesome
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
        , description = "Danilo Silva's Contact Page"
        , locale = Just "pt-br"
        , title = "Contact Page"
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


twitter : Element Msg
twitter =
    FontAwesome.linkIcon { url = "https://www.twitter.com/dev_danilosilva", awesomeClasses = "fa-brands fa-twitter", color = Colors.twitterBlue }


instagram : Element Msg
instagram =
    FontAwesome.linkIcon { url = "https://www.instagram.com/danilos.silva/", awesomeClasses = "fa-brands fa-instagram", color = Colors.instaRed }


linkedin : Element Msg
linkedin =
    FontAwesome.linkIcon
        { url = "https://www.linkedin.com/in/danilosilva29/"
        , awesomeClasses = "fa-brands fa-linkedin"
        , color = Colors.linkedinBlue
        }


email : Element Msg
email =
    FontAwesome.linkIcon
        { url = "mailto:dev.danilosilva@gmail.com"
        , awesomeClasses = "fa-solid fa-envelope"
        , color = Colors.yellow
        }


github : Element Msg
github =
    FontAwesome.linkIcon
        { url = "https://github.com/dev-danilosilva"
        , awesomeClasses = "fa-brands fa-github"
        , color = Colors.white
        }


socialLinks : List (Element Msg)
socialLinks =
    [ github
    , twitter
    , instagram
    , linkedin
    , email
    ]


contactView : Element Msg
contactView =
    let
        attrs =
            [ Font.color Colors.green
            , pageFont
            , centerX
            , centerY
            , spacing 25
            ]
    in
    column attrs
        [ row [ spacing 20, Font.size 60 ]
            socialLinks
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
    { title = "Contact"
    , body =
        contactView
            |> Element.layout [ Background.color Colors.black ]
            |> List.singleton
    }
