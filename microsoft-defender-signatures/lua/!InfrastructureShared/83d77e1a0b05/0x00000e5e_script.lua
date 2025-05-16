-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\83d77e1a0b05\0x00000e5e_luac 

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
local l_0_4, l_0_5 = (MpCommon.StringRegExpSearch)("(?i)regsvr32.*[-/]s\\s(.*)", l_0_3)
if not l_0_5 then
  return mp.CLEAN
end
l_0_5 = (string.gsub)(l_0_5, "\'", "")
l_0_5 = (string.lower)(l_0_5)
l_0_1.Dll_Path = l_0_5
if not (string.find)(l_0_5, "\\", 1, true) then
  l_0_5 = "\\" .. l_0_5
end
l_0_1.cmdLine = l_0_3
local l_0_6 = GetRollingQueueKeyValues("PFApp_PotentialDownload_Ppid", l_0_0.ppid)
local l_0_7 = false
if l_0_6 then
  l_0_1.ProcessWithPotentialDownload = true
  l_0_1.DownloadCmds = l_0_6
  local l_0_8 = safeJsonSerialize(l_0_1)
  set_research_data("Evidence", (MpCommon.Base64Encode)(l_0_8), false)
  if l_0_8 then
    (MpCommon.BmTriggerSig)(l_0_0.ppid, "APML_SuspRegsvr_A", l_0_8)
  end
  l_0_7 = true
end
do
  local l_0_9, l_0_10 = pcall(MpCommon.RollingQueueQueryMultiKeyRegex, "PFApp_FileDropped_Path", l_0_5)
  if l_0_9 and l_0_10 then
    l_0_1.FileDroppedByATrackedProcess = true
    set_research_data("Evidence", (MpCommon.Base64Encode)(safeJsonSerialize(l_0_1)), false)
    for l_0_14,l_0_15 in ipairs(l_0_10) do
      local l_0_16, l_0_17 = GetAppomalyProcessAttribute(l_0_15.value)
      if l_0_15.key ~= l_0_5 or not "FilePathMatch" then
        l_0_1.Confidence = not l_0_17 or "FileNameMatch"
        l_0_1.Process_Attribute = l_0_17
        do
          local l_0_18 = safeJsonSerialize(l_0_1, 150, nil, true)
          if l_0_18 then
            (MpCommon.BmTriggerSig)(l_0_0.ppid, "APML_SuspRegsvr_C", l_0_18)
          end
          -- DECOMPILER ERROR at PC139: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC139: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
    l_0_7 = true
  end
  local l_0_19, l_0_20 = pcall(MpCommon.RollingQueueQueryMultiKeyRegex, "RQ_RecentExecDropped_MultipleKey_30m", l_0_5)
  if l_0_19 and l_0_20 then
    for l_0_24,l_0_25 in ipairs(l_0_20) do
      if (string.find)(l_0_25.value, "FileAttributes", 1, true) or (string.find)(l_0_25.value, "UnsignedFile", 1, true) then
        l_0_1.FileDroppedRecently = true
        l_0_1.FileInfo = l_0_20
        local l_0_26 = safeJsonSerialize(l_0_1)
        set_research_data("Evidence", (MpCommon.Base64Encode)(l_0_26), false)
        if l_0_26 then
          (MpCommon.BmTriggerSig)(l_0_0.ppid, "APML_SuspRegsvr_D", l_0_26)
        end
        l_0_7 = true
      end
    end
  end
  do
    if l_0_7 then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

