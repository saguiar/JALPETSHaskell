{-# LANGUAGE OverloadedStrings, TypeFamilies, QuasiQuotes,
             TemplateHaskell, GADTs, FlexibleContexts,
             MultiParamTypeClasses, DeriveDataTypeable,
             GeneralizedNewtypeDeriving, ViewPatterns #-}
module Foundation where
import Yesod
import Yesod.Static
import Data.Text
import GHC.Generics
import Database.Persist.Postgresql
    ( ConnectionPool, SqlBackend, runSqlPool, runMigration )

data Sitio = Sitio {getStatic :: Static, connPool :: ConnectionPool }

--criação do campo sexo
data Sexo = M | F deriving (Generic, Read, Show)
instance ToJSON Sexo
instance FromJSON Sexo

share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|

-- Json cria instancia ToJson (p Json) e FromJson (p haskell)
Produto json
    nome Text
    preco Double
    fabricante Text
    validade Day
    UniqueNome nome --nao haver duplicidade de produtos no BD
    
Servico json
    nome Text
    preco Double
    UniqueNome nome --nao haver duplicidade de servicos no BD
    
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

staticFiles "static"
--cod do haskell ate o 63
mkYesodData "Sitio" $(parseRoutesFile "config/routes")

mkMessage "Sitio" "messages" "pt-BR"

instance YesodPersist Sitio where
   type YesodPersistBackend Sitio = SqlBackend
   runDB f = do
       master <- getYesod
       let pool = connPool master
       runSqlPool f pool

instance Yesod Sitio where
    authRoute _ = Just LoginR
    isAuthorized LoginR _ = return Authorized
    isAuthorized HomeR _ = return Authorized
    isAuthorized UsuarioR _ = isAdmin
    isAuthorized AdminR _ = isAdmin
    isAuthorized _ _ = isUser

isAdmin = do
    mu <- lookupSession "_USER"
    return $ case mu of
        Nothing -> AuthenticationRequired
        Just "admin" -> Authorized
        Just _ -> Unauthorized "Soh o admin acessa aqui!"

isUser = do
    mu <- lookupSession "_USER"
    return $ case mu of
        Nothing -> AuthenticationRequired
        Just _ -> Authorized

type Form a = Html -> MForm Handler (FormResult a, Widget)

instance RenderMessage Sitio FormMessage where
    renderMessage _ _ = defaultFormMessage

widgetForm :: Route Sitio -> Enctype -> Widget -> Text -> Widget
widgetForm x enctype widget y = $(whamletFile "templates/form.hamlet")
