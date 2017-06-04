{0-# LANGUAGE OverloadedStrings, QuasiQuotes,
             TemplateHaskell #-}
 
module Servico where
import Yesod
import Foundation
import Control.Monad.Logger (runStdoutLoggingT)
import Control.Applicative
import Data.Text

import Database.Persist.Postgresql

--Cadastro de servico
postServicoCadR :: Handler Value
postServicoCadR = do
    servico <- requireJsonBody :: Handler Servico --valida o formato dos dados inseridos
    sid <- runDB $ insert servico
    sendStatusJSON created201 (object ["resp" .= fromSqlKey sid])

