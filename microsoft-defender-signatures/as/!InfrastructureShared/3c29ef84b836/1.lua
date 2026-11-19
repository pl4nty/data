-- Threat: !InfrastructureShared
-- Name: 3c29ef84b836
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 35000 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1:find("messages", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
