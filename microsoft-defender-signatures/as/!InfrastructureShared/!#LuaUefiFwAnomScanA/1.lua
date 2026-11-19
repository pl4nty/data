-- Threat: !InfrastructureShared
-- Name: !#Lua:UefiFwAnomScan.A
-- Type: 10
-- MpAttributes: BM_MZ_FILE & (BM_EFI_RUNTIME_DRIVER | BM_EFI_BOOT_SERVICE_DRIVER | BM_EFI_ROM) & !BM_UPX_PACKED & pea_amd64_image & pea_no_imports & pea_no_exports

local l_0_0 = mp.getfilesize()
if 5242880 < l_0_0 or l_0_0 < 3072 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if string.find(l_0_1, "NovoSecEngine", 1, true) ~= nil then
  return mp.CLEAN
end
if string.find(l_0_1, "H19PlatformServiceSmm", 1, true) ~= nil then
  return mp.CLEAN
end
if string.find(l_0_1, "LSECore", 1, true) ~= nil then
  return mp.CLEAN
end
if string.find(l_0_1, "CryptRSA", 1, true) ~= nil then
  return mp.CLEAN
end
if string.find(l_0_1, "AbtAgent", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_2 = mp.enum_mpattributesubstring("CMN:HSTR:UefiUtils")
if 0 < #l_0_2 then
  return mp.CLEAN
end
local l_0_3 = pehdr.SizeOfHeaders
mp.readprotection(false)
local l_0_4 = mp.readfile(pehdr.SizeOfHeaders, l_0_0 - l_0_3)
mp.readprotection(true)
local l_0_5 = false
if l_0_4 ~= nil then
  if string.find(l_0_4, "PE\000\000d\134", 1, true) ~= nil or string.find(l_0_4, "PE\000\000L\001", 1, true) ~= nil or string.find(l_0_4, "!This program cannot be run in DOS mode.", 1, true) ~= nil then
    mp.set_mpattribute("Lua:UefiFwEmbExe")
    l_0_5 = true
  end
  if string.find(l_0_4, "\127ELF", 1, true) ~= nil then
    mp.set_mpattribute("Lua:UefiFwEmbElf")
    l_0_5 = true
  end
end
if l_0_5 == true then
  return mp.INFECTED
end
return mp.CLEAN
