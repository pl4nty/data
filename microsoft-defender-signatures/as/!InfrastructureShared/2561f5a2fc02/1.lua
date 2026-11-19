-- Threat: !InfrastructureShared
-- Name: 2561f5a2fc02
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
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1:find("metasploit", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
