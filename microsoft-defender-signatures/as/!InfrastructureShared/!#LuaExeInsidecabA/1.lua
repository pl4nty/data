-- Threat: !InfrastructureShared
-- Name: !#Lua:ExeInsidecab.A
-- Type: 13
-- MpAttributes: Lua:BM_ZIP_FILE | BM_CONTAINER_FILE | BM_ARCHIVE_FILE_GROUP | BM_OLE_FILE | BM_OLE_FILE_CONTAINER | BM_CAB_FILE

if mp.enum_mpattributesubstring("HSTR:Win32/Obfuse.PR!MTB") then
  mp.set_mpattribute("Lua:ObfusedFile")
  return mp.INFECTED
end
return mp.CLEAN
