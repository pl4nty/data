-- Threat: !InfrastructureShared
-- Name: !#Lua:ZIPDetected.A
-- Type: 13
-- MpAttributes: Lua:BM_ZIP_FILE | BM_CONTAINER_FILE | BM_ARCHIVE_FILE_GROUP | BM_OLE_FILE | BM_OLE_FILE_CONTAINER | BM_CAB_FILE

if mp.enum_mpattributesubstring("MpContentDetected") or mp.enum_mpattributesubstring("Detection:") or mp.enum_mpattributesubstring("MpContainerContentDetected") then
  mp.set_mpattribute("Lua:FileHasDetection")
  return mp.INFECTED
end
return mp.CLEAN
