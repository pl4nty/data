-- Threat: !InfrastructureShared
-- Name: 9078431573e0
-- Type: 21

local l_0_0 = mp.getfilesize()
if 4000000 < l_0_0 then
  return mp.CLEAN
end
if peattributes.isdll then
  return mp.CLEAN
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
if not mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1:find("program files", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("system32", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("syswow64", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("winsxs", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
