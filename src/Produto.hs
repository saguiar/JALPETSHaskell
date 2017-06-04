{0-# LANGUAGE OverloadedStrings, QuasiQuotes,
             TemplateHaskell #-}
 
module Produto where
import Yesod
import Foundation
import Control.Monad.Logger (runStdoutLoggingT)
import Control.Applicative
import Data.Text

import Database.Persist.Postgresql

--Cadastro de produto
postProdutoCadR :: Handler Value
postProdutoCadR = do
    produto <- requireJsonBody :: Handler Produto --valida o formato dos dados inseridos
    cidp <- runDB $ insert produto
    sendStatusJSON created201 (object ["resp" .= fromSqlKey cid])
    
--lista todos os produtos, faz parte da rota PRODUTOS, nao produto
getProdutoR :: Handler Value
getProdutoR = do
    produtos <- runDB $ selectList [][Asc ProdutoId]
    sendStatusJSON ok200 (object ["resp" .= produtos])   
    
    