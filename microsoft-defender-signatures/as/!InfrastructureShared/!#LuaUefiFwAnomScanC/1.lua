-- Threat: !InfrastructureShared
-- Name: !#Lua:UefiFwAnomScan.C
-- Type: 10
-- MpAttributes: BM_MZ_FILE & (BM_EFI_RUNTIME_DRIVER | BM_EFI_BOOT_SERVICE_DRIVER | BM_EFI_ROM) & !BM_UPX_PACKED & pea_amd64_image & pea_no_imports & pea_no_exports

local l_0_0 = mp.getfilesize()
if 5242880 < l_0_0 or l_0_0 < 3072 then
  return mp.CLEAN
end
local l_0_1 = mp.enum_mpattributesubstring("CMN:HSTR:UefiUtils")
if 0 < #l_0_1 then
  return mp.CLEAN
end
local l_0_2 = 0
local l_0_3 = false
local l_0_4 = false
local l_0_5 = pehdr.NumberOfSections
if l_0_5 <= 0 or 10 <= l_0_5 then
  return mp.CLEAN
end
for l_0_6 = 1, l_0_5 do
  local l_0_7 = tostring(pesecs[l_0_6].Name)
  if l_0_7 == nil then
    return mp.CLEAN
  end
  local l_0_8 = pesecs[l_0_6].Characteristics
  if l_0_8 == nil then
    return mp.CLEAN
  end
  if l_0_7 == "" and mp.bitand(l_0_8, 1610612768) == 1610612768 then
    l_0_2 = l_0_2 + 1
    l_0_3 = true
  elseif l_0_7 == ".text" or l_0_7 == ".data" or l_0_7 == ".edata" or l_0_7 == ".rdata" or l_0_7 == ".idata" or l_0_7 == ".reloc" or l_0_7 == ".xdata" or l_0_7 == ".pdata" or l_0_7 == ".bss" or l_0_7 == ".rsrc" then
    l_0_4 = true
  end
end
if l_0_3 == true then
  if l_0_2 == 1 and l_0_4 then
    mp.set_mpattribute("Lua:UefiFwBlankSection")
  elseif l_0_2 < pehdr.NumberOfSections and l_0_4 then
    mp.set_mpattribute("Lua:UefiFwMultiBlankSection")
  else
    mp.set_mpattribute("Lua:UefiFwAnomSectionNames")
  end
  return mp.INFECTED
end
return mp.CLEAN
