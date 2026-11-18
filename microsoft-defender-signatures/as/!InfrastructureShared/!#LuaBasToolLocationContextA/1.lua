-- Threat: !InfrastructureShared
-- Name: !#Lua:BasToolLocationContext.A
-- Type: 12
-- Includes: BasScenarioSpecificInfra, Path
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 <= 4 then
  return mp.CLEAN
end
l_0_0 = normalize_path(l_0_0)
if l_0_0 then
  local l_0_1, l_0_2 = IsBasToolLocationContext(l_0_0)
  if not l_0_1 then
    return mp.CLEAN
  end
  if l_0_2 ~= nil and 0 < #l_0_2 and l_0_2 ~= "any" then
    mp.set_mpattribute("Lua:Context/BasToolLocationContext.A!" .. l_0_2)
  end
  return mp.INFECTED
end
return mp.CLEAN
