-- Threat: !InfrastructureShared
-- Name: !#Lua:NewVolumeMounted
-- Type: 32
-- Includes: LuaFuncHelper

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMOUNT then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_1:find("harddiskvolume", 1, true) then
  AppendToRollingQueueNamespaced("NewVolumeMounted", "Volumes", "volume", l_0_1, 120)
end
return mp.CLEAN
