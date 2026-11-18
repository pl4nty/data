-- Threat: !InfrastructureShared
-- Name: 1327630e6bcd
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_FNAME), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
if string.match(l_0_0, "extensions") ~= nil or string.match(l_0_0, "temp") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
