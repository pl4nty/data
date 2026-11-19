-- Threat: !InfrastructureShared
-- Name: c87867c4e1f0
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
if mp.get_mpattribute("pea_ismsil") then
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
return mp.INFECTED
