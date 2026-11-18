-- Threat: !InfrastructureShared
-- Name: !#Lua:FromExcelExtFile
-- Type: 13
-- MpAttributes: BM_OLE_FILE

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("Lua:ExcelExt", true)
if l_0_0 ~= 0 or not l_0_1 then
  return mp.CLEAN
end
return mp.INFECTED
