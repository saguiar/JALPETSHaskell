{-# LANGUAGE OverloadedStrings, QuasiQuotes,
             TemplateHaskell #-}
 
module Cliente where
import Yesod
import Foundation
import Control.Monad.Logger (runStdoutLoggingT)
import Control.Applicative
import Data.Text

import Database.Persist.Postgresql

--Cadastro de cliente
postClienteCadR :: Handler Value
postClienteCadR = do
    cliente <- requireJsonBody :: Handler Cliente --valida o formato dos dados inseridos
    cid <- runDB $ insert cliente
    sendStatusJSON created201 (object ["resp" .= fromSqlKey cid])
    
--lista todos os clientes
getClientesR :: Handler Value
getClientesR cId = do
    clientes <- runDB $ selectList [][Asc ClienteId]
    sendStatusJSON ok200 (object ["resp" .= clientes])
    


