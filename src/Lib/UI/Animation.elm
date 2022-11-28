module Lib.UI.Animation exposing (blink)

import Simple.Animation as Animation
import Simple.Animation.Property as AnimationProps


blink : Animation.Animation
blink =
    Animation.steps
        { startAt = [ AnimationProps.opacity 0 ]
        , options = [ Animation.loop ]
        }
        [ Animation.step 500 [ AnimationProps.opacity 1 ]
        , Animation.wait 400
        , Animation.step 500 [ AnimationProps.opacity 0 ]
        , Animation.wait 400
        ]
