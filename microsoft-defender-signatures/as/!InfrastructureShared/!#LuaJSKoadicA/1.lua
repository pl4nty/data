-- Threat: !InfrastructureShared
-- Name: !#Lua:JS/Koadic.A
-- Type: 13
-- MpAttributes: SCRIPT:JS/Koadic.1 & SCRIPT:JS/Koadic.2 & SCRIPT:JS/Koadic.3 & RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_0 == "mshta.exe" or l_0_0 == "rundll32.exe" or l_0_0 == "regsvr32.exe" or l_0_0 == "wmic.exe" then
  return mp.INFECTED
end
return mp.CLEAN
