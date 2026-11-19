-- Threat: !InfrastructureShared
-- Name: 858c1d86315c
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("mroot", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("temproot", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("-root", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
