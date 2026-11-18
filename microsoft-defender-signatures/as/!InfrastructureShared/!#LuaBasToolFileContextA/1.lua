-- Threat: !InfrastructureShared
-- Name: !#Lua:BasToolFileContext.A
-- Type: 12
-- Includes: BasScenarioSpecificInfra
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1, l_0_2 = IsBasToolFilenameContext(l_0_0)
if l_0_1 then
  if l_0_2 ~= nil and 0 < #l_0_2 and l_0_2 ~= "any" then
    mp.set_mpattribute("Lua:Context/BasToolFileContext.A!" .. l_0_2)
  end
  return mp.INFECTED
end
return mp.CLEAN
