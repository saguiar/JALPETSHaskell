3
0
,{0-# LANGUAGE OverloadedStrings, QuasiQuotes,
             TemplateHaskell #-}
 
module Cliente where
import Yesod
import Foundation
import Control.Monad.Logger (runStdoutLoggingT)
import Control.Applicative
import Data.Text

import Database.Persist.Postgresql

--Cadastro de Animal
postAnimalCadR :: Handler Value
postAnimalCadR = do
    animal <- requireJsonBody :: Handler Animal --valida o formato dos dados inseridos
    anid <- runDB $ insert animal
    sendStatusJSON created201 (object ["resp" .= fromSqlKey anid])
    
-lista todos os animais, faz parte da rota ANIMAIS, nao animal
getAnimaisR :: Handler Value
getAnimaisR = do
    animais <- runDB $ selectList [][Asc AnimalId]
    sendStatusJSON ok200 (object ["resp" .= animais])
    
