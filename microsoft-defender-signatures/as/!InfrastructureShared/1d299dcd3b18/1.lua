-- Threat: !InfrastructureShared
-- Name: 1d299dcd3b18
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("\\program files", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("\\installer", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
