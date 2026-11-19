-- Threat: !InfrastructureShared
-- Name: !#Lua:CeeInject_MyAppChecking
-- Type: 10
-- MpAttributes: Suspicious:CraftedPE_Import | SIGATTR:Win32/FileException

if mp.getfilesize() > 512000 then
  return mp.CLEAN
end
if peattributes.headerchecksum0 ~= true then
  return mp.CLEAN
end
local l_0_0 = pesecs[3]
if pesecs[2].SizeOfRawData > 8192 then
  return mp.CLEAN
end
if l_0_0.Name:sub(2) ~= "data" and l_0_0.SizeOfRawData == 4096 and 8192 >= l_0_0.VirtualSize and l_0_0.VirtualAddress >= 20480 and l_0_0.VirtualAddress <= 36864 then
  return mp.CLEAN
end
local l_0_1 = pe.query_import
if 0 == l_0_1(pe.IMPORT_STATIC, 4288984855) then
  return mp.CLEAN
end
if 0 == l_0_1(pe.IMPORT_STATIC, 3419395426) and 0 == l_0_1(pe.IMPORT_STATIC, 1058758707) then
  return mp.CLEAN
end
if 0 == l_0_1(pe.IMPORT_STATIC, 1881577768) then
  return mp.CLEAN
end
if 0 == l_0_1(pe.IMPORT_STATIC, 2560256095) then
  return mp.CLEAN
end
if 0 == l_0_1(pe.IMPORT_STATIC, 1256947212) then
  return mp.CLEAN
end
if 0 == l_0_1(pe.IMPORT_STATIC, 453198482) then
  return mp.CLEAN
end
if 0 == l_0_1(pe.IMPORT_STATIC, 133826329) then
  return mp.CLEAN
end
local l_0_2 = pesecs[3].VirtualAddress + pehdr.ImageBase
if 4294967295 == pe.vm_search(l_0_2, l_0_2 + 2048, "\000r\000b\000\000\000\000\144\000", nil, pe.VM_SEARCH_BM) then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_3 = mp.readfile(mp.bitand(l_0_0.PointerToRawData + 2048, 4294967040), 2048)
local l_0_4 = mp.crc32(-1, l_0_3, 1, 0)
if l_0_4 ~= 236406113 then
  return mp.CLEAN
end
return mp.INFECTED
