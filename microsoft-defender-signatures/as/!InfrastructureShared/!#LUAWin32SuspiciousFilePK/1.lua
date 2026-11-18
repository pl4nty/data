-- Threat: !InfrastructureShared
-- Name: !#LUA:Win32/SuspiciousFilePK
-- Type: 13
-- MpAttributes: pea_ismsil & pea_no_security & (pea_headerchecksum0 | Lua:MSIL.AbnormalMethod.Name)

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "_pdf_+%.exe") or string.find(l_0_0, "fuccccccccccccccccccccccccccc%.exe") or string.find(l_0_0, "confiformsyalla%.exe") then
  return mp.INFECTED
end
return mp.CLEAN
