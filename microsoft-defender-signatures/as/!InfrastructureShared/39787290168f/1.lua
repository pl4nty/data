-- Threat: !InfrastructureShared
-- Name: 39787290168f
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("program files", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("system32", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
