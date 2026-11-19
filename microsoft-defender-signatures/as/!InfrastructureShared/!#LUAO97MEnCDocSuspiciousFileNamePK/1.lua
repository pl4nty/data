-- Threat: !InfrastructureShared
-- Name: !#LUA:O97M/EnCDocSuspiciousFileNamePK
-- Type: 13
-- MpAttributes: BM_TEXT_FILE & LUA:FileSizeGT80000.A

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "cts_complaints_202201%d%d%d%d+_details_pdf%.js") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
