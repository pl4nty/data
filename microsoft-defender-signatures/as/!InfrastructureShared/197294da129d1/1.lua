-- Threat: !InfrastructureShared
-- Name: 197294da129d1
-- Type: 21

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if string.find(l_0_0, "document.xml") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
