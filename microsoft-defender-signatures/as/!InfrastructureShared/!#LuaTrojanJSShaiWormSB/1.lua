-- Threat: !InfrastructureShared
-- Name: !#Lua:Trojan:JS/ShaiWorm.SB
-- Type: 13
-- Includes: BMLuaLib, LuaFuncHelper, ResearchData
-- MpAttributes: RPF:TopLevelFile & MpOnOpenOrCloseRtpScan

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil or #l_0_0 <= 10 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if l_0_0 ~= "node.exe" and l_0_0 ~= "bun.exe" then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.gsub(l_0_1, "\\", "/")
local l_0_3 = {
  ".aws/credentials",
  ".aws/config",
  "accesstokens.json",
  "msal_token_cache",
  "access_tokens.db",
  "application_default_credentials",
  ".kube/config",
  "k3s.yaml",
  "credentials.tfrc",
  ".config/helm/",
  ".ansible/",
  ".docker/config.json",
  "config.v2.json",
  ".ssh/id_rsa",
  ".ssh/id_dsa",
  ".ssh/id_ecdsa",
  ".ssh/id_ed25519",
  ".ssh/config",
  ".ssh/authorized_keys",
  ".ssh/known_hosts",
  ".ssh/keys",
  "ssh_host_",
  "git/credentials",
  ".git-credentials",
  ".env.local",
  ".env.production",
  "wp-config.php",
  "database.yml",
  "settings.py",
  "wallet.dat",
  ".ethereum/keystore",
  ".monero/",
  ".electrum/wallets",
  ".electrum-ltc/wallets",
  "exodus.wallet",
  "ledger live",
  "atomic/local storage/leveldb",
  "slack/cookies",
  "discord/local storage/leveldb",
  "element/local storage",
  "telegram-desktop",
  "telegramdesktop/tdata",
  ".purple/accounts.xml",
  "weechat/irc.conf",
  "share/keyrings/",
  "kwallet/",
  ".pki/nssdb/",
  "private internet access",
  "filezilla/recentservers.xml",
  "filezilla/sitemanager.xml",
  "remmina/",
  ".netrc"
}
if not contains(l_0_2, l_0_3) then
  return mp.CLEAN
end
local l_0_4 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
local l_0_5 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if not l_0_4 then
  return mp.CLEAN
end
if not l_0_5 then
  return mp.CLEAN
end
if not contains(l_0_4, {
  "node.exe",
  "bun",
  "bun.exe",
  "node"
}) then
  return mp.CLEAN
end
local l_0_6 = mp.GetProcessCommandLine(l_0_5)
if not l_0_6 then
  return mp.CLEAN
end
if not l_0_6:find("node.*%.m?js") and not l_0_6:find("bun.*%.m?js") then
  return mp.CLEAN
end
local l_0_7 = "ShaiWorm_SuspCredAccess"
local l_0_8 = 600
local l_0_9 = 8
local l_0_10 = 100
local l_0_11 = "|"
local l_0_12 = {}
local l_0_13 = l_0_5 .. l_0_11 .. l_0_4 .. l_0_11 .. l_0_2
local l_0_14 = GetRollingQueueKeyValues(l_0_7, l_0_13)
if l_0_14 then
  for l_0_15, l_0_16 in ipairs(l_0_14) do
    if l_0_16 and l_0_16.value == l_0_2 then
      return mp.CLEAN
    end
  end
  if l_0_9 < #l_0_14 then
    l_0_12.ShaiWormRQName = GetRollingQueueKeys(l_0_7)
    l_0_12.ShaiWormCount = GetRollingQueueCount(l_0_7)
    l_0_12 = safeJsonSerialize(l_0_12)
    set_research_data("ShaiWorm_SuspCredAccess", MpCommon.Base64Encode(l_0_12), false)
    return mp.INFECTED
  end
end
AppendToRollingQueue(l_0_7, l_0_13, l_0_2, l_0_8, l_0_10, 0)
return mp.CLEAN
