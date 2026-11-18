-- Threat: !InfrastructureShared
-- Name: !#BM_RemoteInvocation:FileRemoteOpenExecuteContext
-- Type: 11
-- Includes: TechniqueTracker, LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & MpOnOpenRtpScan & MpIsCreateProcessScan

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)) or ""
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID) or ""
if l_0_0 == "" or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = MpCommon.Base64Encode(l_0_0)
local l_0_3 = GetRollingQueueKeyValue("rq_fileremotedrop", l_0_2)
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = "|psexesvc.exe|dllhost.exe|rundll32.exe|regsvr32.exe|wmiprvse.exe|winrshost.exe|wsmprovhost.exe|cmd.exe|powershell.exe|pwsh.exe|console.exe|bash.exe|services.exe|explorer.exe|svchost.exe|"
local l_0_5, l_0_6 = checkParentProcessNameFromListByPPIDRecursive(l_0_1, l_0_4, 5)
if not l_0_5 or not l_0_6 then
  return mp.CLEAN
end
local l_0_7, l_0_8 = pcall(MpCommon.QuerySessionInformation, l_0_1, MpCommon.WTSIsRemoteSession)
l_0_8 = l_0_7 and l_0_8 or "FALSE"
local l_0_9 = l_0_6 .. "|isRemote=" .. tostring(l_0_8)
local l_0_10, l_0_11 = pcall(MpCommon.QuerySessionInformation, l_0_1, MpCommon.WTSDomainName)
local l_0_12, l_0_13 = pcall(MpCommon.QuerySessionInformation, l_0_1, MpCommon.WTSUserName)
local l_0_14, l_0_15 = pcall(MpCommon.QuerySessionInformation, l_0_1, MpCommon.WTSClientAddress)
if l_0_10 and l_0_11 and l_0_11 ~= "" then
  l_0_9 = l_0_9 .. "|" .. crypto.Sha1Buffer(l_0_11, 0, #l_0_11)
else
  l_0_9 = l_0_9 .. "|NO_DOMAIN"
end
if l_0_12 and l_0_13 and l_0_13 ~= "" then
  l_0_9 = l_0_9 .. "|" .. crypto.Sha1Buffer(l_0_13, 0, #l_0_13)
else
  l_0_9 = l_0_9 .. "|NO_USER"
end
if l_0_14 and l_0_15 and type(l_0_15) == "table" then
  l_0_9 = l_0_9 .. "|" .. tostring(l_0_15.Address)
else
  l_0_9 = l_0_9 .. "|" .. tostring(l_0_15)
end
mp.set_mpattribute(string.format("MpInternal_researchdata=FileRemoteDropContext=%s", l_0_3))
mp.set_mpattribute(string.format("MpInternal_researchdata=FileRemoteOpenExecuteContext=%s", l_0_9))
return mp.INFECTED
