-- Threat: !InfrastructureShared
-- Name: 31290595a159
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 and string.find(l_0_0, "/.config/.smt", -13, true) then
  return mp.INFECTED
end
return mp.CLEAN
