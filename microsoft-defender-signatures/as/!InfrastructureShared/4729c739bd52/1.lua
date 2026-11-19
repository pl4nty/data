-- Threat: !InfrastructureShared
-- Name: 4729c739bd52
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_FNAME), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "/webapp/ROOT/", 1, true) ~= nil and string.find(l_0_0, ".jsp", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
