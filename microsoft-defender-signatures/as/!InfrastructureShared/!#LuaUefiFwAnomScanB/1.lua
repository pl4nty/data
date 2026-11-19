-- Threat: !InfrastructureShared
-- Name: !#Lua:UefiFwAnomScan.B
-- Type: 10
-- MpAttributes: BM_MZ_FILE & (BM_EFI_RUNTIME_DRIVER | BM_EFI_BOOT_SERVICE_DRIVER | BM_EFI_ROM) & !BM_UPX_PACKED & pea_amd64_image & pea_no_imports & pea_no_exports

local l_0_0 = mp.getfilesize()
if 5242880 < l_0_0 or l_0_0 < 3072 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if string.find(l_0_1, "CppcDxe", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_2 = mp.enum_mpattributesubstring("CMN:HSTR:UefiUtils")
local l_0_3 = false
if 0 < #l_0_2 then
  return mp.CLEAN
end
local l_0_4 = tostring(pesecs[pevars.epsec].Name)
if l_0_4 == nil then
  return mp.CLEAN
end
if l_0_4 ~= ".text" then
  mp.set_mpattribute("Lua:UefiFwAnomEntry")
  l_0_3 = true
end
if l_0_3 == true then
  return mp.INFECTED
end
return mp.CLEAN
