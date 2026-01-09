-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin64ZooFangEA!dha\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 1000000 then
  return mp.CLEAN
end
local l_0_1 = (pe.get_versioninfo)()
if l_0_1 == nil or l_0_1.FileDescription == nil or l_0_1.OriginalFilename == nil then
  return mp.CLEAN
end
if l_0_1.OriginalFilename ~= "usermgrproxy.dll" then
  return mp.CLEAN
end
if l_0_1.FileDescription ~= "UserMgrProxy" then
  return mp.CLEAN
end
local l_0_2, l_0_3 = (pe.get_exports)()
if l_0_2 < 8 then
  return mp.CLEAN
end
if (pe.mmap_string_rva)((l_0_3[l_0_2 - 2]).namerva, 64) ~= "AccountsMgmtVerifyExchangeMailBoxTokenAuth" then
  return mp.CLEAN
end
if (pe.mmap_string_rva)((l_0_3[l_0_2 - 3]).namerva, 64) ~= "AccountsMgmtUnadviseAccount" then
  return mp.CLEAN
end
if (pe.mmap_string_rva)((l_0_3[l_0_2 - 4]).namerva, 64) ~= "AccountsMgmtSyncAccountAndWaitForCompletion" then
  return mp.CLEAN
end
return mp.INFECTED

