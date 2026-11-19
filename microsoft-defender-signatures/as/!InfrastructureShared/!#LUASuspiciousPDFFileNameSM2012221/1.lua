-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspiciousPDFFileNameSM2012221
-- Type: 13
-- MpAttributes: BM_PDF_FILE

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "summary_%d%d%d%d+_12%d%d2022.pdf") ~= nil or string.find(l_0_0, "documentsfolder_%d%d%d%d+_12%d%d2022.pdf") ~= nil or string.find(l_0_0, "erc%-%d%d%d%d+%-may3.pdf") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
