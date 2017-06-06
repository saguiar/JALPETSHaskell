{-# LANGUAGE OverloadedStrings, TypeFamilies, QuasiQuotes,
             TemplateHaskell, GADTs, FlexibleContexts,
             MultiParamTypeClasses, DeriveDataTypeable,
             GeneralizedNewtypeDeriving, ViewPatterns #-}
module Foundation where
import Yesod
import Yesod.Static
import Data.Text
import Data.Time.Clock
import Data.Time.Calendar
import Database.Persist.Postgresql
    ( ConnectionPool, SqlBackend, runSqlPool, runMigration )
    
import Persistencia

data Sitio = Sitio {connPool :: ConnectionPool }

instance Yesod Sitio

share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|

-- Json cria instancia ToJson (p Json) e FromJson (p haskell)
Produto json
    nome Text
    preco Double
    fabricante Text
    validade Day
    UniqueNomeProduto nome --nao haver duplicidade de produtos no BD
    
Servico json
    nome Text
    preco Double
    UniqueNomeServico nome --nao haver duplicidade de servicos no BD
    
Cliente json
    nome Text
    telefone Text
    sexo Sexo
    email Text
    
Animal json
    nome Text
    nascimento Day
    tipo Text
    clienteId ClienteId
    
Agendamento json
     dataa UTCTime --campo com data e hora unificados
     servicoId ServicoId
     animalId AnimalId

|]

--cod do haskell ate o 65
mkYesodData "Sitio" $(parseRoutesFile "config/routes")


instance YesodPersist Sitio where
   type YesodPersistBackend Sitio = SqlBackend
   runDB f = do
       master <- getYesod
       let pool = connPool master
       runSqlPool f pool
