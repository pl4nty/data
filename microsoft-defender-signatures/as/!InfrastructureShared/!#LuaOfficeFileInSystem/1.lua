-- Threat: !InfrastructureShared
-- Name: !#Lua:OfficeFileInSystem
-- Type: 13
-- MpAttributes: BM_OFFICE_FILE | BM_OLE_FILE

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
if string.find(l_0_0, ":\\windows\\system32\\", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
