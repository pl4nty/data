-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/FilePathExclusion.A
-- Type: 10
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
if l_0_1 == nil or #l_0_1 < 4 then
  return mp.CLEAN
end
local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
local l_0_3 = l_0_2:match("\\\\%?\\volume")
if l_0_3 ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
