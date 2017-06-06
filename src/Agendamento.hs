{-# LANGUAGE OverloadedStrings, QuasiQuotes,
             TemplateHaskell #-}
 
module Agendamento where
import Yesod
import Foundation
import Control.Monad.Logger (runStdoutLoggingT)
import Control.Applicative
import qualified Data.Text as T
import Network.HTTP.Types.Status
import Data.Aeson.Types (emptyObject)
import Data.Time.Clock
import Database.Persist.Postgresql

--Cadastro de Agendamento
postAgendamentoCadR :: Handler Value
postAgendamentoCadR = do
    agendamento <- requireJsonBody :: Handler Agendamento --valida o formato dos dados inseridos
    aid <- runDB $ insert agendamento --aid agendamento id
    sendStatusJSON created201 (object ["resp" .= fromSqlKey aid])
    
--lista todos os agendamentos
getAgendamentosR :: Handler Value
getAgendamentosR = do
    agendamentos <- runDB $ selectList [][Asc AgendamentoId]
    sendStatusJSON ok200 (object ["resp" .= agendamentos])

--patch para alteracao dos agendamentos, o patch pode alterar várias linhas ao mesmo tempo, mas não as colunas, achei que seria útil pra por exemplo, atualizar todos os horários/datas dos agendamentos
patchAgendamentosR :: Handler Value
patchAgendamentosR = do
    (horarioNovo, limite) <- requireJsonBody :: Handler (NominalDiffTime, UTCTime)
    agora <- liftIO getCurrentTime
    ages <- runDB $ selectList [AgendamentoDataa >=. agora, AgendamentoDataa <. limite] []
 --         mapM_ :: Monad m => (a -> m b) -> [a] ->  m ()
 --         mapM  :: Monad m => (a -> m b) -> [a] ->  m [b]
 --         map   ::            (a ->   b) -> [a] ->    [b]
    runDB $ mapM_ (\(Entity aid age) -> update aid [AgendamentoDataa =. addUTCTime horarioNovo (agendamentoDataa age)]) ages
    sendStatusJSON noContent204 emptyObject

--get -> lista um agendamento por vez
getAgendamentoR :: AgendamentoId -> Handler Value
getAgendamentoR agendamentoId = do
    aid <- runDB $ get404 agendamentoId
    sendStatusJSON ok200 (object ["resp" .= aid])
    
--put ->alteração de um agendamento
putAgendamentoR :: AgendamentoId -> Handler Value
putAgendamentoR agendamentoId = do
    agendamento <- requireJsonBody :: Handler Agendamento
    aid <- runDB $ replace agendamentoId agendamento
    sendStatusJSON ok200 (object ["resp" .= aid])
    
--delete -> deleta um agendamento
deleteAgendamentoR :: AgendamentoId -> Handler Value
deleteAgendamentoR agendamentoId = do
    aid <- runDB $ delete agendamentoId
    sendStatusJSON noContent204 emptyObject
    
    
    