-- Threat: !InfrastructureShared
-- Name: 1f5619e0ca596
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0:find("microsoft.cyber.observationdetectors.dll", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
