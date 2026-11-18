-- Threat: !InfrastructureShared
-- Name: 16678d88afb6d
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 1000000 < l_0_0 or l_0_0 < 4000 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1:find("\\program files", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("\\system32", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
