module Persistencia where

import Data.Aeson
import Yesod
import GHC.Generics

--criação do campo sexo
data Sexo = M | F deriving (Read, Show, Generic) -- na tentativa de dar o stack build, ele disse que não poderia fazer a instancia de generic sexo, e que precisaria de DERIVEGENERIC to derive an instance for this class
instance ToJSON Sexo
instance FromJSON Sexo
derivePersistField "Sexo"