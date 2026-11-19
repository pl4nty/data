-- Threat: !InfrastructureShared
-- Name: d6b3b1146a0c
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[5].utf8p2
  local l_0_1 = {
    "Wovdnut",
    "AsyncRat",
    "Donut",
    "Rugmi",
    "HeavensGate",
    "CoinMiner",
    "Shelcorid",
    "Lumma",
    "Remcos",
    "Petwosel",
    "Amadey",
    "Redline",
    "VidarStealer",
    "Quasar",
    "Samas",
    "Zegost",
    "Zusy",
    "Boilod",
    "Rebhip",
    "Nanocore",
    "RefLoad",
    "ReflectiveLoader",
    "Qadars",
    "Tofsee",
    "Netwire",
    "Khalesi",
    "Androm",
    "SnakeKeylogger",
    "Sys01Stealer",
    "RootkitDrv",
    "Fynloski",
    "Jalapeno",
    "LazyInjector",
    "Trickbot",
    "Totbrick",
    "RedLineStealz",
    "Vidar",
    "Neurevt",
    "Bladabindi",
    "Injuke",
    "EtherRpcConn",
    "Stealga"
  }
  if not contains(l_0_0, l_0_1) then
    return mp.CLEAN
  end
else
  return mp.CLEAN
end
local l_0_2
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_2 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_2 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_2 = this_sigattrlog[4].utf8p2
else
  return mp.CLEAN
end
if sysio.IsFileExists(l_0_2) and mp.IsKnownFriendlyFile(l_0_2, true, false) == false then
  bm.add_threat_file(l_0_2)
end
local l_0_3, l_0_4 = pcall(reportBmInfo)
if not l_0_3 and l_0_4 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_4), bm.RelatedStringBMReport)
end
return mp.INFECTED
