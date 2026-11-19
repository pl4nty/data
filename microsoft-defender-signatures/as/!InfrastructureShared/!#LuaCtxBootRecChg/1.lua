-- Threat: !InfrastructureShared
-- Name: !#Lua:CtxBootRecChg
-- Type: 13

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
l_0_1 = (l_0_1 == nil and "" or l_0_1):lower()
local l_0_2 = mp.GetResmgrBasePlugin()
l_0_2 = (l_0_2 == nil and "" or l_0_2):lower()
if l_0_1 ~= "boot://" and l_0_2 ~= "boot" then
  return mp.CLEAN
end
return mp.INFECTED
