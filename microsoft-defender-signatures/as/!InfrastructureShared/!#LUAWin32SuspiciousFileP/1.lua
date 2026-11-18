-- Threat: !InfrastructureShared
-- Name: !#LUA:Win32/SuspiciousFileP
-- Type: 13
-- MpAttributes: pea_ismsil & pea_no_security & (pea_headerchecksum0 | Lua:MSIL.AbnormalMethod.Name) & LUA:FileSizeGT20000.A & Lua:OverSizedLnkFile

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "-xlsx.zip", 1, true) or string.find(l_0_0, "-doc.gz", 1, true) or string.find(l_0_0, "%.pdf___+%.bat") or string.find(l_0_0, "%.pdf_+%.gz") or string.find(l_0_0, "%.xlsx_____+%.r13") or string.find(l_0_0, ",jpg.exe") or string.find(l_0_0, "-pdf%-.exe") or string.find(l_0_0, "confiformsyalla%.exe") then
  return mp.INFECTED
end
return mp.CLEAN
