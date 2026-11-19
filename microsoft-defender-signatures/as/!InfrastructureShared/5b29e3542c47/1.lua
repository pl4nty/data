-- Threat: !InfrastructureShared
-- Name: 5b29e3542c47
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_FNAME), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(string.lower(l_0_0), "\\appdata\\local\\programs\\resources\\", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
