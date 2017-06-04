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
    pid <- runDB $ insert produto
    sendStatusJSON created201 (object ["resp" .= fromSqlKey pid])
    
--lista todos os produtos, faz parte da rota PRODUTOS, nao produto
getProdutoR :: Handler Value
getProdutoR = do
    produtos <- runDB $ selectList [][Asc ProdutoId]
    sendStatusJSON ok200 (object ["resp" .= produtos])  
    
--get -> lista um produto por vez
getProdutoR :: ProdutoId -> Handler Value
getProdutoR produtoId = do
    pid <- runDB $ get404 produtoId
    sendStatusJSON ok200 (object ["resp" .= pid])
    
--put ->alteração de um produto
putProdutoR :: ProdutoId -> Handler Value
putProdutoR produtoId = do
    pid <- runDB $ replace produtoId
    sendStatusJSON ok200 (object ["resp" .= pid])
    
--delete -> deleta um produto
deleteProdutoR :: ProdutoR -> Handler Value
deleteProdutoR produtoR = do
    pid <- runDB $ delete produtoR
    sendStatusJSON noContent204 (object ["resp" .= pid])
