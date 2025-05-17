-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\29d7e663b0a5\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
local l_0_1 = {}
l_0_1.Parents = add_parents_mp()
local l_0_2 = (mp.GetScannedPPID)()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (mp.GetProcessCommandLine)(l_0_2)
local l_0_4, l_0_5 = (MpCommon.StringRegExpSearch)("(?i)rundll32(?:.exe)?\\s(.*?),", l_0_3)
if not l_0_5 then
  return mp.CLEAN
end
l_0_5 = (string.gsub)(l_0_5, "\'", "")
l_0_5 = (string.lower)(l_0_5)
if (string.find)(l_0_5, "\\windows\\system32\\", 1, true) then
  return mp.CLEAN
end
l_0_1.Dll_Path = l_0_5
if not (string.find)(l_0_5, "\\", 1, true) then
  l_0_5 = "\\" .. l_0_5
end
local l_0_6 = GetRollingQueueKeyValues("PFApp_PotentialDownload_Ppid", l_0_0.ppid)
if l_0_6 then
  l_0_1.ProcessWithPotentialDownload = true
  l_0_1.DownloadCmds = l_0_6
  local l_0_7 = safeJsonSerialize(l_0_1)
  set_research_data("Evidence", (MpCommon.Base64Encode)(l_0_7), false)
  if l_0_7 then
    (MpCommon.BmTriggerSig)(l_0_0.ppid, "APML_SuspRundll_A", l_0_7)
  end
  return mp.INFECTED
end
do
  local l_0_8, l_0_9 = pcall(MpCommon.RollingQueueQueryMultiKeyRegex, "PFApp_FileDropped_Path", l_0_5)
  if l_0_8 and l_0_9 then
    l_0_1.FileDroppedByATrackedProcess = true
    set_research_data("Evidence", (MpCommon.Base64Encode)(safeJsonSerialize(l_0_1)), false)
    for l_0_13,l_0_14 in ipairs(l_0_9) do
      local l_0_15, l_0_16 = GetAppomalyProcessAttribute(l_0_14.value)
      if l_0_14.key ~= l_0_5 or not "FilePathMatch" then
        l_0_1.Confidence = not l_0_16 or "FileNameMatch"
        l_0_1.Process_Attribute = l_0_16
        if l_0_16.AppName == "OneDrive" and (string.find)(l_0_5, "shell32.dll") then
          return mp.CLEAN
        end
        do
          local l_0_17 = safeJsonSerialize(l_0_1, 150, nil, true)
          if l_0_17 then
            (MpCommon.BmTriggerSig)(l_0_0.ppid, "APML_SuspRundll_C", l_0_17)
          end
          -- DECOMPILER ERROR at PC164: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC164: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
    return mp.INFECTED
  end
  local l_0_18, l_0_19 = pcall(MpCommon.RollingQueueQueryMultiKeyRegex, "RQ_RecentExecDropped_MultipleKey_30m", l_0_5)
  if l_0_18 and l_0_19 then
    for l_0_23,l_0_24 in ipairs(l_0_19) do
      if (string.find)(l_0_24.value, "FileAttributes", 1, true) or (string.find)(l_0_24.value, "UnsignedFile", 1, true) then
        l_0_1.FileDroppedRecently = true
        l_0_1.FileInfo = l_0_19
        local l_0_25 = safeJsonSerialize(l_0_1)
        set_research_data("Evidence", (MpCommon.Base64Encode)(l_0_25), false)
        if l_0_25 then
          (MpCommon.BmTriggerSig)(l_0_0.ppid, "APML_SuspRundll_D", l_0_25)
        end
        return mp.INFECTED
      end
    end
  end
  do
    return mp.CLEAN
  end
end

