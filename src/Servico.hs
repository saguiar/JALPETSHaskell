{-# LANGUAGE OverloadedStrings, QuasiQuotes,
             TemplateHaskell #-}
 
module Servico where
import Yesod
import Foundation
import Control.Monad.Logger (runStdoutLoggingT)
import Control.Applicative
import qualified Data.Text as T
import Network.HTTP.Types.Status
import Data.Aeson.Types
import Database.Persist.Postgresql

--Cadastro de servico
postServicoCadR :: Handler Value
postServicoCadR = do
    servico <- requireJsonBody :: Handler Servico --valida o formato dos dados inseridos
    sid <- runDB $ insert servico
    sendStatusJSON created201 (object ["resp" .= fromSqlKey sid])
    
--lista todos os servicos, faz parte da rota Servicos, nao servico
getServicosR :: Handler Value
getServicosR = do
    servicos <- runDB $ selectList [][Asc ServicoId]
    sendStatusJSON ok200 (object ["resp" .= servicos])
    
--get -> lista um servico por vez
getServicoR :: ServicoId -> Handler Value
getServicoR servicoId = do
    sid <- runDB $ get404 servicoId
    sendStatusJSON ok200 (object ["resp" .= sid])
    
--put ->alteração de um servico
putServicoR :: ServicoId -> Handler Value
putServicoR servicoId = do
    servico <- requireJsonBody :: Handler Servico
    sid <- runDB $ replace servicoId servico
    sendStatusJSON ok200 (object ["resp" .= sid])
    
--delete -> deleta um servico
deleteServicoR :: ServicoId -> Handler Value
deleteServicoR servicoId = do
    sid <- runDB $ delete servicoId
    sendStatusJSON noContent204 emptyObject