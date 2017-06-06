{-# LANGUAGE OverloadedStrings, QuasiQuotes,
             TemplateHaskell, ViewPatterns #-}
 
module Application where
import Foundation
import Yesod
import Animal
import Cliente
import Produto
import Servico
import Agendamento

-- Application
mkYesodDispatch "Sitio" resourcesSitio
