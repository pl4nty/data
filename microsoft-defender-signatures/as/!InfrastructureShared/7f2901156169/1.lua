-- Threat: !InfrastructureShared
-- Name: 7f2901156169
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= nil and l_0_0 ~= "" and string.find(l_0_0, ".py", -3, true) then
  return mp.INFECTED
end
return mp.CLEAN
