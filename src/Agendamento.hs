{-# LANGUAGE OverloadedStrings, QuasiQuotes,
             TemplateHaskell #-}
 
module Cliente where
import Yesod
import Foundation
import Control.Monad.Logger (runStdoutLoggingT)
import Control.Applicative
import Data.Text

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
patchAgendamentosR :: undefined

--get -> lista um agendamento por vez
getAgendamentoR :: AgendamentoId -> Handler Value
getAgendamentoR agendamentoId = do
    aid <- runDB $ get404 AgendamentoId
    sendStatusJSON ok200 (object ["resp" .= aid])
    
--put ->alteração de um agendamento
putAgendamentoR :: AgendamentoId -> Handler Value
putAgendamentoR agendamentoId = do
    aid <- runDB $ replace agendamentoId
    sendStatusJSON ok200 (object ["resp" .= aid])
    
    
    
    