-- Threat: !InfrastructureShared
-- Name: 5329017eb513
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find(".vcxproj", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
