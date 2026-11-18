-- Threat: !InfrastructureShared
-- Name: 6b08cbc5df41d
-- Type: 21

if not mp.get_mpattribute("AndroidOS:HSTR:AndroidElf") then
  return mp.CLEAN
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
if mp.get_mpattribute("CMN:HSTR:InstallerFile") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 700000 < l_0_0 or l_0_0 < 4000 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1:find("adbcopy", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("libbaiduzeus", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("libmiui", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("liboctvm", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("getdbfile", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("\\atcid", 1, true) then
  return mp.CLEAN
end
local l_0_2 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2:find("root", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
