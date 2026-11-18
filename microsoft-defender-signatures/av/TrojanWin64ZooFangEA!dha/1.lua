-- Threat: Trojan:Win64/ZooFang.EA!dha
-- Type: 10
-- MpAttributes: RPF:TopLevelFile & BM_MZ_DLL & BM_UnsignedDll & pea_hasexports

local l_0_0 = mp.getfilesize()
if 1000000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = pe.get_versioninfo()
if l_0_1 == nil or l_0_1.FileDescription == nil or l_0_1.OriginalFilename == nil then
  return mp.CLEAN
end
if l_0_1.OriginalFilename ~= "usermgrproxy.dll" then
  return mp.CLEAN
end
if l_0_1.FileDescription ~= "UserMgrProxy" then
  return mp.CLEAN
end
local l_0_2, l_0_3 = pe.get_exports()
if l_0_2 < 8 then
  return mp.CLEAN
end
local l_0_4 = pe.mmap_string_rva(l_0_3[l_0_2 - 2].namerva, 64)
if l_0_4 ~= "AccountsMgmtVerifyExchangeMailBoxTokenAuth" then
  return mp.CLEAN
end
l_0_4 = pe.mmap_string_rva(l_0_3[l_0_2 - 3].namerva, 64)
if l_0_4 ~= "AccountsMgmtUnadviseAccount" then
  return mp.CLEAN
end
l_0_4 = pe.mmap_string_rva(l_0_3[l_0_2 - 4].namerva, 64)
if l_0_4 ~= "AccountsMgmtSyncAccountAndWaitForCompletion" then
  return mp.CLEAN
end
return mp.INFECTED
