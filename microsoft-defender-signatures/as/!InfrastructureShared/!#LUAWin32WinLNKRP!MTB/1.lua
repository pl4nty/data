-- Threat: !InfrastructureShared
-- Name: !#LUA:Win32/WinLNK.RP!MTB
-- Type: 13
-- MpAttributes: BM_LNK_FILE

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 or mp.getfilesize() > 8192 then
  return mp.CLEAN
end
if string.find(l_0_0, "anexo %- %d%d%d%d%d+%.lnk") ~= nil or string.find(l_0_0, "dettagli%-%d%d%d+%.lnk") ~= nil or string.find(l_0_0, "cxxv_%d%d%d+%.lnk") ~= nil or string.find(l_0_0, "doc%-%d%d%d+%.lnk") ~= nil or string.find(l_0_0, "scanned_%d%d%d%d%d+%.pdf") ~= nil or string.find(l_0_0, "crmreport_%d%d%d%d+%.lnk") ~= nil or string.find(l_0_0, "august_%d%d%d%d_pdf%.iso") ~= nil or string.find(l_0_0, "inv_%d%d%d_jan%-%d%d_copy%.iso$") ~= nil or string.find(l_0_0, "ref_scan_%d%d%-%d%d%.lnk$") ~= nil or string.find(l_0_0, "curriculo.lnk", 1, true) ~= nil or string.find(l_0_0, "comprovante.lnk", 1, true) ~= nil or string.find(l_0_0, "stolenimages_evidence.iso-documents.lnk.bin", 1, true) ~= nil or string.find(l_0_0, "roshan-bandara_cv_dialog.lnk", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
