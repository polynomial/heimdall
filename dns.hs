import Network.DNS
import Network.DNS.Lookup
import Data.ByteString.Char8
-- something about overloaded strings to read up on later:
-- http://www.haskell.org/ghc/docs/7.6.3/html/users_guide/type-class-extensions.html#overloaded-strings

main = do

let hostname = Data.ByteString.Char8.pack "www.huugs.com"
resolvSeed <- makeResolvSeed defaultResolvConf
-- makeResolvSeed :: ResolvConf -> IO ResolvSeed
-- defaultResolvConf :: ResolvConf
-- rs :: ResolvSeed



withResolver resolvSeed $ \resolver -> lookupA resolver hostname
-- withResolver :: ResolvSeed -> (Resolver -> IO a) -> IO a


-- things i learned:
-- can i replace rs:
-- Prelude Network.DNS.Lookup Network.DNS> withResolver (makeResolvSeed defaultResolvConf) $ \resolver -> lookupA resolver hostname
-- <interactive>:12:15: error:
--     • Couldn't match expected type ‘ResolvSeed’
--                   with actual type ‘IO ResolvSeed’
--     • In the first argument of ‘withResolver’, namely
--         ‘(makeResolvSeed defaultResolvConf)’
--       In the expression: withResolver (makeResolvSeed defaultResolvConf)
--       In the expression:
--         withResolver (makeResolvSeed defaultResolvConf)
--         $ \ resolver -> lookupA resolver hostname
-- the <- 'binding' removes the IO (performs it?)


