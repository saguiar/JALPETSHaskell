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
getClientesR = do
    clientes <- runDB $ selectList [][Asc ClienteId]
    sendStatusJSON ok200 (object ["resp" .= clientes])
    
--get -> lista um cliente por vez
getClienteR :: ClienteId -> Handler Value
getClienteR clienteId = do
    cid <- runDB $ get404 clienteId
    sendStatusJSON ok200 (object ["resp" .= cid])
    



--put ->alteração de um cliente

--delete -> deleta um cliente


