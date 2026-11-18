-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:JS/Fauppod.SB
-- Type: 13
-- MpAttributes: RPF:JSFileHasIOAVURL

local l_0_0 = "iexplore.exe|browser_broker.exe|firefox.exe|chrome.exe|msedge.exe|opera.exe|safari.exe|microsoftedge.exe|microsoftedgecp.exe"
local l_0_1 = mp.IOAVGetDownloadUrl()
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if l_0_1 ~= "about:internet" then
  return mp.CLEAN
end
local l_0_2 = mp.IOAVGetProcessPath()
if not l_0_2 then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
local l_0_3 = l_0_2:match("([^\\]+)$")
if not string.find(l_0_0, string.lower(l_0_3), 1, true) then
  return mp.CLEAN
end
local l_0_4 = MpCommon.PathToWin32Path(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
if l_0_4 == nil then
  return mp.CLEAN
end
if l_0_4:find("\\downloads\\", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
