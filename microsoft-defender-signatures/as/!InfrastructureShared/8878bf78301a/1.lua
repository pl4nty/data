-- Threat: !InfrastructureShared
-- Name: 8878bf78301a
-- Type: 21

if peattributes.isdll then
  return mp.CLEAN
end
if mp.getfilesize() >= 1048576 then
  return mp.CLEAN
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
if not mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("program files", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("system32", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("syswow64", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("winsxs", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("sysvol", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
