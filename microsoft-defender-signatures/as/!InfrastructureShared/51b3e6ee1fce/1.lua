-- Threat: !InfrastructureShared
-- Name: 51b3e6ee1fce
-- Type: 21

if mp.get_sigattr_event_count(16384) > 50 then
  return mp.CLEAN
end
local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0:find("\\netwrix auditor\\active directory auditing\\", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
