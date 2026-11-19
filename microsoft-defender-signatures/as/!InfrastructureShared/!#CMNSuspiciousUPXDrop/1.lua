-- Threat: !InfrastructureShared
-- Name: !#CMN:SuspiciousUPXDrop
-- Type: 24
-- MpAttributes: Linux:HSTR:UPX_Packed

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if string.find(l_0_0, "/tmp/", 1, true) or string.find(l_0_0, "/dev/shm/", 1, true) == 1 then
  return mp.INFECTED
end
return mp.CLEAN
