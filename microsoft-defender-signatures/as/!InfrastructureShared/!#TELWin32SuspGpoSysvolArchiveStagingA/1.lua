-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELWin32SuspGpoSysvolArchiveStagingA\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_ID) ~= 4 then
  return mp.CLEAN
end
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_REMOTE_SESSION_IP)
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_REMOTE_SESSION_DOMAINNAME)
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_REMOTE_SESSION_USERNAME)
if type(l_0_0) ~= "string" or l_0_0 == "" or type(l_0_1) ~= "string" or l_0_1 == "" or type(l_0_2) ~= "string" or l_0_2 == "" or l_0_2 == "-" then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if l_0_1 == "nt authority" and l_0_2 == "anonymous logon" then
  return mp.CLEAN
end
local l_0_3, l_0_4, l_0_5 = Infrastructure_GetSysvolFilePath()
if l_0_4 then
  (mp.set_mpattribute)("MpInternal_researchdata=SysvolArchiveStagingStatus=" .. l_0_4)
end
if not l_0_3 or not l_0_5 or l_0_3:find(":", 3, true) then
  return mp.CLEAN
end
local l_0_6 = l_0_3:match("%.([%w]+)$")
local l_0_7 = {}
l_0_7.zip = true
l_0_7["7z"] = true
l_0_7.rar = true
l_0_7.cab = true
l_0_7.tar = true
l_0_7.gz = true
l_0_7.iso = true
if not l_0_7[l_0_6] then
  return mp.CLEAN
end
local l_0_8 = Infrastructure_GetSysvolGpoGuid(l_0_5)
if not l_0_8 then
  return mp.CLEAN
end
;
(mp.set_mpattribute)("MpDisableCaching")
local l_0_9 = (crypto.Sha1Buffer)(l_0_1, 0, #l_0_1)
local l_0_10 = (crypto.Sha1Buffer)(l_0_2, 0, #l_0_2)
local l_0_11 = (crypto.Sha1Buffer)(l_0_3, 0, #l_0_3)
;
(mp.set_mpattribute)("MpInternal_researchdata=SysvolArchiveStaging=" .. l_0_0 .. "|" .. l_0_9 .. "|" .. l_0_10 .. "|" .. l_0_8 .. "|" .. l_0_6 .. "|" .. l_0_11)
return mp.INFECTED

