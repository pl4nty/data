-- Threat: !InfrastructureShared
-- Name: 1057872cfdfc0
-- Type: 21

if mp.get_mpattribute("CMN:HSTR:InstallerFile") then
  return mp.CLEAN
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
if mp.get_mpattribute("pea_ismsil") then
  return mp.CLEAN
end
if mp.get_mpattribute("pea_isdriver") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 4000000 < l_0_0 or l_0_0 < 4000 then
  return mp.CLEAN
end
local l_0_1 = MpCommon.PathToWin32Path(mp.getfilename(mp.FILEPATH_QUERY_FULL)):lower()
if l_0_1:find("program files", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("system32", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("syswow64", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("winu.dll", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("win32u.dll", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("dcompfuzzer", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
