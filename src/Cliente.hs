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
putClienteR :: ClienteId -> Handler Value
putClienteR clienteId = do
    cid <- runDB $ replace clienteId
    sendStatusJSON ok200 (object ["resp" .= cid])


--delete -> deleta um cliente
deleteClienteR :: ClienteId -> Handler Value
deleteClienteR clienteId = do
    cid <- runDB $ delete clienteId
    sendStatusJSON ok200 (object ["resp" .= cid])
    
    --modelo do prof pra exclusao, nao tenho certeza do que significa e pq esta diferente dos outros, entao achei melhor comentar
    --cid <- runDB $ get404 clienteId NÃO TENHO CERTEZA QUE ESSA LINHA É NECESSARIA
    --runDB $ delete clienteId NÃO TENHO CERTEZA SE É ASSIM A SINTAXE
    --sendStatusJSON noContent204 (object ["resp" .= ("DELETED " ++ show (fromSqlKey aid))]) NÃO TENHO CTZ TB
