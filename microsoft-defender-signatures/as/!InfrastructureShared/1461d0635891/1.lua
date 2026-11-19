-- Threat: !InfrastructureShared
-- Name: 1461d0635891
-- Type: 21

if mp.get_mpattribute("CMN:HSTR:InstallerFile") then
  return mp.CLEAN
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
if mp.get_mpattribute("pea_isdriver") then
  return mp.CLEAN
end
if mp.get_mpattribute("pea_no_imports") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 2000000 < l_0_0 or l_0_0 < 4000 then
  return mp.CLEAN
end
return mp.INFECTED
