-- Threat: !InfrastructureShared
-- Name: !#LUA:O97M/SuspiciousFile
-- Type: 13
-- MpAttributes: BM_OFFICE_FILE | BM_OLE_FILE

local l_0_0 = string.lower(mp.getfilename())
if l_0_0 == nil or string.len(l_0_0) <= 5 and mp.getfilesize() > 28672 then
  return mp.CLEAN
end
if string.find(l_0_0, "virusshare_[%x]+", 1) ~= nil or string.find(l_0_0, "deliveryo%d%dss.xls") ~= nil or string.find(l_0_0, "%d%d%.%d%d%.2021_siparisler%.doc") ~= nil or string.find(l_0_0, "factur\196\131 .docx", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
