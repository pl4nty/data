-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspiciousPasswordProtectedDocNames
-- Type: 13
-- MpAttributes: BM_OLE_FILE & O97/PasswordProtectedOfficeDocument.A

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
local l_0_1 = mp.getfilesize()
if l_0_1 < 65536 and 1048576 < l_0_1 then
  return mp.CLEAN
end
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "inv_2022%d%d%d%d december soa%.xlsx") ~= nil or string.find(l_0_0, "rfq%-%d%d%d%d%d%d%.xlsx") ~= nil or string.find(l_0_0, "2022%- %d%.xlsx") ~= nil or string.find(l_0_0, "xvs022%-%d%d%d%d22%.xlsx") ~= nil or string.find(l_0_0, "po no a%d%d%d%-%d%d%d%.xlsx") ~= nil or string.find(l_0_0, "fob_ship doc_haiphong %d%d%d%d+hq_%.xlsx") ~= nil or string.find(l_0_0, "202201%d%d%d%d%d%d%d%d+%.xlsx") ~= nil or string.find(l_0_0, "inv %d%d%d z%&z intimates %(%d%d%d+2021%)%.xlsx") ~= nil or string.find(l_0_0, "lod4.xlsx", 1, true) ~= nil or string.find(l_0_0, "myung in quotation request.xlsx", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
