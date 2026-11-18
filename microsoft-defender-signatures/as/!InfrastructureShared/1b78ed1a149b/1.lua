-- Threat: !InfrastructureShared
-- Name: 1b78ed1a149b
-- Type: 21

if not mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.CLEAN
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
if mp.get_mpattribute("pea_isdriver") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 400000 < l_0_0 or l_0_0 < 10000 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1:find("program files", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
