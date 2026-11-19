-- Threat: !InfrastructureShared
-- Name: 1b278b0460a41
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("\\windows\\system32\\ime\\", 1, true) then
  return mp.INFECTED
end
if l_0_0:find("\\loadertest", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
