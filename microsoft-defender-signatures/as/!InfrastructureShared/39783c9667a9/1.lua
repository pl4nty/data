-- Threat: !InfrastructureShared
-- Name: 39783c9667a9
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "system32", 1, true) == 1 then
  return mp.CLEAN
end
if string.find(l_0_0, "program", 1, true) == 1 then
  return mp.CLEAN
end
return mp.INFECTED
