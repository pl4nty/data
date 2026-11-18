-- Threat: !InfrastructureShared
-- Name: !#LUA:PDF/SuspiciousFilePR
-- Type: 13
-- MpAttributes: LUA:FileSizeLE10000.A & BM_PDF_FILE

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "invoice_docs_01%-17#%d%d+%.pdf") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
