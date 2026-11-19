-- Threat: !InfrastructureShared
-- Name: !#ALF:NewExecContext.J!hva
-- Type: 11
-- Includes: ResearchData, LuaFuncHelper, BMLuaLib, TechniqueTracker, HvaLookupHelpers
-- MpAttributes: Lua:AnomalyImphashNew & MpNewlyCreatedHint

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = IsDeviceHVAWithAD()
if l_0_1 ~= true then
  return mp.CLEAN
end
local l_0_2 = {}
l_0_2.SigName = "NewExecContext"
local l_0_3, l_0_4 = pcall(MpCommon.QuerySessionInformation, l_0_0, MpCommon.WTSIsRemoteSession)
l_0_4 = l_0_3 and l_0_4 or "FALSE"
l_0_2.isRemote = tostring(l_0_4)
local l_0_5, l_0_6 = pcall(MpCommon.QuerySessionInformation, l_0_0, MpCommon.WTSDomainName)
if l_0_5 and l_0_6 and l_0_6 ~= "" then
  local l_0_7 = scrubData(l_0_6)
  l_0_2.DomainName = tostring(l_0_7)
end
local l_0_8, l_0_9 = pcall(MpCommon.QuerySessionInformation, l_0_0, MpCommon.WTSUserName)
if l_0_8 and l_0_9 and l_0_9 ~= "" then
  local l_0_10 = scrubData(l_0_9)
  l_0_2.UserName = tostring(l_0_10)
end
local l_0_11, l_0_12 = pcall(MpCommon.QuerySessionInformation, l_0_0, MpCommon.WTSClientAddress)
if l_0_11 and l_0_12 and l_0_12 ~= "" then
  local l_0_13 = scrubData(l_0_12)
  l_0_2.IP = tostring(l_0_13)
end
local l_0_14, l_0_15 = pcall(MpCommon.QuerySessionInformation, l_0_0, MpCommon.WTSClientName)
if l_0_14 and l_0_15 and l_0_15 ~= "" then
  local l_0_16 = scrubData(l_0_15)
  l_0_2.ClientName = tostring(l_0_16)
end
local l_0_17 = "|psexesvc.exe|dllhost.exe|rundll32.exe|regsvr32.exe|wmiprvse.exe|winrshost.exe|wsmprovhost.exe|cmd.exe|powershell.exe|pwsh.exe|console.exe|bash.exe|services.exe|explorer.exe|svchost.exe|"
local l_0_18, l_0_19 = checkParentProcessNameFromListByPPIDRecursive(l_0_0, l_0_17, 2)
if not l_0_18 or not l_0_19 then
  local l_0_20 = mp.GetParentProcInfo(l_0_0)
  if l_0_20 ~= nil then
    l_0_2.Parent = string.lower(l_0_20.image_path)
  else
    l_0_2.Parent = "Untracked"
  end
else
  l_0_2.Parent = l_0_19
end
set_research_data("HVASessionInfo", safeJsonSerialize(l_0_2), false)
return mp.INFECTED
