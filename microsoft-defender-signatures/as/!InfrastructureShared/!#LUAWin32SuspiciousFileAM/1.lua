-- Threat: !InfrastructureShared
-- Name: !#LUA:Win32/SuspiciousFileAM
-- Type: 13
-- MpAttributes: pea_ismsil & pea_no_security & (pea_headerchecksum0 | Lua:MSIL.AbnormalMethod.Name) & LUA:FileSizeGT20000.A & Lua:OverSizedLnkFile

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "%.pdf%(%d%d%dkb%)%.exe") ~= nil or string.find(l_0_0, "____+%.bat") ~= nil or string.find(l_0_0, "%.trgvh%.exe") ~= nil or string.find(l_0_0, "%.ihz%.exe") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
