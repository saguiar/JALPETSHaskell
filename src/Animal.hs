{0-# LANGUAGE OverloadedStrings, QuasiQuotes,
             TemplateHaskell #-}
 
module Animal where
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
    
--get -> lista um animal por vez
getAnimalR :: AnimalId -> Handler Value
getAnimalR animalId = do
    anid <- runDB $ get404 animalId
    sendStatusJSON ok200 (object ["resp" .= anid])

--put ->alteração de um animal
putAnimalR :: AnimalId -> Handler Value
putAnimalR animalId = do
    anid <- runDB $ replace animalId
    sendStatusJSON ok200 (object ["resp" .= anid])
    
--FALTA FAZER A EXCLUSAO