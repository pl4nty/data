-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspiciousScriptFileNameH
-- Type: 13
-- MpAttributes: (BM_TEXT_FILE | BM_UNKNOWN_FILE | Lua:SingleFileInZip | Html_file)

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if mp.getfilesize() > 1048576 then
  return mp.CLEAN
end
if string.find(l_0_0, "compliancereportcopy#%d%d%d%d%.html") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
