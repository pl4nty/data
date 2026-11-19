-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:JS/FakeUpdate.SZ
-- Type: 13
-- MpAttributes: (MpIsVBScriptAMSIScan | MpIsJScriptAMSIScan)

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_0 ~= "cscript.exe" and l_0_0 ~= "wscript.exe " then
  return mp.CLEAN
end
local l_0_1 = ""
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_2 == mp.SCANREASON_AMSI then
  local l_0_3, l_0_4 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
  if l_0_3 and l_0_4 ~= nil then
    l_0_1 = string.lower(l_0_4)
  end
end
l_0_1 = MpCommon.PathToWin32Path(l_0_1)
local l_0_5, l_0_6 = mp.GetMotwZoneForFile(l_0_1)
local l_0_7, l_0_8 = mp.GetMotwHostUrlForFile(l_0_1)
if not l_0_1 then
  return mp.CLEAN
end
if not l_0_8 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
l_0_8 = string.lower(l_0_8)
if l_0_6 ~= 3 then
  return mp.CLEAN
end
if l_0_8 ~= "about:internet" then
  return mp.CLEAN
end
if not l_0_1:find("\\downloads\\", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
