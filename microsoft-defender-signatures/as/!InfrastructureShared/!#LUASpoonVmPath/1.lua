-- Threat: !InfrastructureShared
-- Name: !#LUA:SpoonVmPath
-- Type: 10

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if string.find(l_0_0, "\\spoon\\sandbox\\", 1, true) ~= nil or string.find(l_0_0, "\\xenocode\\sandbox\\", 1, true) ~= nil or string.find(l_0_0, "\\local\\stubexe\\", 1, true) ~= nil then
  mp.set_mpattribute("LUA:SpoonVmPath")
end
return mp.CLEAN
