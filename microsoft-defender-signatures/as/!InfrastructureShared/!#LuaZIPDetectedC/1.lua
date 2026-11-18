-- Threat: !InfrastructureShared
-- Name: !#Lua:ZIPDetected.C
-- Type: 13
-- MpAttributes: BM_CONTAINER_FILE & BM_ZLIB_FILE & BM_ZLIB_FILE & BRUTE:DllFileExtStringInFooter & BRUTE:ZipFileExtStringInFooter

if mp.enum_mpattributesubstring("MpContentDetected") or mp.enum_mpattributesubstring("Detection:") or mp.enum_mpattributesubstring("MpContainerContentDetected") then
  mp.set_mpattribute("Lua:ZIPDetected.C")
  return mp.INFECTED
end
return mp.CLEAN
