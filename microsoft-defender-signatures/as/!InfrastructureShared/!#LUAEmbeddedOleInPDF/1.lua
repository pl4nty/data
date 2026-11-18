-- Threat: !InfrastructureShared
-- Name: !#LUA:EmbeddedOleInPDF
-- Type: 13
-- MpAttributes: BM_OLE_FILE

local l_0_0 = string.lower(mp.getfilename())
if l_0_0:find("%-%>%(pdf[0-9]+%:") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
