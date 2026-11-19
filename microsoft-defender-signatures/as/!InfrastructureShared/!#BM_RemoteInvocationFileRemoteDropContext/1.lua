-- Threat: !InfrastructureShared
-- Name: !#BM_RemoteInvocation:FileRemoteDropContext
-- Type: 11
-- Includes: LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & MpNewlyCreatedHint & MpOnModifiedCloseRtpScan

local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_REMOTE_SESSION_IP)
if not (l_0_0 and l_0_1) or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_ID)
if not l_0_2 or 12 <= l_0_2 then
  return mp.CLEAN
end
local l_0_3 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)) or ""
local l_0_4 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID) or ""
if l_0_3 == "" or l_0_4 == "" then
  return mp.CLEAN
end
local l_0_5, l_0_6 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_REMOTE_SESSION_DOMAINNAME)
local l_0_7, l_0_8 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_REMOTE_SESSION_USERNAME)
if not (l_0_5 and l_0_6 and l_0_6 ~= "" and l_0_7 and l_0_8) or l_0_8 == "" then
  return mp.CLEAN
end
if mp.IsTrustedFile(false) == true then
  return mp.CLEAN
end
local l_0_9 = l_0_1 .. "|" .. crypto.Sha1Buffer(l_0_6, 0, #l_0_6) .. "|" .. crypto.Sha1Buffer(l_0_8, 0, #l_0_8)
local l_0_10 = MpCommon.Base64Encode(l_0_3)
AppendToRollingQueue("rq_fileremotedrop", l_0_10, l_0_9, 1209600, 100, 1)
local l_0_11 = string.format("MpInternal_researchdata=FileRemoteDropContext=%s", l_0_9)
mp.set_mpattribute(l_0_11)
mp.set_mpattribute("MpDisableCaching")
return mp.INFECTED
