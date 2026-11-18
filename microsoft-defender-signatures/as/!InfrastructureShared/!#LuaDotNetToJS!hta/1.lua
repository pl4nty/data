-- Threat: !InfrastructureShared
-- Name: !#Lua:DotNetToJS!hta
-- Type: 13
-- MpAttributes: SLF:B64StreamInvoke.A & RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE and l_0_0 ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_1 == "mshta.exe" then
  return mp.INFECTED
end
return mp.CLEAN
