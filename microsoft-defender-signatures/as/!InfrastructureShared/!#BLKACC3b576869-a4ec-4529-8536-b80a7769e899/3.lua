-- Threat: !InfrastructureShared
-- Name: !#BLKACC:3b576869-a4ec-4529-8536-b80a7769e899
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_CONTAINER_FILE

if not mp.IsHipsRuleEnabled("3b576869-a4ec-4529-8536-b80a7769e899") then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if not l_0_0 or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
local l_0_2 = {
  ["explorer.exe"] = true,
  ["unzip.exe"] = true,
  ["rar.exe"] = true,
  ["winrar.exe"] = true,
  ["winzip.exe"] = true,
  ["winzip32.exe"] = true,
  ["winzip64.exe"] = true,
  ["7z.exe"] = true,
  ["7zfm.exe"] = true,
  ["7zg.exe"] = true,
  ["irsetup.exe"] = true
}
if l_0_2[l_0_1] ~= true then
  return mp.CLEAN
end
local l_0_3 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
l_0_3 = string.lower(MpCommon.PathToWin32Path(l_0_3))
if not MpCommon.QueryPersistContext(l_0_3, "DroppedByOfficeProc") then
  return mp.CLEAN
end
local l_0_4 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_5 = mp.GetProcessCommandLine(l_0_4)
if l_0_5 == "" or l_0_5 == nil then
  return mp.CLEAN
end
if string.find(string.lower(l_0_5), l_0_3, 1, true) == nil then
  return mp.CLEAN
end
local l_0_6 = l_0_1 .. "+" .. l_0_4
if MpCommon.GetPersistContextCountNoPath("BlockOfficeCreateExecContentProcs") == 0 then
  local l_0_7 = {}
  table.insert(l_0_7, l_0_6)
  MpCommon.SetPersistContextNoPath("BlockOfficeCreateExecContentProcs", l_0_7, 0)
elseif not MpCommon.QueryPersistContextNoPath("BlockOfficeCreateExecContentProcs", l_0_6) then
  MpCommon.AppendPersistContextNoPath("BlockOfficeCreateExecContentProcs", l_0_6, 0)
end
return mp.CLEAN
