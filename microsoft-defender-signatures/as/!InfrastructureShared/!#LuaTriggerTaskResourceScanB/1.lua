-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaTriggerTaskResourceScanB\1.luac 

-- params : ...
-- function num : 0
do
  local l_0_0 = versioning and (versioning.GetCloudBlockLevel)() or 0
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 < 4 and not (MpCommon.IsSampled)(60000, false, true, false) then
    return mp.CLEAN
  end
  local l_0_1 = nil
  do
    if (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME) ~= nil and #(mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME) > 5 then
      local l_0_2 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME))
      if ("|explorer.exe|"):find(l_0_2) then
        return mp.CLEAN
      end
    end
    local l_0_3 = nil
    local l_0_4 = nil
    if (string.match)(tostring(headerpage), "<Exec>.*<Command>(.*)</Command>.*</Exec>") == nil then
      return mp.CLEAN
    end
    local l_0_5 = nil
    if (string.match)(l_0_4, "<Exec>.*<WorkingDirectory>(.*)</WorkingDirectory>.*</Exec>") ~= nil and ((string.match)(l_0_4, "<Exec>.*<WorkingDirectory>(.*)</WorkingDirectory>.*</Exec>")):sub(-1) ~= "\\" then
      local l_0_6 = (string.match)(l_0_4, "<Exec>.*<WorkingDirectory>(.*)</WorkingDirectory>.*</Exec>") .. "\\"
      local l_0_7 = l_0_5
      if (string.match)(l_0_4, "<Exec>.*<Arguments>(.*)</Arguments>.*</Exec>") ~= nil then
        l_0_7 = l_0_7 .. " " .. (string.match)(l_0_4, "<Exec>.*<Arguments>(.*)</Arguments>.*</Exec>")
      end
      if isCommonScheduledTaskCommand(l_0_7) == true then
        return mp.CLEAN
      end
      ;
      (mp.vfo_add_buffer)(l_0_7, "[TaskCommand]", 0)
      local l_0_8 = nil
      ;
      (table.insert)({}, l_0_7)
      -- DECOMPILER ERROR at PC110: Confused about usage of register: R7 in 'UnsetPending'

      ;
      (MpCommon.SetPersistContextNoPath)("Lua:SchedTaskCommand", {}, 100)
      TrackCommandLineAndTechnique(l_0_7, "T1053.005:schtask_target")
      TrackCommandLineAndTechnique(l_0_7, "LuaTriggerTaskResourceScanB")
      if l_0_6 ~= nil then
        TrackCommandLineAndTechnique(l_0_6 .. l_0_7, "T1053.005:schtask_target")
      else
        TrackCommandLineAndTechnique("c:\\windows\\system32\\" .. l_0_7, "T1053.005:schtask_target")
        TrackCommandLineAndTechnique("c:\\windows\\" .. l_0_7, "T1053.005:schtask_target")
      end
      local l_0_9 = nil
      for l_0_13,l_0_14 in ipairs(get_filepaths_from_string(l_0_7, l_0_6)) do
        local l_0_10 = nil
        -- DECOMPILER ERROR at PC152: Confused about usage of register: R13 in 'UnsetPending'

        if (string.find)((string.lower)(R13_PC152), "windows\\ccmcache\\", 1, true) or (string.find)((string.lower)(R13_PC152), "\\sysvol\\", 1, true) or (string.find)((string.lower)(R13_PC152), "\\netlogon\\", 1, true) or (string.find)((string.lower)(R13_PC152), "\\support10$\\", 1, true) then
          return mp.CLEAN
        end
        if isCommonScheduledTaskFile((string.lower)(R13_PC152)) == true then
          return mp.CLEAN
        end
        if (sysio.IsFileExists)(l_0_15) then
          local l_0_16, l_0_17 = , pcall(mp.IsKnownFriendlyFile, l_0_15, false, false)
          if l_0_17 then
            if mp.IsKnownFriendlyFile then
              (mp.ReportLowfi)(l_0_15, 2557680683)
            else
              ;
              (mp.ReportLowfi)(l_0_15, 3998179614)
              AppendToRollingQueue("ScheduledTaskRelatedFileA", l_0_15, l_0_7)
            end
          end
          local l_0_18 = nil
          if not (MpCommon.QueryPersistContext)(l_0_15, "SuspPathsFromSchTask") then
            (MpCommon.AppendPersistContext)(l_0_15, "SuspPathsFromSchTask", 3600)
          end
        end
      end
      return mp.INFECTED
    end
  end
end

