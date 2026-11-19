-- Threat: !InfrastructureShared
-- Name: 8d782ae7c016
-- Type: 21

if not mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.CLEAN
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 500000 < l_0_0 or l_0_0 < 10000 then
  return mp.CLEAN
end
if MpCommon.PathToWin32Path(mp.getfilename(mp.FILEPATH_QUERY_FULL)):lower():find("program files", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
