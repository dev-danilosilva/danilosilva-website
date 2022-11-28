module Page.Index exposing (Data, Model, Msg, page)

import DataSource exposing (DataSource)
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Element.Region as Region
import Head
import Head.Seo as Seo
import Lib.Colors as Colors
import Lib.UI.Animation as LibAnimation
import Lib.UI.Element as LibElement
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


data : DataSource Data
data =
    DataSource.succeed ()


head :
    StaticPayload Data RouteParams
    -> List Head.Tag
head static =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "danilosilva.page"
        , image =
            { url = Pages.Url.external "TODO"
            , alt = "Danilo Silva Website"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "Danilo Silva Personal Webpage home"
        , locale = Just "pt-br"
        , title = "Danilo Silva Page"
        }
        |> Seo.website


type alias Data =
    ()


terminalCursor : Element Msg
terminalCursor =
    let
        attrs =
            [ width (px 15)
            , height fill
            , Background.color Colors.green
            ]
    in
    LibElement.animatedEl LibAnimation.blink attrs none


pageFont : Attribute Msg
pageFont =
    Font.family
        [ Font.external
            { url = "https://fonts.googleapis.com/css2?family=Share+Tech+Mono&display=swap"
            , name = "Share Tech Mono"
            }
        , Font.sansSerif
        ]


menuItem : String -> String -> Element Msg
menuItem txt url =
    let
        attrs =
            [ Font.color Colors.green
            , Font.size 25
            , padding 20
            , mouseOver
                [ Font.shadow
                    { offset = ( 0, 0 )
                    , blur = 20
                    , color = Colors.white
                    }
                ]
            ]
    in
    link attrs { url = url, label = text txt }


menuView : Element Msg
menuView =
    let
        attrs =
            [ centerX
            , centerY
            ]
    in
    row attrs
        [ menuItem "about" "/about"
        , menuItem "blog" "/blog"
        , menuItem "contact" "/contact"
        ]


mainTitle : String -> Element Msg
mainTitle str =
    let
        txt =
            String.toLower str

        attrs =
            [ Font.semiBold
            , Font.letterSpacing 5
            , Font.color Colors.green
            , Region.heading 1
            , Font.size 43
            , centerX
            , centerY
            , spacing 10
            ]
    in
    row attrs [ text txt, terminalCursor ]


subtitleView : String -> Element Msg
subtitleView txt =
    let
        attrs =
            [ Font.color Colors.green
            , Font.size 17
            , centerX
            , padding 20
            ]
    in
    el attrs (text txt)


presentationCardView : Element Msg
presentationCardView =
    let
        attrs =
            [ centerX
            , centerY
            , padding 10
            , pageFont
            ]

        elements =
            [ subtitleView "Software Engineering, Functional Programming and Other Stuff"
            , mainTitle "~$ Danilo Silva"
            , menuView
            ]
    in
    column attrs elements


view :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> View Msg
view maybeUrl sharedModel static =
    { title = ""
    , body =
        presentationCardView
            |> Element.layout [ Background.color Colors.black ]
            |> List.singleton
    }
