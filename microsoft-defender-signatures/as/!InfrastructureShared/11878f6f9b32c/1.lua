-- Threat: !InfrastructureShared
-- Name: 11878f6f9b32c
-- Type: 21

if mp.get_mpattribute("CMN:HSTR:InstallerFile") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 2500000 < l_0_0 or l_0_0 < 4000 then
  return mp.CLEAN
end
return mp.INFECTED
