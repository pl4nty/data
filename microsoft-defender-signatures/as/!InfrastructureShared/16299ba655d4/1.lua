-- Threat: !InfrastructureShared
-- Name: 16299ba655d4
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("com.atlassian.applinks.", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
