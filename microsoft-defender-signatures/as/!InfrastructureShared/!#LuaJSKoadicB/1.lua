-- Threat: !InfrastructureShared
-- Name: !#Lua:JS/Koadic.B
-- Type: 13
-- MpAttributes: SLFPER:JS/Koadic.C

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE and l_0_0 ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_1 == "mshta.exe" or l_0_1 == "rundll32.exe" or l_0_1 == "regsvr32.exe" or l_0_1 == "wmic.exe" then
  return mp.INFECTED
end
return mp.CLEAN
