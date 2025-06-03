-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\49d7f78ede24\1.luac 

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
local l_0_6 = 0
local l_0_7 = (string.gsub)(l_0_5, "\\", "\\\\")
l_0_7 = l_0_7:gsub("([%^%$%(%)%.%[%]%*%+%-%?])", "\\%1")
local l_0_8, l_0_9 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped_MultipleKey_30m", l_0_7)
if l_0_8 and l_0_9 then
  for l_0_13,l_0_14 in ipairs(l_0_9) do
    if (string.find)(l_0_14.value, "UnsignedFile", 1, true) then
      l_0_1.FileDroppedRecently = true
      l_0_1.FileInfo = l_0_9
      if (string.find)(l_0_14.value, "FileAttributes", 1, true) then
        local l_0_15 = (string.match)(l_0_14.value, "%[(.*)%]")
        for l_0_19 in (string.gmatch)(l_0_15, "([^|]+)") do
          if l_0_19 ~= "SLF:Aurora.A!rfn" then
            l_0_6 = l_0_6 + 1
          end
        end
      end
    end
  end
  if not l_0_1.FileDroppedRecently then
    return mp.CLEAN
  end
else
  return mp.CLEAN
end
local l_0_20 = nil
if GetRollingQueueKeyValues("PFApp_PotentialDownload_Ppid", l_0_0.ppid) then
  l_0_1.ProcessWithPotentialDownload = true
  l_0_1.DownloadCmds = GetRollingQueueKeyValues("PFApp_PotentialDownload_Ppid", l_0_0.ppid)
  l_0_6 = l_0_6 + 10
end
l_0_20 = pcall
l_0_20 = l_0_20(MpCommon.RollingQueueQueryMultiKeyRegex, "PFApp_FileDropped_Path", l_0_5)
local l_0_21, l_0_22 = nil
if l_0_20 and l_0_21 then
  l_0_1.FileDroppedByATrackedProcess = true
  l_0_22 = set_research_data
  l_0_22("Evidence", (MpCommon.Base64Encode)(safeJsonSerialize(l_0_1)), false)
  l_0_22 = ipairs
  l_0_22 = l_0_22(l_0_21)
  for l_0_26,l_0_27 in l_0_22 do
    local l_0_27 = nil
    l_0_27 = GetAppomalyProcessAttribute
    l_0_27 = l_0_27(l_0_26.value)
    local l_0_28, l_0_29 = nil
    if l_0_28 then
      l_0_29 = l_0_26.key
      if l_0_29 == l_0_5 then
        l_0_29 = "FilePathMatch"
      end
      if not l_0_29 then
        l_0_29 = "FileNameMatch"
      end
      l_0_1.Confidence = l_0_29
      l_0_1.Process_Attribute = l_0_28
      l_0_29 = l_0_28.AppName
      if l_0_29 == "OneDrive" then
        l_0_29 = string
        l_0_29 = l_0_29.find
        l_0_29 = l_0_29(l_0_5, "shell32.dll")
        if l_0_29 then
          l_0_29 = mp
          l_0_29 = l_0_29.CLEAN
          return l_0_29
        end
      end
      l_0_6 = l_0_6 + 10
    end
  end
end
do
  l_0_1.Score = l_0_6
  local l_0_30, l_0_31 = nil
  -- DECOMPILER ERROR at PC214: Overwrote pending register: R15 in 'AssignReg'

  local l_0_32 = nil
  local l_0_33 = nil
  local l_0_34 = nil
  do
    l_0_34 = safeJsonSerialize(l_0_1, 150, nil, true) or l_0_30
    l_0_31(l_0_32, l_0_33, l_0_34)
    -- DECOMPILER ERROR at PC221: Overwrote pending register: R15 in 'AssignReg'

    -- DECOMPILER ERROR at PC222: Overwrote pending register: R15 in 'AssignReg'

    do return l_0_31 end
    -- DECOMPILER ERROR at PC224: Confused about usage of register R13 for local variables in 'ReleaseLocals'

  end
end

