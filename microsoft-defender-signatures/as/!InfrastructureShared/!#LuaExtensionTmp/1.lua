-- Threat: !InfrastructureShared
-- Name: !#Lua:ExtensionTmp
-- Type: 13

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_1 = l_0_0:sub(-4)
if l_0_1 == ".tmp" then
  return mp.INFECTED
end
return mp.CLEAN
