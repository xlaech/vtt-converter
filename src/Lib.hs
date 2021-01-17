module Lib
    ( VttFile
    ) where

import Data.Map

data VttFile          = VttFile VttHeader 
                                (Map VttSectionId VttSection)
data VttHeader        = VttHeader [VttNote]
data VttSection       = VttSection VttTiming 
                                   [VttPosition]
                                   [VttSubtitleLine]
data VttPosition      = VttPosition VttPositionKey VttPositionKey VttPositionValue
data VttSubtitleLine  = VttSubtitleLine [VttSubtitleEntry]
data VttSubtitleEntry = VttSubText String
                      | VttContainer VttContainerType [VttSubtitleEntry]

type VttTiming        = String
type VttSectionId     = Int
type VttContainerType = String
type VttPositionKey   = String
type VttPositionValue = String
type VttNote          = String