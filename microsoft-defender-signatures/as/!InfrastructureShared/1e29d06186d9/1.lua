-- Threat: !InfrastructureShared
-- Name: 1e29d06186d9
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("exploitdb", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("kali", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
