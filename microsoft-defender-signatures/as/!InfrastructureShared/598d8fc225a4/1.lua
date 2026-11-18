-- Threat: !InfrastructureShared
-- Name: 598d8fc225a4
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 < 5 then
  return mp.CLEAN
end
local l_0_1 = mp.GetCertificateInfo()
if (#l_0_1 < 1 or l_0_1 == nil) and (string.find(l_0_0, "/users/shared/", 1, true) == 1 or string.find(l_0_0, "/private/tmp/", 1, true) == 1) then
  return mp.INFECTED
end
return mp.CLEAN
