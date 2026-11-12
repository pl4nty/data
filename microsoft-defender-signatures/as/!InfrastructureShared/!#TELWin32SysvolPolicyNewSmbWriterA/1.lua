-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELWin32SysvolPolicyNewSmbWriterA\1.luac 

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
local l_0_3 = function(l_1_0)
  -- function num : 0_0
  (mp.set_mpattribute)("MpInternal_researchdata=SysvolPolicyNewSmbWriterStatus=" .. l_1_0)
end

local l_0_4, l_0_5 = Infrastructure_GetSysvolFilePath()
if l_0_5 then
  l_0_3(l_0_5)
end
if not l_0_4 then
  return mp.CLEAN
end
;
(mp.set_mpattribute)("MpDisableCaching")
local l_0_6 = l_0_0 .. "\000" .. l_0_1 .. "\000" .. l_0_2
local l_0_7 = (crypto.Sha1Buffer)(l_0_6, 0, #l_0_6)
if not Infrastructure_IsNewSysvolWriter("SysvolSmbWriteHistory90d_v1", 7776000, l_0_7, "SysvolPolicyNewSmbWriterStatus") then
  return mp.CLEAN
end
local l_0_8 = l_0_4:match("\\([^\\]+)$")
if l_0_8 ~= "scheduledtasks.xml" and l_0_8 ~= "gpt.ini" then
  return mp.CLEAN
end
local l_0_9 = (crypto.Sha1Buffer)(l_0_1, 0, #l_0_1)
local l_0_10 = (crypto.Sha1Buffer)(l_0_2, 0, #l_0_2)
;
(mp.set_mpattribute)("MpInternal_researchdata=SysvolPolicyNewSmbWriter=" .. l_0_0 .. "|" .. l_0_9 .. "|" .. l_0_10 .. "|" .. l_0_8)
return mp.INFECTED

