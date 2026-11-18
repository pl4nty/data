-- Threat: !InfrastructureShared
-- Name: a37836ead526
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
if not mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.CLEAN
end
if mp.get_mpattribute("PEBMPAT:DamagedPE") then
  return mp.CLEAN
end
if mp.get_mpattribute("pea_no_imports") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 2000000 < l_0_0 or l_0_0 < 4000 then
  return mp.CLEAN
end
local l_0_1 = pe.get_versioninfo()
if l_0_1 ~= nil and l_0_1.OriginalFilename:find(".sys", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
