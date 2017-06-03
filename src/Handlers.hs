{-# LANGUAGE OverloadedStrings, QuasiQuotes,
             TemplateHaskell #-}
 
module Handlers where
import Yesod
import Foundation
import Control.Monad.Logger (runStdoutLoggingT)
import Control.Applicative
import Data.Text

import Database.Persist.Postgresql

getCadastroR :: Handler Html
getCadastroR = do
             (widget, enctype) <- generateFormPost formPessoa
             defaultLayout $ do 
                 addStylesheet $ StaticR teste_css
                 widgetForm CadastroR enctype widget "Pessoas"

getPessoaR :: PessoaId -> Handler Html
getPessoaR pid = do
             pessoa <- runDB $ get404 pid 
             dpto <- runDB $ get404 (pessoaDeptoid pessoa)
             defaultLayout [whamlet| 
                 <h1> Seja bem-vindx #{pessoaNome pessoa}
                 <p> Salario: #{pessoaSalario pessoa}
                 <p> Idade: #{pessoaIdade pessoa}
                 <p> Departamento: #{departamentoNome dpto}
             |]

getListarR :: Handler Html
getListarR = do
             listaP <- runDB $ selectList [] [Asc PessoaNome]
             defaultLayout $ do 
             [whamlet|
                 <h1> Pessoas cadastradas:
                 $forall Entity pid pessoa <- listaP
                     <a href=@{PessoaR pid}> #{pessoaNome pessoa} 
                     <form method=post action=@{PessoaR pid}> 
                         <input type="submit" value="Deletar"><br>
             |] 
             toWidget [lucius|
                form  { display:inline; }
                input { background-color: #ecc; border:0;}
             |]

postCadastroR :: Handler Html
postCadastroR = do
                ((result, _), _) <- runFormPost formPessoa
                case result of
                    FormSuccess pessoa -> do
                       runDB $ insert pessoa 
                       defaultLayout [whamlet| 
                           <h1> #{pessoaNome pessoa} Inseridx com sucesso. 
                       |]
                    _ -> redirect CadastroR

getDeptoR :: Handler Html
getDeptoR = do
             (widget, enctype) <- generateFormPost formDepto
             defaultLayout $ widgetForm DeptoR enctype widget "Departamentos"

postDeptoR :: Handler Html
postDeptoR = do
                ((result, _), _) <- runFormPost formDepto
                case result of
                    FormSuccess depto -> do
                       runDB $ insert depto
                       defaultLayout [whamlet|
                           <h1> #{departamentoNome depto} Inserido com sucesso. 
                       |]
                    _ -> redirect DeptoR

postPessoaR :: PessoaId -> Handler Html
postPessoaR pid = do
     runDB $ delete pid
     redirect ListarR