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
    