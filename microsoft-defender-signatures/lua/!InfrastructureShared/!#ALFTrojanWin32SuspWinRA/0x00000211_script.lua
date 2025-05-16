-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin32SuspWinRA\0x00000211_luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
if l_0_1 then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_2 then
  l_0_2 = (string.lower)(l_0_2)
  if not (string.find)(l_0_2, "^powershell", 1, false) and not (string.find)(l_0_2, "pwsh.exe", 1, true) then
    return mp.CLEAN
  end
end
local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = (mp.GetProcessCommandLine)(l_0_3)
if not l_0_4 or l_0_4 == "" then
  return mp.CLEAN
end
if (string.find)(l_0_4, ".ps1", 1, true) or (string.find)(l_0_4, " -file ", 1, true) or (string.find)(l_0_4, " -WorkingDirectory ", 1, true) then
  return mp.CLEAN
end
local l_0_5 = (mp.GetParentProcInfo)(l_0_3)
if not l_0_5 or not l_0_5.ppid then
  return mp.CLEAN
end
local l_0_6 = (MpCommon.GetImagePathFromPid)(l_0_5.ppid)
if l_0_6 then
  l_0_6 = (string.lower)(l_0_6)
  if not (string.find)(l_0_6, "\\explorer.exe", 1, false) then
    return mp.CLEAN
  end
else
  return mp.CLEAN
end
local l_0_7 = 0
local l_0_8 = {}
local l_0_9 = tostring(headerpage) .. tostring(footerpage)
if hasBase64Content(l_0_9) or hasBase64Content(l_0_4) then
  l_0_8.Base64Content = true
  l_0_7 = l_0_7 + 10
end
if hasURLEncodedContent(l_0_4) then
  l_0_8.UrlEncodedContent = true
  l_0_7 = l_0_7 + 10
end
if hasTamperingCmd(l_0_9) then
  l_0_7 = l_0_7 + 5
  l_0_8.TamperingCmd = true
end
local l_0_10, l_0_11 = CommandLineGrader(l_0_9, true, 2)
if l_0_10 == 0 or not l_0_11 then
  return mp.CLEAN
end
if l_0_11.CommandlineTokens and not next(l_0_11.CommandlineTokens) then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC200: Unhandled construct in 'MakeBoolean' P1

if (l_0_11.Evidence_L1).IsRemoteSession and l_0_7 <= 11 then
  return mp.CLEAN
end
if l_0_7 < 5 then
  return mp.CLEAN
end
l_0_8.Parents = add_parents_AMSI()
if #l_0_8.Parents > 2 then
  return mp.CLEAN
end
if (string.find)(next(l_0_8.Parents), "\\WindowsApps\\", 1, true) then
  return mp.CLEAN
end
if l_0_10 then
  l_0_7 = l_0_7 + l_0_10
end
l_0_8.CommandLineGradingInfo = l_0_11
local l_0_12, l_0_13 = safeJsonSerialize(l_0_8, 150, nil, true)
if not l_0_12 then
  set_research_data("Error", "Error Serializing Evidence Data" .. (MpCommon.Base64Encode)(l_0_13), false)
  return mp.INFECTED
else
  ;
  (MpCommon.BmTriggerSig)(l_0_3, "LUA:SuspWinR", l_0_12)
end
return mp.CLEAN

