-- Threat: !InfrastructureShared
-- Name: !#LUA:O97M/CVE201711882.RUU
-- Type: 13
-- MpAttributes: SCPT:O97M/CVE201711882.RUU & BM_XML_FILE & LUA:FileSizeLE200.A

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "websettings.xml.rels", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
