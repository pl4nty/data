-- Threat: !InfrastructureShared
-- Name: 13d06fca17f6
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if string.find(l_0_0, "\\appdata\\local\\temp\\burp", 1, true) ~= nil or string.find(l_0_0, ".burp", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
