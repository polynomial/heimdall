import Network.DNS
import Network.DNS.Lookup
let hostname = Data.ByteString.Char8.pack "www.huugs.com"
in
  rs <- makeResolvSeed defaultResolvConf
  withResolver rs $ \resolver -> lookupA resolver hostname


