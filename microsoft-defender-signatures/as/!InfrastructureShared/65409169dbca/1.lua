-- Threat: !InfrastructureShared
-- Name: 65409169dbca
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 then
  return mp.CLEAN
end
if mp.get_mpattribute("HSTR:AADInternalWin32Ntv") then
  return mp.CLEAN
end
return mp.INFECTED
