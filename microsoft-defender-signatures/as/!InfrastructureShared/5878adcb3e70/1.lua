-- Threat: !InfrastructureShared
-- Name: 5878adcb3e70
-- Type: 21

local l_0_0 = mp.getfilesize()
if 2000000 < l_0_0 or l_0_0 < 4000 then
  return mp.CLEAN
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
if MpCommon.PathToWin32Path(mp.getfilename(mp.FILEPATH_QUERY_FULL)):lower():find("program files", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
