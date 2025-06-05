-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a3d7c6ac0fbc\1.luac 

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
local l_0_6 = 0
local l_0_7 = (string.gsub)(l_0_5, "\\", "\\\\")
l_0_7 = l_0_7:gsub("([%^%$%(%)%.%[%]%*%+%-%?])", "\\%1")
local l_0_8, l_0_9 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped_MultipleKey_30m", l_0_7)
if l_0_8 and l_0_9 then
  do
    if l_0_9.value then
      local l_0_10 = {}
      -- DECOMPILER ERROR at PC84: No list found for R10 , SetList fails

    end
    -- DECOMPILER ERROR at PC87: Overwrote pending register: R11 in 'AssignReg'

    for l_0_14,l_0_15 in ipairs(l_0_9) do
      if (string.find)(l_0_15.value, "UnsignedFile", 1, true) then
        l_0_1.FileDroppedRecently = true
        l_0_1.FileInfo = l_0_9
        if (string.find)(l_0_15.value, "FileAttributes", 1, true) then
          local l_0_16 = (string.match)(l_0_15.value, "%[(.*)%]")
          for l_0_20 in (string.gmatch)(l_0_16, "([^|]+)") do
            if l_0_20 ~= "SLF:Aurora.A!rfn" then
              l_0_6 = l_0_6 + 1
            end
          end
        end
      end
    end
    if not l_0_1.FileDroppedRecently then
      return mp.CLEAN
    end
    do return mp.CLEAN end
    local l_0_21 = nil
    if GetRollingQueueKeyValues("PFApp_PotentialDownload_Ppid", l_0_0.ppid) then
      l_0_1.ProcessWithPotentialDownload = true
      l_0_1.DownloadCmds = GetRollingQueueKeyValues("PFApp_PotentialDownload_Ppid", l_0_0.ppid)
      l_0_6 = l_0_6 + 10
    end
    l_0_21 = pcall
    l_0_21 = l_0_21(MpCommon.RollingQueueQueryMultiKeyRegex, "PFApp_FileDropped_Path", l_0_5)
    local l_0_22, l_0_23 = nil
    if l_0_21 and l_0_22 then
      l_0_1.FileDroppedByATrackedProcess = true
      l_0_23 = ipairs
      l_0_23 = l_0_23(l_0_22)
      for l_0_27,l_0_28 in l_0_23 do
        local l_0_28 = nil
        l_0_28 = GetAppomalyProcessAttribute
        l_0_28 = l_0_28(l_0_27.value)
        local l_0_29, l_0_30 = nil
        if l_0_29 then
          do
            do
              l_0_30 = l_0_27.key
              if l_0_30 == l_0_5 then
                l_0_30 = "FilePathMatch"
              end
              if not l_0_30 then
                l_0_30 = "FileNameMatch"
              end
              l_0_1.Confidence = l_0_30
              l_0_1.Process_Attribute = l_0_29
              do break end
              -- DECOMPILER ERROR at PC177: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC177: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC177: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
      l_0_6 = l_0_6 + 10
    end
    l_0_1.Score = l_0_6
    local l_0_31, l_0_32 = nil
    -- DECOMPILER ERROR at PC188: Overwrote pending register: R15 in 'AssignReg'

    local l_0_33 = nil
    local l_0_34 = nil
    local l_0_35 = nil
    do
      l_0_35 = safeJsonSerialize(l_0_1, 150, nil, true) or l_0_31
      l_0_32(l_0_33, l_0_34, l_0_35)
      -- DECOMPILER ERROR at PC195: Overwrote pending register: R15 in 'AssignReg'

      -- DECOMPILER ERROR at PC196: Overwrote pending register: R15 in 'AssignReg'

      do return l_0_32 end
      -- DECOMPILER ERROR at PC198: Confused about usage of register R13 for local variables in 'ReleaseLocals'

    end
  end
end

