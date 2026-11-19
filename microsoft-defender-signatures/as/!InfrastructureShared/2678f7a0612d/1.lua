-- Threat: !InfrastructureShared
-- Name: 2678f7a0612d
-- Type: 21

local l_0_0 = mp.getfilesize()
if 56320 < l_0_0 and l_0_0 < 2097152 then
  return mp.INFECTED
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
if mp.get_mpattribute("pea_isdriver") then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1:find("program files", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("system32", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
