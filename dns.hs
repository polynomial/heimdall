import Network.DNS
import Network.DNS.Lookup
import Data.ByteString.Char8
main = do
let hostname = Data.ByteString.Char8.pack "www.huugs.com"
rs <- makeResolvSeed defaultResolvConf
withResolver rs $ \resolver -> lookupA resolver hostname


