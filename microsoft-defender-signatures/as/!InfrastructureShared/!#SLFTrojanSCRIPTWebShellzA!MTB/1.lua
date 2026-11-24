-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:SCRIPT/WebShellz.A!MTB
-- Type: 13
-- MpAttributes: ObMpAttributes

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
if type(l_0_1) ~= "string" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if not string.find(l_0_1, "artex", 1, true) and not string.find(l_0_1, "artx", 1, true) then
  return mp.CLEAN
end
if not mp.get_mpattributesubstring("WebShell") then
  return mp.CLEAN
end
return mp.INFECTED
