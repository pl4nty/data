-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspiciousScriptFileNameSS
-- Type: 13
-- MpAttributes: (BM_TEXT_FILE | Lua:SingleFileInZip | Html_file)

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "original shipiing doc%-awb%#%d%d%d%d%d+%.pdf%.html") ~= nil or string.find(l_0_0, "202507%d%d_fp_100_%d%d+%.eml") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
