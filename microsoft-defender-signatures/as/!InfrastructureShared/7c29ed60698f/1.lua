-- Threat: !InfrastructureShared
-- Name: 7c29ed60698f
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if string.find(l_0_0, ".js", -3, true) or string.find(l_0_0, ".cjs", -4, true) or string.find(l_0_0, ".ts", -3, true) then
  return mp.INFECTED
end
return mp.CLEAN
