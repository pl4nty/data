-- Threat: !InfrastructureShared
-- Name: f07871c2ce25
-- Type: 21

local l_0_0 = mp.getfilesize()
if not peattributes.isdll then
  return mp.CLEAN
end
if 1000000 < l_0_0 then
  return mp.CLEAN
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
local l_0_1 = MpCommon.PathToWin32Path(mp.getfilename(mp.FILEPATH_QUERY_FULL)):lower()
if l_0_1:find("\\program files", 1, true) or l_0_1:find("\\windows\\", 1, true) or l_0_1:find("\\system32\\", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
