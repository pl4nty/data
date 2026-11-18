-- Threat: !InfrastructureShared
-- Name: 34e8dd02d580a
-- Type: 21

if not mp.get_mpattribute("Lua:ZIPExt") and not mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 800000 < l_0_0 or l_0_0 < 4000 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1:find("\\usr\\lib\\system", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("/usr/lib/system", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("\\libiphoneaccess", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("backup", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("recovery", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("restore", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("iosdevicemanagerex", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
