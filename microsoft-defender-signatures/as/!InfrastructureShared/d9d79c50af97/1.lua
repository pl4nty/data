-- Threat: !InfrastructureShared
-- Name: d9d79c50af97
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib, AppomalyHelpers

local l_0_0 = {}
local l_0_1 = mp.GetScannedPPID()
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = mp.GetProcessCommandLine(l_0_1)
local l_0_3, l_0_4 = MpCommon.StringRegExpSearch("(?i)regsvr32.*[-/]s\\s(.*)", l_0_2)
if not l_0_4 then
  return mp.CLEAN
end
l_0_4 = string.gsub(l_0_4, "'", "")
l_0_4 = string.lower(l_0_4)
l_0_0.Dll_Path = l_0_4
if not string.find(l_0_4, "\\", 1, true) then
  l_0_4 = "\\" .. l_0_4
end
l_0_0.cmdLine = l_0_2
local l_0_5 = 0
local l_0_6 = string.gsub(l_0_4, "\\", "\\\\")
l_0_6 = l_0_6:gsub("([%^%$%(%)%.%[%]%*%+%-%?])", "\\%1")
local l_0_7, l_0_8 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped_MultipleKey_30m", l_0_6)
if l_0_7 and l_0_8 then
  if l_0_8.value then
    l_0_8 = {l_0_8}
  end
  for l_0_9, l_0_10 in ipairs(l_0_8) do
    if string.find(l_0_10.value, "UnsignedFile", 1, true) then
      l_0_0.FileDroppedRecently = true
      l_0_0.FileInfo = l_0_8
      local l_0_11 = string.match(l_0_10.value, "Process_Img(.*)")
      if l_0_11 then
        if contains(l_0_11, {
          "program files",
          "appdata",
          "dllhost.exe",
          "svchost.exe"
        }) then
          l_0_5 = l_0_5 - 40
        end
        if contains(l_0_11, {
          "explorer.exe",
          "WinRAR.exe",
          "7z.exe",
          "curl.exe",
          "wget"
        }) then
          l_0_5 = l_0_5 + 50
        end
      end
      if string.find(l_0_10.value, "FileAttributes", 1, true) then
        local l_0_12 = string.match(l_0_10.value, "%[(.*)%]")
        for l_0_13 in string.gmatch(l_0_12, "([^|]+)") do
          if not string.find(l_0_13, "Aurora.A!rfn") then
            l_0_5 = l_0_5 + 10
          elseif l_0_13 == "SLF:HighRiskHasMotW" then
            l_0_5 = l_0_5 + 100
          end
        end
      end
    end
  end
  if not l_0_0.FileDroppedRecently then
    return mp.CLEAN
  end
else
  return mp.CLEAN
end
if MpCommon.StringRegExpSearch("\\\\(desktop|download|onedrive|document|picture)", l_0_4) then
  l_0_5 = l_0_5 + 50
end
if contains(l_0_4, {
  "program files",
  "appdata"
}) then
  l_0_5 = l_0_5 - 40
end
local l_0_14 = mp.GetParentProcInfo()
if l_0_14 then
  local l_0_15 = GetRollingQueueKeyValues("PFApp_PotentialDownload_Ppid", l_0_14.ppid)
  if l_0_15 then
    l_0_0.ProcessWithPotentialDownload = true
    l_0_0.DownloadCmds = l_0_15
    l_0_5 = l_0_5 + 10
  end
  l_0_0.Parents = add_parents_mp()
end
local l_0_16, l_0_17 = pcall(MpCommon.RollingQueueQueryKeyRegex, "PFApp_FileDropped_Path", l_0_6)
if l_0_16 and l_0_17 then
  l_0_0.FileDroppedByATrackedProcess = true
  if l_0_17.value then
    l_0_17 = {l_0_17}
  end
  for l_0_18, l_0_19 in ipairs(l_0_17) do
    local l_0_20, l_0_21 = GetAppomalyProcessAttribute(l_0_19.value)
    if l_0_21 then
      l_0_0.Confidence = l_0_19.key == l_0_4 and "FilePathMatch" or "FileNameMatch"
      l_0_0.Process_Attribute = l_0_21
      break
    end
  end
  l_0_5 = l_0_5 + 10
end
l_0_0.Score = l_0_5
if 10 <= l_0_5 then
  local l_0_22, l_0_23 = safeJsonSerialize(l_0_0, 150, nil, true)
  MpCommon.BmTriggerSig(l_0_14.ppid, "APML_SuspRegsvr_D", l_0_22 or l_0_23)
end
return mp.CLEAN
