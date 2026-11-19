-- Threat: !InfrastructureShared
-- Name: !#LUA:Script/PotentialWebShellExension
-- Type: 13

local l_0_0 = string.lower(mp.getfilename(mp.FILEPATH_QUERY_FNAME))
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0:sub(-4)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {
  aspx = mp.INFECTED
}
if l_0_2[l_0_1] == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
