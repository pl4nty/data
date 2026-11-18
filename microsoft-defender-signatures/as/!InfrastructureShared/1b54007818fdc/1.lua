-- Threat: !InfrastructureShared
-- Name: 1b54007818fdc
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("\\program files", 1, true) then
  return mp.CLEAN
end
mp.set_mpattribute("BM_ExchgTransportAgent")
return mp.INFECTED
