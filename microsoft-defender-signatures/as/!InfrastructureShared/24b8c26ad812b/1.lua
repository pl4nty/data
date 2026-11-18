-- Threat: !InfrastructureShared
-- Name: 24b8c26ad812b
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" or string.find(l_0_0, "/ism_ux_", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
