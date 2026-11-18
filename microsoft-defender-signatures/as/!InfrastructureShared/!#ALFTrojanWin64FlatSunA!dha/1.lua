-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win64/FlatSun.A!dha
-- Type: 10
-- MpAttributes: BM_MZ_DLL & LUA:FileSizeLE4M.B & pea_headerchecksum0

if not mp.get_mpattribute("Lua:FnameAttr!radcui.dll") then
  return mp.CLEAN
end
if mp.get_mpattribute("Lua:FirstFolder1!windows") then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 7 or pe.foffset_rva(4096) ~= 1024 then
  return mp.CLEAN
end
if mp.getfilename(mp.FILEPATH_QUERY_FNAME) ~= "radcui.dll" then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pe.get_imports()
if 110 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
